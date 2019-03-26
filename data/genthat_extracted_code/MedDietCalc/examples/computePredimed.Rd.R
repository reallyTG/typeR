library(MedDietCalc)


### Name: computePredimed
### Title: computePredimed
### Aliases: computePredimed

### ** Examples

data(nutriSample)
MedDiet <- computePredimed(data = nutriSample, OliveOil = Aceitegr, OOmeasure = "gr",
                  OOprincipal = ifelse(nutriSample$AceiteTipo == 1, 1, 0),
                  Vegetables = P41rac + P42rac,
                  Fruit = P50rac + P52rac,
                  RedMeat = P29rac + P31rac,
                  Butter = P79rac,
                  SoftDrinks = P89rac + P90rac,
                  Wine = P96rac,
                  Legumes = P46rac,
                  Fish = P35rac + P36rac + P37rac + P38rac,
                  Pastries = P69rac + P70rac + P71rac + P72rac + P73rac,
                  Nuts = P53rac,
                  WhiteMeat = ifelse(nutriSample$P30rac > nutriSample$P29rac, 1, 0),
                  Sofritos = rep(0, nrow(data)), # data lacks this variable, so we go on without it
                  output = "percent", rm.na = FALSE, frequency = "daily")
hist(MedDiet)



