library(GameTheory)


### Name: ShapleyValue
### Title: Shapley Value Solution
### Aliases: ShapleyValue

### ** Examples




# Begin defining the game

COALITIONS <- c(46125,17437.5,5812.5,69187.5,53812.5,30750,90000)
LEMAIRE<-DefineGame(3,COALITIONS)

# End defining the game

NAMES <- c("Investor 1","Investor 2","Investor 3")
LEMAIRESHAPLEY <- ShapleyValue(LEMAIRE,NAMES)
summary(LEMAIRESHAPLEY)




