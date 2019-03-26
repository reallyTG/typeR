library(lplyr)


### Name: mutate_.list
### Title: Dplyr verbs for lists and pairlists
### Aliases: mutate_.list mutate_.pairlist rename_.list rename_.pairlist

### ** Examples

xs <- list(x1 = 1:3, 
           x2 = 2:5, 
           x3 = list("alpha", c("beta", "gamma")))

# Non-standard evaluation
mutate(xs, x4 = 4)
rename(xs, x0 = x1)

# Standard evaluation
mutate_(xs, x4 = ~ 4)
rename_(xs, x0 = ~ x1)




