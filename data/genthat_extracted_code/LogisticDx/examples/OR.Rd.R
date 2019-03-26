library(LogisticDx)


### Name: OR
### Title: *O*dds *r*atio for binary regression models fit with 'glm'
### Aliases: OR OR.default OR.glm

### ** Examples

if(require("graphics")){
    plot(x <- seq(from=0.1, to=0.9, by=0.05), y=OR(x))}
## H&L 2nd ed. Table 1.3. Page 10.
data(ageChd)
summary(g1 <- glm(chd ~ age, data=ageChd, family=binomial))
OR(g1)
attributes(OR(g1))
## Table 1.4. Page 20.
stats::vcov(g1)
## Table 2.3. Page 38.
data(lbw)
summary(g1 <- glm(LOW ~ LWT + RACE, data=lbw, family=binomial))
## Table 2.4. Page 42.
vcov(g1)
ageChd$gr54 <- ageChd$age > 54
OR(glm(chd ~ gr54, data=ageChd, family=binomial))



