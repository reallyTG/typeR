## ----setup---------------------------------------------------------------
knitr::opts_chunk$set(encoding = "UTF-8")

## ------------------------------------------------------------------------
MaleA <- data.frame(Bread = 14, WholeBread = 14, Potatoes = 3, Pasta = 5, 
                    Fruits = 14, Legumes = 3, Nuts = 5, Vegetables = 21, 
                    Oil = "Olive Oil", OliveOil = 25, Dairy = 14, 
                    WholeDairy = 7, Fish = 2, Poultry = 2, Eggs = 4, Meat = 3, Wine = 7)

MaleB <- data.frame(Bread = 6, WholeBread = 0, Potatoes = 6, Pasta = 4, 
                    Fruits = 5, Legumes = 1, Nuts = 1, Vegetables = 10, 
                    Oil = "Olive and Seeds Oil", OliveOil = 14, Dairy = 28, 
                    WholeDairy = 28, Fish = 4, Poultry = 4, Eggs = 8, Meat = 5, Wine = 0)

library(knitr)
kable(t(rbind(MaleA = MaleA, MaleB = MaleB)))

## ------------------------------------------------------------------------
levels(MaleA$Oil)[levels(MaleA$Oil) == "Olive Oil"] <- 2
levels(MaleB$Oil)[levels(MaleB$Oil) == "Olive and Seeds Oil"] <- 1

## ------------------------------------------------------------------------
library(MedDietCalc)

MaleA1 <- computePitsavos(data = MaleA, WholeCereals = WholeBread, Fruit = Fruits, 
                          Vegetables = Vegetables, Potatoes = Potatoes, Legumes = Legumes,
                          OliveOil = OliveOil, OOmeasure = "serving", Fish = Fish, 
                          Meat = Meat, Poultry = Poultry, WholeDairy = WholeDairy, 
                          Wine = Wine, output = "percent", frequency = "weekly")

MaleA2 <- computeSofi(data = MaleA, Fruit = Fruits, Vegetables = Vegetables, 
                      Legumes = Legumes, Cereals = Bread + Pasta, Fish = Fish, 
                      Meat = Meat, Dairy = Dairy, Alcohol = Wine, OliveOil = Oil, 
                      output = "percent", frequency = "weekly")

## ------------------------------------------------------------------------
MaleB1 <- computePitsavos(data = MaleB, WholeCereals = WholeBread, Fruit = Fruits, 
                          Vegetables = Vegetables, Potatoes = Potatoes, Legumes = Legumes,
                          OliveOil = OliveOil, OOmeasure = "serving", Fish = Fish, 
                          Meat = Meat, Poultry = Poultry, WholeDairy = WholeDairy, 
                          Wine = Wine, output = "percent", frequency = "weekly")

MaleB2 <- computeSofi(data = MaleB, Fruit = Fruits, Vegetables = Vegetables, 
                      Legumes = Legumes, Cereals = Bread + Pasta, Fish = Fish, 
                      Meat = Meat, Dairy = Dairy, Alcohol = Wine, OliveOil = Oil, 
                      output = "percent", frequency = "weekly")

## ------------------------------------------------------------------------
kable(data.frame(MaleA = c(MaleA1, MaleA2), MaleB = c(MaleB1, MaleB2), 
                 row.names = c("score1", "score2")))

## ------------------------------------------------------------------------
data(nutriSample)

risk <- computeFRESCO(data = nutriSample, 
	outcome = "All", simplified = TRUE, 
	Sex = SEXO, Age = EDAD, Smoker = ifelse(nutriSample$FUMADOR == 1, 1, 0),
	BMI = nutriSample$peso/(nutriSample$altura)^2,
	men = "Hombre", women = "Mujer")
	
hist(risk, main = "10-year estimated \n cardiovascular risk")

## ------------------------------------------------------------------------
MDS05 <- computeMDS05(data = nutriSample,
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
        Potatoes =  NULL, 
        MUFA =  totalGrasaMonoins,
        PUFA =  totalGrasaPoliins,
        SFA =  totalGrasaSat,
        Sex =  SEXO, men = "Hombre", women = "Mujer", frequency = "daily", 
        output = "data.frame", rm.na = FALSE)


## ------------------------------------------------------------------------
kable(head(MDS05))

## ------------------------------------------------------------------------
kable(round(apply(MDS05, 2, mean),2))

## ------------------------------------------------------------------------
MDS05 <- MDS05$percent

## ------------------------------------------------------------------------
MDS12 <- 
  computeMDS12(data = nutriSample,
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
               Potatoes =  NULL,
               OOprincipal = ifelse(nutriSample$AceiteTipo == 1, 1, 0),
               Sex =  SEXO, men = "Hombre", women = "Mujer", 
               frequency = "daily", output = "percent", rm.na = FALSE)

## ------------------------------------------------------------------------
Pitsavos <- computePitsavos(data = nutriSample,
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


## ------------------------------------------------------------------------
Predimed <- computePredimed(data = nutriSample, OliveOil = Aceitegr, OOmeasure = "gr",
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
                  Sofritos = rep(0, nrow(data)), # data lacks this variable, 
                                                 # so we go on without it
                  output = "percent", rm.na = FALSE, frequency = "daily")


## ------------------------------------------------------------------------
MAI <- computeMAI99(data = nutriSample,
  Bread = P55Kcal + P56Kcal + P57Kcal,
  Cereals = P55Kcal + P56Kcal + P57Kcal + P59Kcal + P60Kcal + P61Kcal + P62Kcal,
  Legumes = P46Kcal,
  Potatoes = P43Kcal + P44Kcal + P46Kcal,
  Vegetables = P41Kcal + P42Kcal,
  FruitAndNuts = P50Kcal + P53Kcal + P53Kcal,
  Fish = P35Kcal + P36Kcal + P37Kcal + P38Kcal,
  Wine = P96Kcal,
  Oil = AceiteKcal,
  Milk = P19Kcal + P20Kcal + P21Kcal,
  Cheese = P26Kcal + P27Kcal,
  Meat = P29Kcal + P30Kcal + P31Kcal + P32Kcal,
  Eggs = P28Kcal,
  AnimalFats = P29grGrasa + P30grGrasa + P31grGrasa + 
    P32grGrasa + P33grGrasa + P34grGrasa ,
  SoftDrinks = P89Kcal + P90Kcal,
  Pastries = P69Kcal + P70Kcal + P71Kcal + P72Kcal + P73Kcal,
  Sugar = P84Kcal,
  Kcal = totalKcal,
  output = "index", rm.na = FALSE)


## ------------------------------------------------------------------------
MDQI <- computeMDQI(data = nutriSample,
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

## ------------------------------------------------------------------------
Cardio <- computeCardio(data = nutriSample,
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

## ------------------------------------------------------------------------
MDP02 <- computeMDP02(data = nutriSample,
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

## ------------------------------------------------------------------------
RMed <- computeRMED(data = nutriSample,
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
                      Alcohol = 12 * (P94rac + P96rac + P97rac + P98rac + P99rac),
                      Sex = SEXO, men = "Hombre", women = "Mujer",
                      frequency = "daily", output = "percent", rm.na = FALSE)

## ------------------------------------------------------------------------
# kind of Olive Oil consumded is stored in a different way than asked by formula:
  # data has: 1 = olive oil, 2 = seeds oil, 3 = both, 
  # formula wants use of olive oil: 0 = occasional use, 1 = frequent use, 2 = regular use
  # so we first change it:
Oil <- ifelse(nutriSample$AceiteTipo == 2, 0, 
              ifelse(nutriSample$AceiteTipo == 3, 1, 
                     ifelse(nutriSample$AceiteTipo == 1, 2, 0)))

Sofi <- computeSofi(data = nutriSample,
              Fruit = P50rac + P52rac,
              Vegetables = P41rac +  P42rac,
              Legumes = P46rac,
              Cereals = P55rac + P56rac + P57rac + P59rac + P60rac + P61rac + P62rac,
              Fish = P35rac + P36rac + P37rac + P38rac,
              Meat = P29rac + P30rac + P31rac + P32rac,
              Dairy = P19rac + P20rac + P20rac + P22rac + P23rac + 
                P24rac + P25rac + P26rac + P27rac,
              Alcohol = P94rac + P96rac + P97rac + P98rac + P99rac,
              OliveOil = Oil,
              output = "percent", rm.na = FALSE, frequency = "daily")
rm(Oil)


## ------------------------------------------------------------------------
Goulet <- computeGoulet(data = nutriSample,
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

## ------------------------------------------------------------------------
# kind of Olive Oil consumded is stored in a different way than asked by formula:
  # data has: 1 = olive oil, 2 = seeds oil, 3 = both, 
  # formula wants: 
    # 0 = olive oil is not usually consumed. 
    # 1 = olive oil and other vegetable oils are usually consumed. 
    # 2 = only olive oil is usually consumed
  # so we first change it:
Oil <- ifelse(nutriSample$AceiteTipo == 2, 0, 
              ifelse(nutriSample$AceiteTipo == 3, 1, 
                     ifelse(nutriSample$AceiteTipo == 1, 2, 0)))

MSDPS <- computeMSDPS(data = nutriSample,
        # group of arguments about food consumption:
           WholeCereals = P56rac + ifelse(nutriSample$P63_2 == 2, nutriSample$P61rac, 0),
           Fruit = P50rac + P52rac,
           Vegetables = P41rac + P42rac,
           Dairy = P19rac + P20rac + P20rac + P22rac + P23rac + 
             P24rac + P25rac + P26rac + P27rac,
           Wine = P96rac,
           Fish = P35rac + P36rac + P37rac + P38rac,
           Poultry = P33rac,
           LegumesAndMore = P46rac + P53rac + P54rac,
           Potatoes = P43grCom +  P44grCom +  P45grCom,
           Eggs = P28rac,
           Sweets = P69rac + P70rac + P71rac + P72rac + P73rac,
           Meat = P29rac + P30rac + P31rac + P32rac,
           OOprincipal = Oil,
            
        # group of arguments about energy intake to compute correction factor:
           WholeCerealsK = P56Kcal + ifelse(nutriSample$P63_2 == 2, nutriSample$P61Kcal, 0),
           FruitK = P50Kcal + P52Kcal,
           VegetablesK = P41Kcal + P42Kcal,
           DairyK = P19Kcal + P20Kcal + P21Kcal + P22Kcal + P23Kcal + 
             P24Kcal + P25Kcal + P26Kcal + P27Kcal,
           WineK = P96Kcal,
           FishK = P35Kcal + P36Kcal + P37Kcal + P38Kcal,
           PoultryK = P33Kcal,
           LegumesAndMoreK = P46Kcal + P53Kcal + P54Kcal,
           PotatoesK = P43grCom +  P44grCom +  P45grCom,
           EggsK = P28Kcal,
           SweetsK = P69Kcal + P70Kcal + P71Kcal + P72Kcal + P73Kcal,
           MeatK = P29Kcal + P30Kcal + P31Kcal + P32Kcal,
           OliveOilK = AceiteKcal,
           Kcal = totalKcal,
         
        # final arguments:
           Sex = SEXO, men = "Hombre", women = "Mujer",
           output = "percent", frequency = "daily", rm.na = FALSE)

## ------------------------------------------------------------------------
scores <- data.frame(MDS05, MDS12, Pitsavos, Predimed, MDQI, Cardio, 
                     MDP02, RMed, Sofi, Goulet, MSDPS, MAI)

knitr::kable(head(scores))

## ------------------------------------------------------------------------
knitr::kable(round(cor(scores, use = "pairwise.complete.obs"), 2))

## ------------------------------------------------------------------------
for(i in 1:ncol(scores)){
  hist(scores[ ,i], main="", xlab=names(scores)[i], xlim=c(0,100))
}

