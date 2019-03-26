library(difNLR)


### Name: NLR
### Title: Non-Linear Regression DIF statistic.
### Aliases: NLR
### Keywords: DIF

### ** Examples

## Not run: 
##D # loading data based on GMAT
##D data(GMAT)
##D 
##D Data  <- GMAT[, 1:20]
##D group <- GMAT[, "group"]
##D 
##D # Testing both DIF effects using LR test (default)
##D # and model with fixed guessing for both groups
##D NLR(Data, group, model = "3PLcg")
##D 
##D # Using F test
##D NLR(Data, group, model = "3PLcg", test = "F")
##D 
##D # Testing both DIF effects with Benjamini-Hochberg correction
##D NLR(Data, group, model = "3PLcg", p.adjust.method = "BH")
##D 
##D # 4PL model with the same guessing and inattention
##D # to test uniform DIF
##D NLR(Data, group, model = "4PLcgdg", type = "udif")
##D 
##D # 2PL model to test non-uniform DIF
##D NLR(Data, group, model = "2PL", type = "nudif")
##D 
##D # 4PL model with fixed a and c parameter
##D # to test difference in b
##D NLR(Data, group, model = "4PL", constraints = "ac", type = "b")
##D 
##D # using maximum likelihood estimation method
##D NLR(Data, group, model = "3PLcg", method = "likelihood")
## End(Not run)



