library(granova)


### Name: granova.2w
### Title: Graphical display of data for two-way analysis of variance
### Aliases: granova.2w
### Keywords: hplot

### ** Examples

 
# using the R dataset warpbreaks; see documentation 
#(first surface flat since fit = 'linear' (default); 
#second surface shows curvature)
granova.2w(warpbreaks)
granova.2w(warpbreaks, formula = breaks ~ wool + tension)
granova.2w(warpbreaks, formula = breaks ~ wool + tension, 
fit = 'quadratic')

# Randomly generated data
resp <- rnorm(80, 0, .25) + rep(c(0, .2, .4, .6), ea = 20)
f1 <- rep(1:4, ea = 20)
f2 <- rep(rep(1:5, ea = 4), 4)
rdat1 <- cbind(resp, f1, f2)
granova.2w(rdat1)
#
rdat2 <- cbind(rnorm(64, 10, 2), sample(1:4, 64, repl = TRUE), 
   sample(1:3, 64, repl = TRUE))
granova.2w(rdat2)
#
#
data(poison)
#Raw Survival Time as outcome measure:
granova.2w(poison[, c(4, 1, 2)])
# Now with quadratic surface (helpful for this poor metric):
granova.2w(poison[, c(4, 1, 2)], fit = 'quadratic') 
#
#Inverse of Survival Time as outcome measure 
#(actually rate of survival, a better version of response, clearly):
granova.2w(poison[, c(5, 1, 2)])
#Now curvature is minimal (confirming adequacy of 
#linear model fit for this metric):
granova.2w(poison[, c(5, 1, 2)], fit = 'quadratic') 
#
#Ranked Version of Inverse:
granova.2w(poison[, c(6, 1, 2)])



