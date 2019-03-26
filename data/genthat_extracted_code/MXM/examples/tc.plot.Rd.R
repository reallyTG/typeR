library(MXM)


### Name: Plot of longitudinal data
### Title: Plot of longitudinal data
### Aliases: tc.plot
### Keywords: Longitudinal data Graphical visualisation

### ** Examples

y <- rnorm(70)
Days <- rep(1:7, each = 10)
id <- rep(1:10, 7)
tc.plot(y, Days, id)
tc.plot(y, Days, id, type = "b")



