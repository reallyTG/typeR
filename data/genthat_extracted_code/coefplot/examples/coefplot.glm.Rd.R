library(coefplot)


### Name: coefplot.glm
### Title: coefplot.glm
### Aliases: coefplot.glm

### ** Examples


model2 <- glm(price > 10000 ~ carat + cut*color, data=diamonds, family=binomial(link="logit"))
coefplot(model2)
coefplot(model2, trans=invlogit)



