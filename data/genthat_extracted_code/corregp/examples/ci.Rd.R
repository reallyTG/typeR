library(corregp)


### Name: ci
### Title: Confidence Interval
### Aliases: ci

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
ci(haireye.crg$conf$eigen[, 1])
ci(haireye.crg$conf$eigen[, 2])
## End(No test)



