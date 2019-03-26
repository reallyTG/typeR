library(MedDietCalc)


### Name: computePitsavos
### Title: computePitsavos
### Aliases: computePitsavos

### ** Examples

data(nutriSample)


MedDiet <- computePitsavos(data = nutriSample,
  WholeCereals = P56rac + ifelse(nutriSample$P63_2 == 2, nutriSample$P61rac, 0),
  Fruit = P50rac + P52rac,
  Vegetables = P41rac + P42rac,
  Potatoes = P43rac + P44rac + P45rac,
  Legumes = P46rac,
  OliveOil = Aceitegr,
  OOmeasure = "gr",
  Fish = P35rac + P36rac + P37rac + P38rac,
  Meat = P29rac + P30rac + P31rac + P32rac,
  Poultry = P33rac,
  WholeDairy = P19grCom + P22grCom,
  Wine = P96rac,
  output = "percent", frequency = "daily", rm.na = FALSE)

hist(MedDiet)




