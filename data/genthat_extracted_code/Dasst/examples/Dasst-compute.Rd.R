library(Dasst)


### Name: compute<-
### Title: Compute within columns from an object of class 'Dasst'.
### Aliases: compute<- compute<-,Dasst,character,character-method

### ** Examples

data(plantGrowth)
compute(plantGrowth, "date_YEAR_DOY") <-
 "as.Date(paste(YEAR, DOY, sep=\"\"), format=\"%Y%j\")"



