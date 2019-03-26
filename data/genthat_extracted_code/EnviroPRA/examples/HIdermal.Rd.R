library(EnviroPRA)


### Name: HIdermal
### Title: Hazard Index for dermal contact
### Aliases: HIdermal
### Keywords: methods

### ** Examples


# Assess if there is non-carcinogenic risk for an dadult thorug dermal 
# contact exposed to a soil that contains 45 mg/Kg of As in a residencial 
# scenario (default EPA Maximum Reasonable Exposure parameters)

RfDAs = 3e-04

# Dermal Absorption Factor

ABSAs = 3e-02

# Gastrointestinal Absorption Factor

GIAs = 1

I = AD (CS = 45,ABS = ABSAs, AT= 24*365)

HIdermal (AD = I, RFD = RfDAs, GI = GIAs)



