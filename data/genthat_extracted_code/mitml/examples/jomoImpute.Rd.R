library(mitml)


### Name: jomoImpute
### Title: Impute single-level and multilevel missing data using 'jomo'
### Aliases: jomoImpute
### Keywords: models

### ** Examples

# NOTE: The number of iterations in these examples is much lower than it
# should be! This is done in order to comply with CRAN policies, and more
# iterations are recommended for applications in practice!

data(studentratings)
data(leadership)

# ***
# for further examples, see "panImpute"
#

?panImpute

# *** ................................
# the 'type' interface
# 

# * Example 1.1 (studentratings): 'ReadDis' and 'SES', predicted by 'ReadAchiev'
# (random slope)

type <- c(-2,0,0,0,0,1,3,1,0,0)
names(type) <- colnames(studentratings)
type

imp <- jomoImpute(studentratings, type=type, n.burn=100, n.iter=10, m=5)

# * Example 1.2 (leadership): all variables (mixed continuous and categorical
# data with missing values at level 1 and level 2)

type.L1 <- c(-2,1,0,1,1)   # imputation model at level 1
type.L2 <- c(-2,0,1,0,0)   # imputation model at level 2
names(type.L1) <- names(type.L2) <- colnames(leadership)

type <- list(type.L1, type.L2)
type

imp <- jomoImpute(leadership, type=type, n.burn=100, n.iter=10, m=5)

# * Example 1.3 (studentratings): 'ReadDis', 'ReadAchiev', and 'SES' predicted
# with empty model, groupwise for 'FedState' (single-level imputation)

type <- c(0,-1,0,0,0,1,1,1,0,0)
names(type) <- colnames(studentratings)
type

imp <- jomoImpute(studentratings, type=type, group="FedState", n.burn=100, n.iter=10, m=5)

# *** ................................
# the 'formula' interface
# 

# * Example 2.1 (studentratings): 'ReadDis' and 'SES' predicted by 'ReadAchiev'
# (random slope)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- jomoImpute(studentratings, formula=fml, n.burn=100, n.iter=10, m=5)

# * Example 2.2 (studentratings): 'ReadDis' predicted by 'ReadAchiev' and the
# the cluster mean of 'ReadAchiev'

fml <- ReadDis ~ ReadAchiev + I(clusterMeans(ReadAchiev,ID)) + (1|ID)
imp <- jomoImpute(studentratings, formula=fml, n.burn=100, n.iter=10, m=5)

# * Example 2.3 (studentratings): 'ReadDis' predicted by 'ReadAchiev', groupwise
# for 'FedState'

fml <- ReadDis ~ ReadAchiev + (1|ID)
imp <- jomoImpute(studentratings, formula=fml, group="FedState", n.burn=100, n.iter=10, m=5)

# * Example 2.4 (leadership): all variables (mixed continuous and categorical
# data with missing values at level 1 and level 2)

fml <- list( JOBSAT + NEGLEAD + WLOAD ~ 1 + (1|GRPID) , COHES ~ 1 )
imp <- jomoImpute(leadership, formula=fml, n.burn=100, n.iter=10, m=5)

# * Example 2.5 (studentratings): 'ReadDis', 'ReadAchiev', and 'SES' predicted
# with empty model, groupwise for 'FedState' (single-level imputation)

fml <- ReadDis + ReadAchiev + SES ~ 1
imp <- jomoImpute(studentratings, formula=fml, group="FedState", n.burn=100, n.iter=10, m=5)



