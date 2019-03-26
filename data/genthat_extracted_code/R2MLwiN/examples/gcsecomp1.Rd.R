library(R2MLwiN)


### Name: gcsecomp1
### Title: Pupils' marks from GCSE exams (UK, 1989); complete cases only.
### Aliases: gcsecomp1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(gcsecomp1, package="R2MLwiN")
##D 
##D (mymodel <- runMLwiN(c(written, csework) ~ 1 + female + (1 | school) + (1 | student), 
##D   D = "Multivariate Normal", estoptions = list(EstM = 1), data = gcsecomp1))
##D 
## End(Not run)



