library(sitar)


### Name: ukwhopt
### Title: UK-WHO growth reference including preterm
### Aliases: ukwhopt
### Keywords: datasets

### ** Examples

data(ukwhopt)
## calculate median birth weight in girls from 23 to 42 weeks gestation
LMS2z(x = (23:42-40) * 7 / 365.25, y = 0, sex = 2, measure = 'wt', ref = 'ukwhopt', toz = FALSE)



