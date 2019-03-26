library(ggm)


### Name: pcor
### Title: Partial correlation
### Aliases: pcor
### Keywords: models multivariate

### ** Examples

data(marks)
## The correlation between vectors and algebra given analysis and statistics
 pcor(c("vectors", "algebra", "analysis", "statistics"), var(marks))
## The same
pcor(c(2,3,4,5), var(marks))
## The correlation between vectors and algebra given statistics
 pcor(c("vectors", "algebra", "statistics"), var(marks))
## The marginal correlation between analysis and statistics 
pcor(c("analysis","statistics"), var(marks))



