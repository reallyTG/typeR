library(cwhmisc)


### Name: pasteRound
### Title: Paste rounded values
### Aliases: pasteRound
### Keywords: misc documentation

### ** Examples

x <- rnorm(3)
x
matrix(pasteRound("x1=", x[1], ", x2=", x[2], ", x3=", x[3], sep="",
 collapse=","),ncol=1)
matrix(pasteRound("x1=", x[1], ", x2=", x[2], ", x3=", x[3], digits=3,
 sep="$", collapse="_"),ncol=1)



