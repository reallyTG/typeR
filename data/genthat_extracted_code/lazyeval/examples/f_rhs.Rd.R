library(lazyeval)


### Name: f_rhs
### Title: Get/set formula components.
### Aliases: f_rhs f_rhs<- f_lhs f_lhs<- f_env f_env<-

### ** Examples

f_rhs(~ 1 + 2 + 3)
f_rhs(~ x)
f_rhs(~ "A")
f_rhs(1 ~ 2)

f_lhs(~ y)
f_lhs(x ~ y)

f_env(~ x)



