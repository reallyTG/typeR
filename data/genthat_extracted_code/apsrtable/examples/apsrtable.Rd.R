library(apsrtable)


### Name: apsrtable
### Title: APSR-style latex tables with multiple models
### Aliases: apsrtable

### ** Examples
 
     ## Use the example from lm() to show both models:
     ## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
     ## Page 9: Plant Weight Data.
     ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
     trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
     group <- gl(2,10,20, labels=c("Ctl","Trt"))
     weight <- c(ctl, trt)
     lm.D9 <- lm(weight ~ group)
     glm.D9 <- glm(weight~group)
     lm.D90 <- lm(weight ~ group - 1) # omitting intercept
     apsrtable(lm.D90, lm.D9, glm.D9, digits=1, align="center", 
               stars="default", model.counter=0, order="rl")
     ## Not run: 
##D apsrtable(lm.D90, lm.D9, glm.D9, digits=1, align="l", 
##D           stars=1, model.counter=0, order="rl",
##D           coef.rows=1, col.hspace="3em", float="sidewaystable")
##D 
##D ## Omit rows by regular expressions
##D apsrtable(lm.D9, omitcoef=expression(grep("\\(",coefnames)))
##D apsrtable(lm.D90,lm.D9,
##D           omitcoef=list("groupCtl",
##D             expression(grep("\\(",coefnames,value=TRUE))
##D             )
##D           )
## End(Not run)




