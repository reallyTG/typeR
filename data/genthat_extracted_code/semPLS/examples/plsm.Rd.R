library(semPLS)


### Name: plsm
### Title: Specification of Path Model
### Aliases: plsm mvplot mvpairs mvplot.plsm mvpairs.plsm

### ** Examples

# getting the path to the .csv file representing the inner Model
ptf_Struc <- system.file("ECSIstrucmod.csv", package="semPLS")

# getting the path to the .csv file representing the outer Models
ptf_Meas <- system.file("ECSImeasuremod.csv", package="semPLS")


sm <- as.matrix(read.csv(ptf_Struc))
mm <- as.matrix(read.csv(ptf_Meas))
data(mobi)

ECSI <- plsm(data=mobi, strucmod=sm, measuremod=mm)

# Adjacency matrix of the structural model
ECSI$D

# Adjacency matrix of the measurement model
ECSI$M

# return all elements
ECSI

### Interactive mode
## Not run: 
##D # specify model in a spreadsheets
##D ECSI <- plsm(data=mobi, interactive=TRUE)
##D ECSI
## End(Not run)

### explore blocks of MVs
mvplot(model=ECSI, data=mobi, LVs="Expectation")
mvpairs(model=ECSI, data=mobi, LVs="Expectation")



