library(EnviroPRA)


### Name: AD
### Title: Dermal conctact with chemicals in soil
### Aliases: AD
### Keywords: mehtods

### ** Examples


## Estimated absorbed dose for the estimation of carcinogenic effects using 
# the default variables (EPA 2011) for a chemical soil concentration of 
# 0.2 mg/Kg

AD( CS=0.2)

# For a systemic effect:

AD( CS=0.2, AT=24*365)

# Specifying all the parameters for the carcinogenic case

AD( CS=0.2, SA=2300, AF=0.25, ABS=0.01, EF=150, ED=10, BW=80)



