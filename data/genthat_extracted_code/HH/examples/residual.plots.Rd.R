library(HH)


### Name: residual.plots
### Title: Residual plots for a linear model.
### Aliases: residual.plots
### Keywords: hplot regression

### ** Examples

if.R(s={
     longley <- data.frame(longley.x, Employed = longley.y)
     },r={
     data(longley)
     })

longley.lm <- lm( Employed ~ . , data=longley, x=TRUE, y=TRUE)
## 'x=TRUE, y=TRUE' are needed to pass the S-Plus CMD check.
## They may be needed if residual.plots() is inside a nested set of
## function calls.

tmp <- residual.plots(longley.lm)

## print two rows per page
print(tmp[[1]], position=c(0, 0.5, 1, 1.0), more=TRUE)
print(tmp[[2]], position=c(0, 0.0, 1, 0.5), more=FALSE)
print(tmp[[3]], position=c(0, 0.5, 1, 1.0), more=TRUE)
print(tmp[[4]], position=c(0, 0.0, 1, 0.5), more=FALSE)

## print as a single trellis object
ABCD <- do.call(rbind, lapply(tmp, as.vector))
dimnames(ABCD)[[1]] <- dimnames(tmp[[1]])[[1]]
ABCD



