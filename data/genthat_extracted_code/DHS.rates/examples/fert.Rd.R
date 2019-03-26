library(DHS.rates)


### Name: fert
### Title: Calculates fertility indicators based on the Demographic and
###   Health Surveys (DHS).
### Aliases: fert

### ** Examples

# Calculate TFR and estimate Jackknife SE based on all women AWIR70 data

data("AWIR70")
Total_Fertility_Rate <- fert(
 AWIR70,
 Indicator = "tfr",
 JK = "Yes"
)

# Calculate GFR and estimate SE based on ever-married women EMIR70 data

data("EMIR70")
General_Fertility_Rate <- fert(
 EMIR70,
 Indicator = "gfr",
 EverMW = "YES",
 AWFact = "awfactt"
)

# Calculate Urban/Rural level ASFR and estimate SE based on all women AWIR70 data

data("AWIR70")
Age_Specific_Fertility_Rate <- fert(
 AWIR70,
 Indicator = "asfr",
 Class = "v025"
)




