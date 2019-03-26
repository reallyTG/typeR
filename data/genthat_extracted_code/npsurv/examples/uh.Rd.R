library(npsurv)


### Name: uh
### Title: U-shaped Hazard Function
### Aliases: uh uh.object print.uh
### Keywords: function

### ** Examples

(h0 = uh(3, 2, 3, 4, 5, 7, deg=0))              # deg = 0
plot(h0, ylim=c(0,20))
(h1 = uh(4, 2, 3, 5, 6, 7, deg=1))              # deg = 1
plot(h1, add=TRUE, col="green3")
(h2 = uh(1, 1:2, 3:4, 5:6, 7:8, 9, deg=2))      # deg = 2
plot(h2, add=TRUE, col="red3")



