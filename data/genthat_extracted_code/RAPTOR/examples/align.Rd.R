library(RAPTOR)


### Name: align
### Title: Data alignment
### Aliases: align

### ** Examples

#rotating example data
input<-is.raptor(example.data(species="LOT_PICEA"), str=FALSE)
input<-align(input, year=2007, list=FALSE,interact=FALSE, make.plot=TRUE)



