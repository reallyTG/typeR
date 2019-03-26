library(npsf)


### Name: truncreg
### Title: Parametric truncated regression for cross-sectional data
### Aliases: truncreg
### Keywords: Truncated regression summary

### ** Examples
 
require( npsf )
 
# Female labor force participation dataset
 
data(mroz)
head(mroz)

t1 <- npsf::truncreg(hours ~ kidslt6 + kidsge6 + age*educ, 
 data = mroz, ll = 0, lmtol = 1e-16, print.level = 2)
 
# matrices also can be used
myY <- mroz$hours
myX <- cbind(mroz$kidslt6, mroz$kidsge6, mroz$age, mroz$educ, mroz$age*mroz$educ)

t1.m <- truncreg(myY ~ myX, ll = 0)

# gives identical result to `t1':
# compare summary(t1) and summary(t1.m)

# using variable for limits is admissible
# we obtain the same result as before

mroz$myll <- 0
t11 <- npsf::truncreg(hours ~ kidslt6 + kidsge6 + age*educ, 
 data = mroz, ll = ~ myll, lmtol = 1e-16, print.level = 0)
summary(t11)

# if you believe that the sample is additionally truncted from above at say 3500

t12 <- update(t1, ul = 3500, print.level = 1)

# for obtaining marginal effects

t13 <- update(t12, marg.eff = TRUE)

summary(t13$marg.effects)




