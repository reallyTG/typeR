library(spatstat)


### Name: alltypes
### Title: Calculate Summary Statistic for All Types in a Multitype Point
###   Pattern
### Aliases: alltypes
### Keywords: spatial nonparametric

### ** Examples

   # bramblecanes (3 marks).
   bram <- bramblecanes
   ## Don't show: 
      bram <- bram[c(seq(1, 744, by=20), seq(745, 823, by=4))]
   
## End(Don't show)
   bF <- alltypes(bram,"F",verb=TRUE)
   plot(bF)
   if(interactive()) {
     plot(alltypes(bram,"G"))
     plot(alltypes(bram,"Gdot"))
   }
   
   # Swedishpines (unmarked).
  swed <- swedishpines
   ## Don't show: 
     swed <- swed[1:25]
   
## End(Don't show)
   plot(alltypes(swed,"K"))

   plot(alltypes(amacrine, "pcf"), ylim=c(0,1.3))

   # A setting where you might REALLY want to use dataname:
   ## Not run: 
##D    xxx <- alltypes(ppp(Melvin$x,Melvin$y,
##D                 window=as.owin(c(5,20,15,50)),marks=clyde),
##D                 fun="F",verb=TRUE,dataname="Melvin")
##D    
## End(Not run)

   # envelopes
   bKE <- alltypes(bram,"K",envelope=TRUE,nsim=19)
   ## Not run: 
##D    bFE <- alltypes(bram,"F",envelope=TRUE,nsim=19,global=TRUE)
##D    
## End(Not run)

   # extract one entry
   as.fv(bKE[1,1])
   



