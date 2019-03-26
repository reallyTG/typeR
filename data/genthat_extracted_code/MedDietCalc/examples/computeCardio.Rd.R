library(MedDietCalc)


### Name: computeCardio
### Title: computeCardio
### Aliases: computeCardio
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(nutriSample)

MedDiet <- computeCardio(data = nutriSample,
                          OliveOil = Aceitegr,
                          OOmeasure = "gr",
                          Fruit = P50rac + P52rac,
                          Vegetables = P41rac + P42rac,
                          Legumes = P46rac,
                          Fish = P35rac + P36rac + P37rac + P38rac,
                          Wine = P96rac,
                          Meat = P29rac + P30rac + P31rac + P32rac,
                          RefinedBread = P55rac,
                          RefinedRice = P61rac,
                          WholeBread = P56rac,
                          frequency = "daily", output = "percent", rm.na = FALSE)
hist(MedDiet)



