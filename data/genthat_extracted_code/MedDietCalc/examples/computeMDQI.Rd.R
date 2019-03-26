library(MedDietCalc)


### Name: computeMDQI
### Title: computeMDQI
### Aliases: computeMDQI

### ** Examples

data(nutriSample)

# If Saturated Fats are provided as the energy they provide,
# and Kcal arguments informs about total energy intake:
MedDiet <- computeMDQI(data = nutriSample,
                      FruitAndVegetables = P50grCom + P52grCom + P41grCom + P42grCom,
                      OliveOil = Aceitegr,
                      OOmeasure = "gr",
                      Fish = P35grCom + P36grCom + P37grCom + P38grCom,
                      Cereals = P55grCom + P56grCom + P57grCom + P59grCom +
                                P60grCom + P61grCom + P62grCom,
                      Meat = P29grCom + P30grCom + P31grCom + P32grCom,
                      SatFats = totalGrasaSat,
                      Cholesterol = totalCol,
                      Kcal = totalKcal,
                      invert = TRUE,
                      frequency = "daily", output = "percent", rm.na = FALSE)


# If Saturated Fats are provided as the percent of energy they provide, so Kcal is not provided:
nutriSample$MySFApercent <- 100 * nutriSample$totalGrasaSat / nutriSample$totalKcal

MedDiet2 <- computeMDQI(data = nutriSample,
                      FruitAndVegetables = P50grCom + P52grCom + P41grCom + P42grCom,
                      OliveOil = Aceitegr,
                      OOmeasure = "gr",
                      Fish = P35grCom + P36grCom + P37grCom + P38grCom,
                      Cereals = P55grCom + P56grCom + P57grCom + P59grCom +
                                P60grCom + P61grCom + P62grCom,
                      Meat = P29grCom + P30grCom + P31grCom + P32grCom,
                      SatFats = MySFApercent,
                      Cholesterol = totalCol,
                      # don't provide Kcal
                      invert = TRUE,
                      frequency = "daily", output = "percent", rm.na = FALSE)

hist(MedDiet2)



