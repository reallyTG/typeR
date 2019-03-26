library(QCApro)


### Name: implicIndep
### Title: Test for Implicational Independence between two Factors
### Aliases: implicIndep
### Keywords: functions

### ** Examples

## Not run: 
##D # simulation with 10 sample datasets
##D simulation <- vector(mode = "list", length = 3)
##D n.samples <- 10 
##D 
##D # directions of correlation and number of cases in each sample
##D corr <- c("-", "0", "+") 
##D nofc <- c(40, 160, 640) 
##D simulation <- lapply(nofc, function (x) {lapply(corr, function (y) {
##D   implicIndep("(X1*X2 + X3*X4 <=> Y)*(Z1 + z1)", n.samples, x, y)})})
##D 
##D # has Z1 been eliminated in all data experiments of a block of tests?
##D series.test <- matrix(sapply(1:length(corr), function (x) {sapply(1:length(nofc),
##D   function (y) {simulation[[x]][[y]]$test == "Z1 has been eliminated."})}),
##D   ncol = length(corr), dimnames = list(as.character(nofc), corr))
##D series.test
## End(Not run)



