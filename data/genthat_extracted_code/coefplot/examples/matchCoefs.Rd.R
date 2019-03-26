library(coefplot)


### Name: matchCoefs
### Title: matchCoefs
### Aliases: matchCoefs

### ** Examples

## Not run: 
##D require(reshape2)
##D require(plyr)
##D data("tips", package="reshape2")
##D mod1 <- lm(tip ~ total_bill * sex + day, tips)
##D mod2 <- lm(tip ~ total_bill * sex + day - 1, tips)
##D mod3 <- glm(tip ~ total_bill * sex + day, tips, family=gaussian(link="identity"))
##D mod4 <- lm(tip ~ (total_bill + sex + day)^3, tips)
##D mod5 <- lm(tip ~ total_bill * sex + day + I(total_bill^2), tips)
##D coefplot:::matchCoefs(mod1)
##D coefplot:::matchCoefs(mod2)
##D coefplot:::matchCoefs(mod3)
##D coefplot:::matchCoefs(mod4)
##D coefplot:::matchCoefs(mod5)
## End(Not run)



