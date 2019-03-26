library(sitar)


### Name: who06
### Title: The WHO 2006 growth standard
### Aliases: who06
### Keywords: datasets

### ** Examples

data(who06)
## calculate z-score for length 60 cm in boys at age 0:12 months
LMS2z(x = 0:12/12, y = 60, sex = 1, measure = 'ht', ref = 'who06')



