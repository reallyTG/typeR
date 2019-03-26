library(R2MLwiN)


### Name: gcsemv1
### Title: Pupils' marks from GCSE exams (UK, 1989).
### Aliases: gcsemv1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(gcsemv1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(c(written, csework) ~ 1 + female + (1 | school) + (1 | student), 
##D   D = "Multivariate Normal", estoptions = list(EstM = 1), data = gcsemv1))
##D 
## End(Not run)



