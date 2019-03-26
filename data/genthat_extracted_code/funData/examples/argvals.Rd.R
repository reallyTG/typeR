library(funData)


### Name: argvals
### Title: Extract and set slots from functional data objects
### Aliases: argvals getArgvals getArgvals,funData-method
###   getArgvals,multiFunData-method getArgvals,irregFunData-method X getX
###   getX,funData-method getX,multiFunData-method getX,irregFunData-method
###   argvals<- setArgvals setArgvals,funData-method
###   setArgvals,multiFunData-method setArgvals,irregFunData-method X<-
###   setX setX,funData-method setX,multiFunData-method
###   setX,irregFunData-method
### Keywords: internal

### ** Examples

### Univariate
object <- funData(argvals = 1:5, X = rbind(1:5, 6:10))
object

# get-methods
argvals(object)
X(object)

# set-methods
argvals(object) <- 0:4
object 
## Not run: argvals(object) <- 1:4 # wrong length
X(object) <- rbind(0:4, 5:9)
## Not run: X(object) <- rbind(0:4, 5:9, 10:14) # warning: now 3 observations (was 2 before)
## Not run: X(object) <- rbind(1:4, 5:8) # wrong length

### Univariate (irregular)
irregObject <- irregFunData(argvals = list(1:5, 2:4), X = list(2:6, 3:5))
irregObject

# get-methods
argvals(irregObject)
X(irregObject)

# set-methods
argvals(irregObject) <- list(0:4, 1:3)
X(irregObject) <- list(12:16, 13:15)

### Multivariate
multiObject <- multiFunData(object, funData(argvals = 1:3, X = rbind(3:5, 6:8)))
multiObject

# get-methods
argvals(multiObject)
X(multiObject)

# set-methods (for special cases see univariate version)
argvals(multiObject) <- list(5:1, 3:1)
X(multiObject) <- list(rbind(5:1, 10:6), rbind(5:3, 8:6))



