library(afpt)


### Name: computeChemicalPower
### Title: Convert mechanical power to chemical power
### Aliases: computeChemicalPower computeChemicalPower.power.mechanical
###   computeChemicalPower.numeric

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## for maximum continuous power
power.max <- computeAvailablePower(myBird)
print(power.max)
#   [1] 5.233528

## convert to chemical power
power.max.chem <- computeChemicalPower(power.max,myBird)
print(power.max.chem)
#   [1] 27.28913




