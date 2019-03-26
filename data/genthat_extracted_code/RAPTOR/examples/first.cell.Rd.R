library(RAPTOR)


### Name: first.cell
### Title: Detection of the first cells
### Aliases: first.cell

### ** Examples

## Not run: 
##D #first row detection example
##D input<-is.raptor(example.data(species="LOT_PICEA"), str = FALSE)
##D input<-input[which(input[,"YEAR"]>2006 & input[,"YEAR"]<2011),]
##D aligned<-align(input,list=c(0.04,0.04,0,0))
##D first<-first.cell(aligned, frac.small = 0.5, yrs = FALSE, make.plot = TRUE)
## End(Not run)



