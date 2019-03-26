library(GameTheory)


### Name: GameTheory-package
### Title: Cooperative Game Theory
### Aliases: GameTheory-package GameTheory

### ** Examples


### TRANSFERABLE UTILITY

## 3 PLAYER SHAPLEY VALUE

# Begin defining the game

COALITIONS <- c(46125,17437.5,5812.5,69187.5,53812.5,30750,90000)
LEMAIRE<-DefineGame(3,COALITIONS)
summary(LEMAIRE)

# End defining the game

NAMES <- c("Investor 1","Investor 2","Investor 3")
LEMAIRESHAPLEY <- ShapleyValue(LEMAIRE,NAMES)
summary(LEMAIRESHAPLEY)

# 3 PLAYER NUCLEOLUS OF A GAINS GAME 

LEMAIRENUCLEOLUS<-Nucleolus(LEMAIRE)
summary(LEMAIRENUCLEOLUS)


# 4 PLAYER SHAPLEY VALUE

COALITIONS <- c(26,27,55,57,53,81,83,82,84,110,108,110,110,110,110)
AIR<-DefineGame(4,COALITIONS)

NAMES <- c("Airline 1","Airline 2","Airline 3","Airline 4")
AIRSHAPLEY<-ShapleyValue(AIR,NAMES)
summary(AIRSHAPLEY)

# 4 PLAYER NUCLEOLUS OF A COST GAME 

AIRNUCLEOLUS<-Nucleolus(AIR,type="Cost")
summary(AIRNUCLEOLUS)

## SHAPLEY - SHUBIK POWER INDEX

# 2003 Elections
SEATS<-c(46,42,23,15,9)
PARTIES<-c("CiU","PSC","ERC","PP","ICV")
E2003<-ShapleyShubik(68,SEATS,PARTIES)
summary(E2003)

# 2006 Elections
SEATS<-c(48,37,21,14,12,3)
PARTIES<-c("CiU","PSC","ERC","PP","ICV","C's")
E2006<-ShapleyShubik(68,SEATS,PARTIES)
summary(E2006)

# 2012 Elections
SEATS<-c(50,20,21,19,13,9,3)
PARTIES<-c("CiU","PSC","ERC","PP","ICV","C's","CUP")
E2012<-ShapleyShubik(68,SEATS,PARTIES)
summary(E2012)

## CONFLICTING CLAIMS PROBLEM

## replication of Gallastegui et al. (2003), Table 7.

CLAIMS <- c(158,299,927,2196,4348,6256,13952)
COUNTRIES <- c("Germany","Netherlands","Belgium","Ireland","UK","Spain","France")
INARRA <- AllRules(13500,CLAIMS,COUNTRIES)
summary(INARRA)

plot(INARRA,5) ## Display allocations for UK
LorenzRules(INARRA) ## Inequality graph





