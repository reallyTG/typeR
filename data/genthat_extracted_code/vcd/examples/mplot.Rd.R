library(vcd)


### Name: mplot
### Title: Multiple Grid plots
### Aliases: mplot

### ** Examples

mplot(mosaic(Titanic, return_grob = TRUE),
      assoc(Titanic), return_grob = TRUE)

A = mosaic(Titanic, return_grob = TRUE)
B = mosaic(Titanic, type = "expected", return_grob = TRUE)
mplot(A, B)

mplot(sieve(SexualFun, return_grob = TRUE),
      agreementplot(SexualFun, return_grob = TRUE),
      main = "Sexual Fun")

mplot(A, grid.circle())



