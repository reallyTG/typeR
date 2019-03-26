library(MedDietCalc)


### Name: computeMDS05
### Title: computeMDS05
### Aliases: computeMDS05

### ** Examples

data(nutriSample)
MedDiet <- computeMDS05(data = nutriSample,
        Vegetables = P41grCom + P42grCom,
        Legumes =  P46grCom,
        FruitAndNuts =  P50grCom + P52grCom + P53grCom,
        Cereals = P55grCom + P56grCom + P57grCom + P59grCom +
                  P60grCom + P61grCom + P62grCom,
        Fish = P35grCom + P36grCom + P37grCom + P38grCom,
        Meat = P29grCom + P30grCom + P31grCom + P32grCom,
        Dairy = P19grCom + P20grCom + P20grCom + P22grCom + P23grCom +
                P24grCom + P25grCom + P26grCom + P27grCom,
        Alcohol =  12 * (P94rac + P96rac + P97rac + P98rac + P99rac),
        Potatoes =  P43grCom +  P44grCom +  P45grCom,
        MUFA =  totalGrasaMonoins,
        PUFA =  totalGrasaPoliins,
        SFA =  totalGrasaSat,
        Sex =  SEXO, men = "Hombre", women = "Mujer", frequency = "daily",
        output = "percent", rm.na = FALSE)
hist(MedDiet)



