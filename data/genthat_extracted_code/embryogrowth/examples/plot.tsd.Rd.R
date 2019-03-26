library(embryogrowth)


### Name: plot.tsd
### Title: Plot results of tsd() that best describe temperature-dependent
###   sex determination
### Aliases: plot.tsd

### ** Examples

## Not run: 
##D CC_AtlanticSW <- subset(DatabaseTSD, RMU=="Atlantic, SW" & 
##D                           Species=="Caretta caretta" & (!is.na(Sexed) & Sexed!=0))
##D tsdL <- with (CC_AtlanticSW, tsd(males=Males, females=Females, 
##D                                  temperatures=Incubation.temperature-Correction.factor, 
##D                                  equation="logistic"))
##D plot(tsdL)
## End(Not run)



