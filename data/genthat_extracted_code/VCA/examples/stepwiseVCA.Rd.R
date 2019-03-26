library(VCA)


### Name: stepwiseVCA
### Title: Bottom-Up Step-Wise VCA-Analysis of the Complete Dataset.
### Aliases: stepwiseVCA

### ** Examples

## Not run: 
##D data(VCAdata1)
##D datS7L1 <- VCAdata1[VCAdata1$sample == 7 & VCAdata1$lot == 1, ]
##D fit0 <- anovaVCA(y~device/day/run, datS7L1, MME=TRUE)
##D 
##D # complete VCA-analysis result
##D fit0
##D 
##D # perform step-wise (bottom-up) VCA-analyses
##D sw.res <- stepwiseVCA(fit0, VarVC=TRUE)
##D sw.res
##D 
##D # get CIs on intermediate precision 
##D VCAinference(sw.res[["device:day"]], VarVC=TRUE)
## End(Not run)



