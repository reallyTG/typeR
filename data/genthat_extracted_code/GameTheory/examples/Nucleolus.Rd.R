library(GameTheory)


### Name: Nucleolus
### Title: Nucleolus solution
### Aliases: Nucleolus

### ** Examples

	
## EXAMPLE FROM LEMAIRE (1991)
	
# Begin defining the game

COALITIONS <- c(46125,17437.5,5812.5,69187.5,53812.5,30750,90000)
LEMAIRE<-DefineGame(3,COALITIONS)

# End defining the game

LEMAIRENUCLEOLUS<-Nucleolus(LEMAIRE)
summary(LEMAIRENUCLEOLUS) # Gains Game, the excess should be negative





