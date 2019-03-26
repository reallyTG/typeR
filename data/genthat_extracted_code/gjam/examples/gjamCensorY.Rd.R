library(gjam)


### Name: gjamCensorY
### Title: Censor gjam response data
### Aliases: gjamCensorY

### ** Examples

## Not run: 
##D # data in octaves
##D v  <- up <- c(0, 2^c(0:4), Inf)         
##D dn <- c(-Inf, v[-length(v)])
##D i  <- rbind( dn, up )  # intervals
##D 
##D f  <- gjamSimData(n = 2000, S = 15, Q = 3, typeNames='CA')
##D y  <- f$y
##D cc <- c(3:6)                                                # censored columns
##D g  <- gjamCensorY(values = v, intervals = i, y = y, whichcol = cc)
##D y[,cc] <- g$y                                               # replace columns
##D ml     <- list(ng = 50, burnin = 10, censor = g$censor, typeNames = f$typeNames)
##D output <- gjam(f$formula, xdata = f$xdata, ydata = y, modelList = ml)
##D 
##D #repeat with ng = 2000, burnin = 500, then:
##D pl  <- list(trueValues = f$trueValues, width = 3, height = 3)   
##D gjamPlot(output, pl)
##D 
##D # upper detection limit
##D up <- 5
##D v  <- up
##D i  <- matrix(c(up,Inf),2)
##D rownames(i) <- c('down','up')
##D 
##D f   <- gjamSimData(typeNames='CA')   
##D g   <- gjamCensorY(values = v, intervals = i, y = f$y)
##D ml  <- list(ng = 50, burnin = 10, censor = g$censor, typeNames = f$typeNames)
##D out <- gjam(f$formula, xdata = f$xdata, ydata = g$y, modelList = ml)
##D 
##D #repeat with ng = 2000, burnin = 500, then:
##D pl  <- list(trueValues = f$trueValues, width = 3, height = 3)           
##D gjamPlot(out, pl)
##D 
##D # lower detection limit
##D lo        <- .001
##D values    <- upper <- lo
##D intervals <- matrix(c(-Inf,lo),2)
##D rownames(intervals) <- c('lower','upper')
## End(Not run)



