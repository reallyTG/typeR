library(VCA)


### Name: as.matrix.VCAinference
### Title: Standard 'as.matrix' Method for 'VCAinference' S3-Objects.
### Aliases: as.matrix.VCAinference

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D inf <- VCAinference(fit, VarVC=TRUE)
##D as.matrix(inf, what="VC", digits=6)
##D as.matrix(inf, what="SD", digits=6)
##D as.matrix(inf, what="CV", digits=2)
##D 
##D # request list of matrices
##D as.matrix(inf)
## End(Not run)



