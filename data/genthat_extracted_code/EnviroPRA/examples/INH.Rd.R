library(EnviroPRA)


### Name: INH
### Title: Inhalation of resuspended soil particles
### Aliases: INH
### Keywords: methods

### ** Examples


# Estimated dose for the estimation of carcinogenic effects due to the 
# inhalation of soil particles  that contains 45 mg/Kg of As in a residencial 
# scenario (default EPA Maximum Reasonable Exposure parameters)

INH(C= 45, AT = 365*70)

# For non-carcinogenic effects:

INH(C= 45)



