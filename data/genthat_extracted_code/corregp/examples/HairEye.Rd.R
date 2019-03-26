library(corregp)


### Name: HairEye
### Title: Hair and Eye Color of Statistics Students (Data Frame)
### Aliases: HairEye

### ** Examples

## No test: 
data(HairEye)
haireye.crg <- corregp(Eye ~ Hair * Sex, data = HairEye, b = 3000)
haireye.crg
summary(haireye.crg, parm = "b", add_ci = TRUE)
screeplot(haireye.crg, add_ci = TRUE)
anova(haireye.crg, nf = 2)
plot(haireye.crg, x_ell = TRUE, xsub = c("Hair", "Sex"))
## End(No test)



