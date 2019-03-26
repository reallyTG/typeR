library(gsDesign)


### Name: sfPower
### Title: 4.2: Kim-DeMets (power) Spending Function
### Aliases: sfPower
### Keywords: design

### ** Examples

# design a 4-analysis trial using a Kim-DeMets spending function 
# for both lower and upper bounds 
x <- gsDesign(k=4, sfu=sfPower, sfupar=3, sfl=sfPower, sflpar=1.5)

# print the design
x

# plot the spending function using many points to obtain a smooth curve
# show rho=3 for approximation to O'Brien-Fleming and rho=.75 for 
# approximation to Pocock design.
# Also show rho=2 for an intermediate spending.
# Compare these to Hwang-Shih-DeCani spending with gamma=-4,  -2,  1
t <- 0:100/100
plot(t,  sfPower(0.025, t, 3)$spend, xlab="Proportion of sample size", 
    ylab="Cumulative Type I error spending", 
    main="Kim-DeMets (rho) versus Hwang-Shih-DeCani (gamma) Spending", 
    type="l", cex.main=.9)
lines(t, sfPower(0.025, t, 2)$spend, lty=2)
lines(t, sfPower(0.025, t, 0.75)$spend, lty=3)
lines(t, sfHSD(0.025, t, 1)$spend, lty=3, col=2)
lines(t, sfHSD(0.025, t, -2)$spend, lty=2, col=2)
lines(t, sfHSD(0.025, t, -4)$spend, lty=1, col=2)
legend(x=c(.0, .375), y=.025*c(.65, 1), lty=1:3, 
       legend=c("rho= 3", "rho= 2", "rho= 0.75"))
legend(x=c(.0, .357), y=.025*c(.65, .85), lty=1:3, bty="n", col=2, 
       legend=c("gamma= -4", "gamma= -2", "gamma=1"))



