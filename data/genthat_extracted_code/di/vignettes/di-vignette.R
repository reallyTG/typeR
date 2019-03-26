## ------------------------------------------------------------------------

library(di)
# Simulate database of N individuals:
N <- 1000
dd <- data.frame(subj=seq(1:N), 
                 var1=rbinom(N,1,.5), 
                 var2=rbinom(N,1,.5), 
                 var3=rbinom(N,1,.5),
                 age=rnorm(N, 80, 20))
# Calculate DI
ddi <- di(dd, c("var1", "var2", "var3"))

## ------------------------------------------------------------------------
ddi <- di(dd, c("var1", "var2", "var3"), rescale = FALSE)

## ------------------------------------------------------------------------
ddi <- di(dd, c("var1", "var2", "var3"), rescale.custom = c("var1:0.2:0.8", "var3:0.3:0.7"))

## ------------------------------------------------------------------------
ddi <- di(dd, c("var1", "var2", "var3"), rescale.avoid = c("var2"))

## ------------------------------------------------------------------------
ddi <- di(dd, c("var1", "var2", "var3"), rescale = FALSE, invert=c("var1", "var3"))

## ------------------------------------------------------------------------
ddi <- di(dd, c("var1", "var2", "var3"), age="age", visible=TRUE)

