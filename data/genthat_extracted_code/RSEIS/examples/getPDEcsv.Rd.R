library(RSEIS)


### Name: getPDEcsv
### Title: Unpack PDE file
### Aliases: getPDEcsv getPDEscreen
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D 
##D eq1 <- getPDEcsv(pde = "/home/lees/Site/Santiaguito/pdq.eqs")
##D 
##D ############################ 
##D ######  copy/paste  from the screen dump at the NEIC web site
##D #####  then:
##D eq1 <- getPDEscreen(pde = "EQS.txt")
##D 
##D nk <- names(eq1[[1]])
##D k <- length(nk)
##D 
##D ##########   get a matrix of values instead
##D jim <-  matrix( unlist(eq1), ncol=k, byrow=TRUE)
##D colnames(jim) <- nk
##D 
##D 
##D 
## End(Not run)





