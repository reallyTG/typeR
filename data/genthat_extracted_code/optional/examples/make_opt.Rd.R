library(optional)


### Name: make_opt
### Title: Make optional
### Aliases: make_opt

### ** Examples

c_opt <- make_opt(c)
c_opt(option(2), none, option(5))
## [1] 2 5
c_opt()
## [1] "None"



