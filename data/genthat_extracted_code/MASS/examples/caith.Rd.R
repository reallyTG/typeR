library(MASS)


### Name: caith
### Title: Colours of Eyes and Hair of People in Caithness
### Aliases: caith
### Keywords: datasets

### ** Examples

corresp(caith)
dimnames(caith)[[2]] <- c("F", "R", "M", "D", "B")
par(mfcol=c(1,3))
plot(corresp(caith, nf=2)); title("symmetric")
plot(corresp(caith, nf=2), type="rows"); title("rows")
plot(corresp(caith, nf=2), type="col"); title("columns")
par(mfrow=c(1,1))



