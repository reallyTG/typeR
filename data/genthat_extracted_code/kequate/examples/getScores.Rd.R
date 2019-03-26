library(kequate)


### Name: getScores
### Title: Retrieve the Score Vectors of an Equating
### Aliases: getScores getScores-class getScores,keout-method

### ** Examples

P<-c(5, 20, 35, 25, 15)
Q<-c(10, 30, 30, 20, 10)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
glmy<-glm(Q~I(x)+I(x^2), family="poisson", x=TRUE)
keEG<-kequate("EG", 0:4, 0:4, glmx, glmy)
getScores(keEG)



