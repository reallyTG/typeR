library(MedDietCalc)


### Name: computeMAI99
### Title: computeMAI99
### Aliases: computeMAI99

### ** Examples

data(nutriSample)

MedDiet <- computeMAI99(data = nutriSample,
  Bread = P55Kcal + P56Kcal + P57Kcal,
  Cereals = P55Kcal + P56Kcal + P57Kcal + P59Kcal + P60Kcal + P61Kcal + P62Kcal,
  Legumes = P46Kcal,
  Potatoes = P43Kcal + P44Kcal + P45Kcal,
  Vegetables = P41Kcal + P42Kcal,
  FruitAndNuts = P50Kcal + P53Kcal,
  Fish = P35Kcal + P36Kcal + P37Kcal + P38Kcal,
  Wine = P96Kcal,
  Oil = AceiteKcal,
  Milk = P19Kcal + P20Kcal + P21Kcal,
  Cheese = P26Kcal + P27Kcal,
  Meat = P29Kcal + P30Kcal + P31Kcal + P32Kcal,
  Eggs = P28Kcal,
  AnimalFats = P29grGrasa + P30grGrasa + P31grGrasa + P32grGrasa + P33grGrasa + P34grGrasa ,
  SoftDrinks = P89Kcal + P90Kcal,
  Pastries = P69Kcal + P70Kcal + P71Kcal + P72Kcal + P73Kcal,
  Sugar = P84Kcal,
  Kcal = totalKcal,
  output = "index", rm.na = FALSE)
hist(MedDiet)



