library(VCA)


### Name: lsmMat
### Title: Contrast Matrix for LS Means.
### Aliases: lsmMat

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit1 <- anovaMM(y~day/run, dataEP05A2_1)
##D 
##D VCA:::lsmMat(fit1, "day")	# function not exported
##D VCA:::lsmMat(fit1, "run")
##D VCA:::lsmMat(fit1)			# is equal to listing all fixed terms
##D 
##D # a more complex and unbalanced model
##D data(VCAdata1)
##D datS1 <- VCAdata1[VCAdata1$sample == 1, ]
##D set.seed(42)
##D datS1ub <- datS1[-sample(1:nrow(datS1))[1:25],]
##D fit2 <- anovaMM(y~(lot+device)/day/(run), datS1ub)
##D VCA:::lsmMat(fit2, c("lot", "device"))
## End(Not run)



