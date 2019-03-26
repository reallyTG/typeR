library(cheddar)


### Name: TLP
### Title: A single trophic-link property
### Aliases: TLP
### Keywords: utilities

### ** Examples

# Skipwith Pond has a first-class property called link.evidence
data(SkipwithPond)
TLP(SkipwithPond, 'link.evidence') 

# Benguela has a first-class property called diet.fraction
data(Benguela) 
TLP(Benguela, 'diet.fraction') 

# All NA
TLP(SkipwithPond, 'not a property') 



