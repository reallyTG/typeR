library(accelerometry)


### Name: process_tri
### Title: Process Triaxial Minute-to-Minute Accelerometer Data
### Aliases: process_tri

### ** Examples

# Note that the 'tridata' dataset contains 7 days of fake triaxial 
# accelerometer data

# Process data using default parameters and request per-day variables
accel.days <- process_tri(
  counts = tridata, 
  return_form = "daily"
)

# Repeat, but request averages across all valid days
accel.averages <- process_tri(
  counts = tridata,
  return_form = "averages"
)

# Create per-day summary again, but with many more variables
accel.days2 <- process_tri(
  counts = tridata, 
  brevity = 2,
  return_form = "daily"
)
names(accel.days2)





