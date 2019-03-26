library(jtrans)


### Name: jtrans
### Title: Johnson Transformation for Normality
### Aliases: jtrans

### ** Examples

# generate 100 non-normal data and transform it.
x <- rexp(50, .2)
jt <- jtrans(x)
jt

plot(density(x))
plot(density(jt$transformed))
qqnorm(jt$transformed)
qqline(jt$transformed)

## Not run: 
##D # Using another normality test
##D require(nortest)
##D jtrans(x, test = "ad.test")
## End(Not run)



