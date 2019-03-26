library(prefeR)


### Name: infer
### Title: A function that estimates the user's underlying utility
###   function.
### Aliases: infer

### ** Examples

 p <- prefEl(data = data.frame(c(1,0,1), c(0,1,1), c(1,1,1)),
             priors = c(Normal(0, 1), Exp(0.5), Flat()))
 p$addPref(1 %>% 2)
 infer(p, estimate = "recommended")



