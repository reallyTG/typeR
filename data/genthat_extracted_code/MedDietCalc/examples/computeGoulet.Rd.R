library(MedDietCalc)


### Name: computeGoulet
### Title: computeGoulet
### Aliases: computeGoulet

### ** Examples

data(nutriSample)
MedDiet <- computeGoulet(data = nutriSample,
  WholeCereals = P56rac + ifelse(nutriSample$P63_2 == 2, nutriSample$P61rac, 0),
  Vegetables = P41rac + P42rac,
  Fruit = P50rac + P52rac,
  LegumesAndNuts = P46rac + P53rac + P75rac,
  OliveOil = Aceitegr,
  OOmeasure = "gr",
  Olives = P54rac,
  Dairy = P19rac + P20rac + P20rac + P22rac + P23rac + P24rac + P25rac + P26rac + P27rac,
  Fish = P35rac + P36rac + P37rac + P38rac,
  Poultry = P33rac,
  Eggs = P28rac,
  Sweets = P69rac + P70rac + P71rac + P72rac + P73rac,
  Meat = P29rac + P30rac + P31rac + P32rac,
  output = "percent", frequency = "daily", rm.na = FALSE)
hist(MedDiet)



