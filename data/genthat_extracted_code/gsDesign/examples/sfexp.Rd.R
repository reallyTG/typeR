library(gsDesign)


### Name: sfExponential
### Title: 4.3: Exponential Spending Function
### Aliases: sfExponential
### Keywords: design

### ** Examples

# use 'best' exponential approximation for k=6 to O'Brien-Fleming design
# (see manual for details)
gsDesign(k=6, sfu=sfExponential, sfupar=0.7849295,
         test.type=2)$upper$bound

# show actual O'Brien-Fleming bound
gsDesign(k=6, sfu="OF", test.type=2)$upper$bound

# show Lan-DeMets approximation
# (not as close as sfExponential approximation)
gsDesign(k=6, sfu=sfLDOF, test.type=2)$upper$bound

# plot exponential spending function across a range of values of interest
t <- 0:100/100
plot(t, sfExponential(0.025, t, 0.8)$spend,
   xlab="Proportion of final sample size", 
   ylab="Cumulative Type I error spending", 
   main="Exponential Spending Function Example", type="l")
lines(t, sfExponential(0.025, t, 0.5)$spend, lty=2)
lines(t, sfExponential(0.025, t, 0.3)$spend, lty=3)
lines(t, sfExponential(0.025, t, 0.2)$spend, lty=4)
lines(t, sfExponential(0.025, t, 0.15)$spend, lty=5)
legend(x=c(.0, .3), y=.025*c(.7, 1), lty=1:5, 
    legend=c("nu = 0.8", "nu = 0.5", "nu = 0.3", "nu = 0.2",
             "nu = 0.15"))
text(x=.59, y=.95*.025, labels="<--approximates O'Brien-Fleming")



