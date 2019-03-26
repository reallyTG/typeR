library(EnviroPRA)


### Name: RISK
### Title: Risk
### Aliases: RISK
### Keywords: methods

### ** Examples

# Assessing if there is carcinogenic risk for an adult receptor that drinks water with 1000 ug/L 
# of hexaclorobence (Oral Slope Factor (IRIS data base) = 1.6 [mg/Kg*day]^-1) in a residencial 
# scenario (default EPA Maximum Reasonable Exposure parameters)


RISK (I = DWIR( CW=1), SF = 1.6) 



