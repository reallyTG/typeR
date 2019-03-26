library(DescTools)


### Name: PairApply
### Title: Pairwise Calculations
### Aliases: PairApply
### Keywords: manip

### ** Examples

PairApply(d.diamonds[,c("colour","clarity","cut","polish")], FUN = CramerV, 
          symmetric=TRUE)

# user defined functions are ok as well
PairApply(d.diamonds[,c("clarity","cut","polish","symmetry")], 
  FUN = function(x,y) wilcox.test(as.numeric(x), as.numeric(y))$p.value, symmetric=TRUE)

# asymetric measure
PairApply(d.diamonds[,c("colour", "clarity", "cut", "polish")], 
  FUN = Lambda, direction = "row")

# ... compare to:
Lambda(x=d.diamonds$colour, y=d.diamonds$clarity, direction="row")  
Lambda(x=d.diamonds$colour, y=d.diamonds$clarity, direction="column")  


# the data.frame
dfrm <- d.diamonds[, c("colour","clarity","cut","polish")]
PairApply(dfrm, FUN = CramerV, symmetric=TRUE)

# the same as matrix (columnwise)
m <- as.matrix(dfrm)
PairApply(m, FUN = CramerV, symmetric=TRUE)

# ... and the list interface
lst <- as.list(dfrm)
PairApply(lst, FUN = CramerV, symmetric=TRUE)



