library(hett)


### Name: rent
### Title: Rent for Land PLanted to Alfalfa
### Aliases: rent
### Keywords: datasets

### ** Examples


library(lattice)
data(rent, package = "hett")
attach(rent)
xyplot(log(Rent/AllRent) ~ sqrt(Cows), groups = Liming, panel = panel.superpose) 




