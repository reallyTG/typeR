library(MplusAutomation)


### Name: createMixtures
### Title: Create syntax for a batch of mixture models
### Aliases: createMixtures
### Keywords: mixture models mplus

### ** Examples

## Not run: 
##D createMixtures(classes = 1:3, filename_stem = "iris", rdata = iris)
## End(Not run)
## Not run: 
##D data <- read.table("http://statmodel.com/usersguide/chap8/ex8.13.dat")[,c(1:10)]
##D names(data) <- c("u11", "u12", "u13", "u14", "u15", "u21", "u22", "u23", "u24", "u25")
##D createMixtures(
##D classes = 2,
##D filename_stem = "dating",
##D model_overall = "c2 ON c1;",
##D model_class_specific = c(
##D "[u11$1] (a{C});  [u12$1] (b{C});  [u13$1] (c{C});  [u14$1] (d{C});  [u15$1] (e{C});",
##D "[u21$1] (a{C});  [u22$1] (b{C});  [u23$1] (c{C});  [u24$1] (d{C});  [u25$1] (e{C});"
##D ),
##D rdata = data,
##D ANALYSIS = "PROCESSORS IS 2;  LRTSTARTS (0 0 40 20);  PARAMETERIZATION = PROBABILITY;",
##D VARIABLE = "CATEGORICAL = u11-u15 u21-u25;"
##D )
## End(Not run)



