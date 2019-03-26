library(STMedianPolish)


### Name: ConstructMPst
### Title: Construct Spatio - temporal regular data.
### Aliases: ConstructMPst

### ** Examples

## Not run:
library(zoo)
data(Metadb)
#records of monthly precipitation from january 2007 to january 2010
Metadb<-Metadb[,c(1:4,89:125)]
x<-matrix(0,1,37)
for(i in 1:37){
 x[,i] <- 2007 + (seq(0, 36)/12)[i]
}
x<-as.Date (as.yearmon(x), frac = 1)
time = as.POSIXct(x, tz = "GMT")
MPST<-ConstructMPst(Metadb[,-c(1:4)],time,pts=Metadb[,2:4],Delta=c(7,6,5))
## End(Not run)



