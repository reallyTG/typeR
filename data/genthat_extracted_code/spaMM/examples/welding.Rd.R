library(spaMM)


### Name: welding
### Title: Welding data set
### Aliases: welding
### Keywords: datasets

### ** Examples

data("welding")
## toy example from Smyth et al.
HLfit(Strength ~ Drying + Material,resid.model = ~ Material+Preheating ,data=welding)
## toy example of overparameterized model
HLfit(Strength ~ Rods+Thickness*Angle+(1|Rods),resid.model = ~ Rods+Thickness*Angle ,data=welding)



