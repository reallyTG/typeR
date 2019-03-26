library(POT)


### Name: pickdep
### Title: The Pickands' Dependence Function
### Aliases: pickdep
### Keywords: models hplot

### ** Examples

x <- rbvgpd(1000, alpha = 0.9, model = "mix", mar1 = c(0,1,0.25),
 mar2 = c(2,0.5,0.1))
Mmix <- fitbvgpd(x, c(0,2), "mix")
pickdep(Mmix)



