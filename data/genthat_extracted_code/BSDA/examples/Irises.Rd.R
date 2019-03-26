library(BSDA)


### Name: Irises
### Title: R.A. Fishers famous data on Irises
### Aliases: Irises
### Keywords: datasets

### ** Examples


tapply(Irises$sepal_length, Irises$species, mean)
t.test(Irises$sepal_length[Irises$species == "setosa"], conf.level = 0.99)
hist(Irises$sepal_length[Irises$species == "setosa"], 
     main = "Sepal length for\n Iris Setosa",
     xlab = "Length (in cm)")
boxplot(sepal_length ~ species, data = Irises)




