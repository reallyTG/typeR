library(hierDiversity)


### Name: hierDiversity
### Title: Hierarchical Group-wise Diversity Partitioning
### Aliases: hierDiversity

### ** Examples

## NOTE: 'reps' argument usually needs to be >= 99.
## The lower values used here are for demonstration.

set.seed(2)
## Create Data Matrix
dat <- matrix(rpois(1000, 3), nrow=100)
#Create Grouping Matrix
group <- as.matrix(data.frame(
  L1 = rep(c("A","B","C","D","E"), each=20),
  L2 = rep(c("AB", "CDE"), times=c(40,60)),
  L3 = rep("total",100)))

hierDiversity(dat, group, reps=9)
replace <- c(FALSE, rep(TRUE, 3))
hierDiversity(dat, group, replace=replace, reps=9, q=2)
div <- hierDiversity(dat, group, reps=9, q=2, 
  quant=c(0.25, 0.75), sims=TRUE)
div$L2$CDE


##### Example data from Fordyce & Malcolm (2000) 
data(milkweedData)
data(milkweedVars)
milkDat <- as.matrix(milkweedData)
milkVars <- as.matrix(milkweedVars)

milkDiv <- hierDiversity(milkDat, milkVars, reps=5, q=3, 
  sims=TRUE)
milkDiv$infectstatus
turnover <- c(milkDiv$infectstatus$I[[2]][,5],
  milkDiv$infectstatus$U[[2]][,5])
infectionStatus <- rep(c("infected","uninfected"), each=6)
boxplot(turnover~infectionStatus, las = 1, 
  ylab = "Turnover", xlab = "Infection Status")



