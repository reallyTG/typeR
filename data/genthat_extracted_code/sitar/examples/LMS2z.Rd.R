library(sitar)


### Name: LMS2z
### Title: Convert to/from measurement from/to z-score with growth
###   reference
### Aliases: LMS2z
### Keywords: arith

### ** Examples


## convert girls' heights data to UK 90 z-scores
data(heights)
data(uk90)
with(heights, LMS2z(age, height, sex = 2, measure = 'ht', ref = 'uk90'))

## construct table of boys weight centiles by age for WHO standard
data(who06)
zs <- -4:4*2/3 # z-scores for centiles
ages <- 0:12/4 # 3-month ages
LMS2z(ages, as.matrix(zs), sex = 1, measure = wt, ref = who06, toz = FALSE)




