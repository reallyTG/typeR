library(Ecfun)


### Name: canbeNumeric
### Title: Can a variable reasonably be coerced to numeric?
### Aliases: canbeNumeric
### Keywords: aplot

### ** Examples

##
## Examples adapted from "mode"
##
cex4 <- c('letters[1:4]', "as.Date('2014-01-02')", 
  'factor(letters[1:4])', "NULL", "1", "1:1", "1i", 
  "list(1)", "data.frame(x = 1)","pairlist(pi)", 
  "c", "lm", "formals(lm)[[1]]",  "formals(lm)[[2]]",
  "y ~ x","expression((1))[[1]]", "(y ~ x)[[1]]",
  "expression(x <- pi)[[1]][[1]]")
lex4 <- sapply(cex4, function(x) eval(parse(text = x)))
mex4 <- t(sapply(lex4, function(x) 
    c(typeof(x), storage.mode(x), mode(x), canbeNumeric(x))))
dimnames(mex4) <- list(cex4, 
    c("typeof(.)","storage.mode(.)","mode(.)", 'canbeNumeric(x)'))
mex4

# check 
mex. <- as.character(as.logical(c(0, 1, 0, 0, 1, 1, rep(0, 12))))
names(mex.) <- cex4
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(mex4[,4], mex.)
## Don't show: 
)
## End(Don't show)



