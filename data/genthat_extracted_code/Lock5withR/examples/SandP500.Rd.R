library(Lock5withR)


### Name: SandP500
### Title: S & P 500 Prices
### Aliases: SandP500
### Keywords: datasets

### ** Examples


data(SandP500)
if (require(lattice)) {
  xyplot( High + Low ~ Date, data=SandP500, type="l", 
    main="S and P 500",
    auto.key=list(lines=TRUE, points=FALSE))
 }




