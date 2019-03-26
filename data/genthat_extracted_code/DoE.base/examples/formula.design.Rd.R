library(DoE.base)


### Name: formula.design
### Title: Function to change the default formula for a data frame of class
###   design to involve the correct factors with the desired effects and
###   responses
### Aliases: formula.design
### Keywords: array design

### ** Examples

  ## indirect usage via function lm.design is much more interesting
  ## cf help for lm design!

   my.L18 <- oa.design(ID=L18, 
       factor.names = c("one","two","three","four","five","six","seven"), 
       nlevels=c(3,3,3,2,3,3,3))
   y <- rnorm(18)
   my.L18 <- add.response(my.L18, y)
   formula(my.L18)
   lm(my.L18)



