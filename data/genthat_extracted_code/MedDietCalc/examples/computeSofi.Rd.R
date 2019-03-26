library(MedDietCalc)


### Name: computeSofi
### Title: ComputeSofi
### Aliases: computeSofi

### ** Examples

data(nutriSample)

# wether olive oil is principal or not is stored in the sample dataset
# in a different way than asked by formula.
# In the data set it is 1=olive oil, 2=seeds oil, 3=both
# so a transformation is performed:
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
              output = "data.frame", rm.na = FALSE, frequency = "daily")

hist(Sofi$percent)



