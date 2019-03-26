library(gsDesign)


### Name: sfLogistic
### Title: 4.7: Two-parameter Spending Function Families
### Aliases: sfLogistic sfNormal sfExtremeValue sfExtremeValue2 sfCauchy
###   sfBetaDist
### Keywords: design

### ** Examples

# design a 4-analysis trial using a Kim-DeMets spending function 
# for both lower and upper bounds 
x<-gsDesign(k=4, sfu=sfPower, sfupar=3, sfl=sfPower, sflpar=1.5)

# print the design
x

# plot the alpha- and beta-spending functions
plot(x, plottype=5)

# start by showing how to fit two points with sfLogistic
# plot the spending function using many points to obtain a smooth curve
# note that curve fits the points x=.1,  y=.01 and x=.4,  y=.1 
# specified in the 3rd parameter of sfLogistic
t <- 0:100/100
plot(t,  sfLogistic(1, t, c(.1, .4, .01, .1))$spend, 
    xlab="Proportion of final sample size", 
    ylab="Cumulative Type I error spending", 
    main="Logistic Spending Function Examples", 
    type="l", cex.main=.9)
lines(t, sfLogistic(1, t, c(.01, .1, .1, .4))$spend, lty=2)

# now just give a=0 and b=1 as 3rd parameters for sfLogistic 
lines(t, sfLogistic(1, t, c(0, 1))$spend, lty=3)

# try a couple with unconventional shapes again using
# the xy form in the 3rd parameter
lines(t, sfLogistic(1, t, c(.4, .6, .1, .7))$spend, lty=4)
lines(t, sfLogistic(1, t, c(.1, .7, .4, .6))$spend, lty=5)
legend(x=c(.0, .475), y=c(.76, 1.03), lty=1:5, 
legend=c("Fit (.1, 01) and (.4, .1)", "Fit (.01, .1) and (.1, .4)", 
    "a=0,  b=1", "Fit (.4, .1) and (.6, .7)",
     "Fit (.1, .4) and (.7, .6)"))

# set up a function to plot comparsons of all
# 2-parameter spending functions
plotsf <- function(alpha, t, param)
{   
    plot(t, sfCauchy(alpha, t, param)$spend,
    xlab="Proportion of enrollment", 
    ylab="Cumulative spending", type="l", lty=2)
    lines(t, sfExtremeValue(alpha, t, param)$spend, lty=5)
    lines(t, sfLogistic(alpha, t, param)$spend, lty=1)
    lines(t, sfNormal(alpha, t, param)$spend, lty=3)
    lines(t, sfExtremeValue2(alpha, t, param)$spend, lty=6, col=2)
    lines(t, sfBetaDist(alpha, t, param)$spend, lty=7, col=3)
    legend(x=c(.05, .475), y=.025*c(.55, .9),
             lty=c(1, 2, 3, 5, 6, 7), 
             col=c(1, 1, 1, 1, 2, 3), 
        legend=c("Logistic", "Cauchy", "Normal", "Extreme value", 
        "Extreme value 2", "Beta distribution"))
}
# do comparison for a design with conservative early spending
# note that Cauchy spending function is quite different
# from the others
param <- c(.25, .5, .05, .1)
plotsf(.025, t, param)



