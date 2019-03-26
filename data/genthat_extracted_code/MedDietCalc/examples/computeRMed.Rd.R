library(MedDietCalc)


### Name: computeRMED
### Title: computeRMED
### Aliases: computeRMED

### ** Examples

data(nutriSample)

MedDiet <- computeRMED(data = nutriSample,
                      Kcal = totalKcal,
                      FruitAndNuts = P50grCom + P52grCom,
                      Vegetables = P41grCom + P42grCom,
                      Legumes = P46grCom,
                      Cereals = P55grCom + P56grCom + P57grCom + P59grCom +
                                P60grCom + P61grCom + P62grCom,
                      Fish = P35grCom + P36grCom + P37grCom + P38grCom,
                      OliveOil = Aceitegr,
                      Meat = P29grCom + P30grCom + P31grCom + P32grCom,
                      Dairy= P19grCom + P20grCom + P20grCom + P22grCom + P23grCom +
                             P24grCom + P25grCom + P26grCom + P27grCom,
                      Alcohol = 10 * (P94rac + P96rac + P97rac + P98rac + P99rac),
                      Sex = SEXO, men = "Hombre", women = "Mujer",
                      frequency = "daily", output = "percent", rm.na = FALSE)
summary(MedDiet)



