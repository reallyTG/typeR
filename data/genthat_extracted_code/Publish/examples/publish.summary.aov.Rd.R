library(Publish)


### Name: publish.summary.aov
### Title: Format summary table of aov results
### Aliases: publish.summary.aov

### ** Examples

 
data(Diabetes)
f <- glm(bp.1s~age+chol+gender+location,data=Diabetes)
publish(summary(aov(f)),digits=c(1,2))




