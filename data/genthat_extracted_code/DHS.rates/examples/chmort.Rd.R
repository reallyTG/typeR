library(DHS.rates)


### Name: chmort
### Title: Calculates childhood mortality rates based on the Demographic
###   and Health Surveys (DHS).
### Aliases: chmort

### ** Examples

# Calculate five-year children mortality rates based on ADBR70 data

data("ADBR70")
chmort(
 ADBR70,
 JK = "Yes"
)

# Calculate ten-year children mortality rates based on ADBR70 data

data("ADBR70")
chmort(
 ADBR70,
 JK = "Yes",
 Period = 120
)

# The exposure period ends in June 2011

data("ADBR70")
chmort(
 ADBR70,
 PeriodEnd = "2011-06"
)




