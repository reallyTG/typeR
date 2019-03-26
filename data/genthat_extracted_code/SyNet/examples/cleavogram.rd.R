library(SyNet)


### Name: cleavogram
### Title: Cleavogram
### Aliases: cleavogram
### Keywords: design

### ** Examples

  ## Not run: 
##D   #NAM method applied on the example of New Zealand mayflies 
##D   data(mayflynz)
##D   dotdata <- procdnpoint(mayflynz)
##D   toposimilar(dotdata) -> toponz
##D   acsh(dotdata) -> acshnz
##D   reweight(toponz) -> toporew
##D   #The next step consists of obtaining the binary sympatry network, that is to
##D   #create the respective object of class 'dotinference'. This task can be done
##D   #interactively with function dotinfer.
##D   #Here, we will create the required 'dotinference' object by hand. The thresholding
##D   #rule match that used by Dos Santos et al. (2011).
##D   rslt <- c()
##D   rslt$sm <- ifelse(acshnz < 100 & toporew > 0.8, 1, 0)
##D   rslt$Label <- dotdata$Label
##D   rslt$occupancy <- dotdata$occupancy
##D   rslt$coords <- dotdata$coords
##D   rslt$kind <- "points"
##D   class(rslt) <- "dotinference"
##D   #Now, run NAM over the previous created object. Then go to the cleavogram and explore it. 
##D   outnz <- nam(rslt)
##D   cleavogram()
##D   
## End(Not run)



