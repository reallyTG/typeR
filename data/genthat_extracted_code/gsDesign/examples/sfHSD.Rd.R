library(gsDesign)


### Name: sfHSD
### Title: 4.1: Hwang-Shih-DeCani Spending Function
### Aliases: sfHSD
### Keywords: design

### ** Examples

# design a 4-analysis trial using a Hwang-Shih-DeCani spending function 
# for both lower and upper bounds 
x <- gsDesign(k=4, sfu=sfHSD, sfupar=-2, sfl=sfHSD, sflpar=1)

# print the design
x

# since sfHSD is the default for both sfu and sfl,
# this could have been written as
x <- gsDesign(k=4, sfupar=-2, sflpar=1)

# print again
x

# plot the spending function using many points to obtain a smooth curve
# show default values of gamma to see how the spending function changes
# also show gamma=1 which is supposed to approximate a Pocock design
t <- 0:100/100
plot(t,  sfHSD(0.025, t, -4)$spend,
   xlab="Proportion of final sample size", 
   ylab="Cumulative Type I error spending", 
   main="Hwang-Shih-DeCani Spending Function Example", type="l")
lines(t, sfHSD(0.025, t, -2)$spend, lty=2)
lines(t, sfHSD(0.025, t, 1)$spend, lty=3)
legend(x=c(.0, .375), y=.025*c(.8, 1), lty=1:3, 
    legend=c("gamma= -4", "gamma= -2", "gamma= 1"))



