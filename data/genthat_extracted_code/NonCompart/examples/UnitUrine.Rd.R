library(NonCompart)


### Name: UnitUrine
### Title: Retuns a conversion factor for the amount calculation from urine
###   concentration and volume
### Aliases: UnitUrine

### ** Examples

UnitUrine()
UnitUrine("ng/mL", "mL", "mg")
UnitUrine("ug/L", "mL", "mg")
UnitUrine("ug/L", "L", "mg")

UnitUrine("ng/mL", "mL", "g")

UnitUrine("ng/mL", "mL", "mol", MW=500)
UnitUrine("ng/mL", "mL", "mmol", MW=500)
UnitUrine("ng/mL", "mL", "umol", MW=500)



