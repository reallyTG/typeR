library(cmm)


### Name: Smoking
### Title: Smoking cessation after experimental intervention
### Aliases: Smoking
### Keywords: datasets

### ** Examples

####################################################################################
# Read data
data(Smoking)

## Not run: 
##D 
##D dat <- Smoking
##D 
##D ####################################################################################
##D # Table TXBR
##D # matrix producing 4x2x3x6 table TXBR
##D 
##D atTXBR <- MarginalMatrix(var = c("X", "B", "R1", "R2", "R3", "R4"), 
##D  marg = list(c("X", "B", "R1"), c("X", "B", "R2"), c("X", "B", "R3"), c("X", "B", "R4")), 
##D  dim = c(2, 3, 5, 5, 5, 5))
##D bt  <- ConstraintMatrix(var = c("T", "X", "B", "R"), suffconfigs = list(c("T", "X", "B"), c("R")), 
##D  dim = c(4, 2, 3, 5))
##D model = list(bt, "log", atTXBR)
##D 
##D fit = MarginalModelFit(dat = dat, model = model, MaxStepSize = .3, MaxSteps = 100, 
##D  ShowProgress = 5)
## End(Not run)




