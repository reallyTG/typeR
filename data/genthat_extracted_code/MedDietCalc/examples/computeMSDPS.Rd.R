library(MedDietCalc)


### Name: computeMSDPS
### Title: computeMSDPS
### Aliases: computeMSDPS

### ** Examples

data(nutriSample)

# wether olive oil is principal or not is stored in the sample dataset
# in a different way than asked by formula.
# In the data set it is 1=olive oil, 2=seeds oil, 3=both
# so a transformation is performed:
Oil <- ifelse(nutriSample$AceiteTipo == 2, 0,
              ifelse(nutriSample$AceiteTipo == 3, 1,
                     ifelse(nutriSample$AceiteTipo == 1, 2, 0)))

MedDiet <-
computeMSDPS(data = nutriSample,
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
            DairyK = P19Kcal + P20Kcal + P20Kcal + P22Kcal + P23Kcal +
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
hist(MedDiet)



