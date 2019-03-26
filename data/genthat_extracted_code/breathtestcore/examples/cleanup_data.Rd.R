library(breathtestcore)


### Name: cleanup_data
### Title: Transforms 13C breath data into a clean format for fitting
### Aliases: cleanup_data

### ** Examples

options(digits = 4)
# Full manual
minute = seq(0,30, by = 10)
data1 = data.frame(minute, 
   pdr = exp_beta(minute, dose = 100, m = 30,  k = 0.01, beta = 2))
# Two columns with data at t = 0
data1
# Four columns with data at t = 0.01
cleanup_data(data1)

# Results from simulate_breathtest_data can be passed directly to cleanup_data
cleanup_data(simulate_breathtest_data(3))
# .. which implicitly does
cleanup_data(simulate_breathtest_data(3)$data)

# Use simulated data
data2 = list(
  Z = simulate_breathtest_data(seed = 10)$data,
  Y = simulate_breathtest_data(seed = 11)$data)
d = cleanup_data(data2)
str(d)
unique(d$patient_id)
unique(d$group)
# "Z" "Y"

# Mix multiple input formats
f1 = btcore_file("350_20043_0_GER.txt")
f2 = btcore_file("IrisMulti.TXT")
f3 = btcore_file("IrisCSV.TXT")
# With a named list, the name is used as a group parameter
data = list(A = read_breathid(f1), B = read_iris(f2), C = read_iris_csv(f3)) 
d = cleanup_data(data)
str(d)
unique(d$patient_id)
# "350_20043_0_GER" "1871960"         "123456"
# File name is used as patient name if none is available
unique(d$group)
# "A" "B" "C"



