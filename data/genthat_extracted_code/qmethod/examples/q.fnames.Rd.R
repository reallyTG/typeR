library(qmethod)


### Name: q.fnames
### Title: Change factor names in the results of Q methodology analysis
### Aliases: q.fnames

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
factor.names <- c("good", "bad", "ugly") 
results2 <- q.fnames(results, fnames = factor.names)
results #shows all results



