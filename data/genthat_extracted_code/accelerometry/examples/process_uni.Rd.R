library(accelerometry)


### Name: process_uni
### Title: Process Uniaxial Minute-to-Minute Accelerometer Data
### Aliases: process_uni

### ** Examples

# Note that the 'unidata' dataset contains accelerometer data for first 5 
# subjects in NHANES 2003-2004

# Get data from ID number 21005
id.part1 <- unidata[unidata[, "seqn"] == 21005, "seqn"]
counts.part1 <- unidata[unidata[, "seqn"] == 21005, "paxinten"]

# Process data from ID 21005 and request per-day variables
accel.days <- process_uni(
  counts = counts.part1, 
  id = id.part1, 
  return_form = "daily"
)

# Repeat, but request averages across all valid days
accel.averages <- process_uni(
  counts = counts.part1, 
  id = id.part1, 
  return_form = "averages"
)
                          
# Process data according to methods used in NCI's SAS programs
accel.nci1 <- process_uni(
  counts = counts.part1, 
  id = id.part1, 
  brevity = 2, 
  valid_days = 4, 
  cpm_nci = TRUE, 
  days_distinct = TRUE, 
  nonwear_tol = 2, 
  nonwear_tol_upper = 100,
  nonwear_nci = TRUE, 
  weartime_maximum = 1440,
  active_bout_tol = 2, 
  active_bout_nci = TRUE, 
  artifact_thresh = 32767,
  artifact_action = 3, 
  return_form = "averages"
)
                          
# Repeat, but use nci_methods input for convenience
accel.nci2 <- process_uni(
  counts = counts.part1, 
  id = id.part1, 
  nci_methods = TRUE, 
  brevity = 2, 
  return_form = "averages"
)
                          
# Results are identical
all.equal(accel.nci1, accel.nci2)





