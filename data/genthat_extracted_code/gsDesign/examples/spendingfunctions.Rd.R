library(gsDesign)


### Name: Spending functions
### Title: 4.0: Spending function overview
### Aliases: 'Spending function overview' spendingFunction summary.spendfn
### Keywords: design

### ** Examples

# Example 1: simple example showing what mose users need to know

# design a 4-analysis trial using a Hwang-Shih-DeCani spending function 
# for both lower and upper bounds 
x <- gsDesign(k=4, sfu=sfHSD, sfupar=-2, sfl=sfHSD, sflpar=1)

# print the design
x
# summarize the spending functions
summary(x$upper)
summary(x$lower)

# plot the alpha- and beta-spending functions
plot(x, plottype=5)

# what happens to summary if we used a boundary function design
x <- gsDesign(test.type=2,sfu="OF")
y <- gsDesign(test.type=1,sfu="WT",sfupar=.25)
summary(x$upper)
summary(y$upper)

# Example 2: advanced example: writing a new spending function  
# Most users may ignore this!

# implementation of 2-parameter version of
# beta distribution spending function
# assumes t and alpha are appropriately specified (does not check!) 
sfbdist <- function(alpha,  t,  param)
{  
   # check inputs
   checkVector(param, "numeric", c(0, Inf), c(FALSE, TRUE))
   if (length(param) !=2) stop(
   "b-dist example spending function parameter must be of length 2")

   # set spending using cumulative beta distribution and return
   x <- list(name="B-dist example", param=param, parname=c("a", "b"), 
             sf=sfbdist, spend=alpha * 
           pbeta(t, param[1], param[2]), bound=NULL, prob=NULL)  
           
   class(x) <- "spendfn"
   
   x
}

# now try it out!
# plot some example beta (lower bound) spending functions using 
# the beta distribution spending function 
t <- 0:100/100
plot(t, sfbdist(1, t, c(2, 1))$spend, type="l", 
    xlab="Proportion of information", 
    ylab="Cumulative proportion of total spending", 
    main="Beta distribution Spending Function Example")
lines(t, sfbdist(1, t, c(6, 4))$spend, lty=2)
lines(t, sfbdist(1, t, c(.5, .5))$spend, lty=3)
lines(t, sfbdist(1, t, c(.6, 2))$spend, lty=4)
legend(x=c(.65, 1), y=1 * c(0, .25), lty=1:4, 
    legend=c("a=2, b=1","a=6, b=4","a=0.5, b=0.5","a=0.6, b=2"))



