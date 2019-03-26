library(MedDietCalc)


### Name: computeMDP02
### Title: computeMDP02
### Aliases: computeMDP02

### ** Examples

data(nutriSample)

MedDiet <- computeMDP02(data = nutriSample,
                        OliveOil = Aceitegr,
                        OOmeasure = "gr",
                        Fiber = totalFibra,
                        Fruit = P50grCom,
                        Vegetables = P41grCom + P42grCom,
                        Fish = P35grCom + P36grCom + P37grCom + P38grCom,
                        Alcohol = 12 * (P94rac + P96rac + P97rac + P98rac + P99rac),
                        Meat = P29grCom + P30grCom + P31grCom + P32grCom,
                        RefinedCereals = P55grCom + P61grCom,
                        output = "percent", rm.na = FALSE, frequency = "daily")
hist(MedDiet)



