library(EnviroPRA)


### Name: RISKdermal
### Title: Risk for dermal contact
### Aliases: RISKdermal
### Keywords: methods

### ** Examples

# Assess if there is carcinogenic risk for an dadult thorug dermal 
# contact exposed to a soil that contains 45 mg/Kg of As in a residencial 
# scenario (default EPA Maximum Reasonable Exposure parameters)

SFAs = 1.5

# Dermal Absorption Factor

ABSAs = 3e-02

# Gastrointestinal Absorption Factor

GIAs = 1

I = AD (CS = 45,ABS = ABSAs)

RISKdermal (AD = I, SF = SFAs, GI = GIAs)


