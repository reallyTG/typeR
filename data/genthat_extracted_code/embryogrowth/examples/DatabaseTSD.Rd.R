library(embryogrowth)


### Name: DatabaseTSD
### Title: Database of TSD information for reptiles
### Aliases: DatabaseTSD
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(DatabaseTSD)
##D DatabaseTSD$Version[1]
##D totalIncubation_Lo <- subset(DatabaseTSD, 
##D          Species=="Lepidochelys olivacea" & (!is.na(Sexed) & Sexed!=0), 
##D          select=c("Males", "Females", "Incubation.temperature"))
##D tot_Lo <- with(totalIncubation_Lo, tsd(males=Males, females=Females, 
##D  temperatures=Incubation.temperature), parameters.initial = c(P=30.5, S=-0.4))
##D  predict(tot_Lo)
## End(Not run)



