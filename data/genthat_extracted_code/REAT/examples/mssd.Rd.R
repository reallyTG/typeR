library(REAT)


### Name: mssd
### Title: Mean square successive difference
### Aliases: mssd

### ** Examples

data1 <- c(10,10,10,20,20,20,30,30,30)
# stable growth
data2 <- c(20,10,30,10,30,20,30,20,10)
# high variability

# Means:
mean2(data1)
mean2(data2)
# Same means

# Standard deviation:
sd2(data1)
sd2(data2)
# Coefficient of variation:
cv(data1)
cv(data2)
# Measures of statistical dispersion are equal

mssd(data1)
mssd(data2)
# high differences in variability



