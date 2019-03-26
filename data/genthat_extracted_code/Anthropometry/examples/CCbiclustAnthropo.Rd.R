library(Anthropometry)


### Name: CCbiclustAnthropo
### Title: Cheng and Church biclustering algorithm applied to
###   anthropometric data
### Aliases: CCbiclustAnthropo
### Keywords: manip

### ** Examples

## Not run: 
##D #Note: package biclust needed.
##D #This is an example of using this function with a certain database 
##D #made up of body dimensions related to the lower body part.
##D data <- dataUser[(waist >= 58) & (waist < 115),] #dataUser is the user database.
##D rownames(data) <- 1:dim(data)[1]
##D   
##D waist <- data[,"WaistCircumference"] 
##D     
##D waist_4 <- seq(58, 86, 4) 
##D waist_6 <- seq(91, 115, 6) 
##D waistCirc <- c(waist_4,waist_6)
##D nsizes <- length(waistCirc) 
##D 
##D #Position of the body variables in the database:
##D lowerVars <- c(14, 17:25, 27, 28, 65:73, 75, 77:81, seq(100, 116, 2))
##D 
##D nBic <- c(2, 2, 4, rep(5, 7), 3, 3)  
##D diffRanges <- list(c(14,20), c(24,30), c(24,30), c(33,39), c(29,35), c(29,35), 
##D                    c(28,35), c(31,38), c(31,38), c(30,37), c(26,33), c(25,32))
##D percDisac <- 0.01 
##D dir <- "/home/guillermo/"
##D   
##D res_bicl_antropom <- CCbiclustAnthropo(data,waist,waistCirc,lowerVars,
##D                                        nsizes,nBic,diffRanges,percDisac,dir)
## End(Not run)



