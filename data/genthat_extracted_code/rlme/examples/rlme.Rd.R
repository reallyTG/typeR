library(rlme)


### Name: rlme
### Title: Rank-based Estimates for Mixed-Effects Nested Models
### Aliases: rlme
### Keywords: models

### ** Examples


data(schools)

rlme.fit = rlme(y ~ 1 + sex + age + (1 | region) + (1 | region:school), schools, method="gr")
summary(rlme.fit)

# Try method="geer", "reml", "ml" and "jr" along with 
# rprpair="hl-disp" (not robust), and "med-mad" (robust),
# weight="hbr" is for the gee method.




