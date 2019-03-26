library(R2MLwiN)


### Name: bes83
### Title: Subsample from British Election Study, '83.
### Aliases: bes83
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(bes83, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(logit(votecons, cons) ~ 1 + defence + unemp + taxes + privat + (1 | area),
##D   D = "Binomial", estoptions = list(EstM = 1), data = bes83))
##D 
## End(Not run)



