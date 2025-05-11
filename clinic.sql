-- Create the Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY, -- Department ID
    department_name VARCHAR(100) NOT NULL UNIQUE    -- Department name (unique)
);

-- Create the Patients table
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,   -- Patient ID
    first_name VARCHAR(50) NOT NULL,             -- First name
    last_name VARCHAR(50) NOT NULL,              -- Last name
    date_of_birth DATE NOT NULL,                  -- Date of birth
    phone_number VARCHAR(15) UNIQUE NOT NULL,    -- Phone number (unique)
    email VARCHAR(100) UNIQUE,                   -- Email (optional, unique)
    address VARCHAR(255) NOT NULL                -- Address
);

-- Create the Doctors table
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,    -- Doctor ID
    first_name VARCHAR(50) NOT NULL,             -- First name
    last_name VARCHAR(50) NOT NULL,              -- Last name
    specialty VARCHAR(100) NOT NULL,            -- Specialty
    department_id INT,                           -- Foreign key to Department
    phone_number VARCHAR(15) UNIQUE NOT NULL,    -- Phone number (unique)
    email VARCHAR(100) UNIQUE,                   -- Email (optional, unique)
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) -- Foreign key constraint
);

-- Create the Appointments table
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY, -- Appointment ID
    patient_id INT NOT NULL,                      -- Foreign key to Patients
    doctor_id INT NOT NULL,                       -- Foreign key to Doctors
    appointment_date DATETIME NOT NULL,           -- Date and time
    reason_for_visit TEXT,                       -- Reason for visit
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id), -- Foreign key to Patients
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)   -- Foreign key to Doctors
);

-- Example of adding some departments
INSERT INTO Departments (department_name) VALUES ('Cardiology');
INSERT INTO Departments (department_name) VALUES ('Neurology');
INSERT INTO Departments (department_name) VALUES ('Pediatrics');