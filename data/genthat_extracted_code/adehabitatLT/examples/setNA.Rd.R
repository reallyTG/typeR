library(adehabitatLT)


### Name: setNA
### Title: Place Missing Values in Objects of Class 'ltraj'
### Aliases: setNA
### Keywords: programming

### ** Examples


data(porpoise)
foc <- porpoise[1]

## the list foc does not contain any missing value:
foc
plotNAltraj(foc)

## we remove the second to tenth relocation
foc[[1]] <- foc[[1]][-c(2:10),]
foc <- rec(foc)

## The missing values are not visible:
foc
plotNAltraj(foc)

## The porpoise is located once a day.
## We use the first relocation as the reference date
foc2 <- setNA(foc, foc[[1]]$date[1], 24*3600)

## Missing values are now present
foc2
plotNAltraj(foc2)




