library(EnviroPRA)


### Name: HI
### Title: Hazard Index
### Aliases: HI
### Keywords: methods

### ** Examples


# Assessing if there is systemic risk for an adult receptor that drinks water with 1000 ug/L 
# of hexaclorobence (Reference Dose (IRIS data base) = 8e-04 [mg/Kg*day]) in a residencial 
# scenario (default EPA Maximum Reasonable Exposure parameters)


HI (I = DWIR( CW=1, AT=24*365), RFD = 8e-04) 



