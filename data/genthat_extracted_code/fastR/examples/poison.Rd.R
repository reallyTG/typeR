library(fastR)


### Name: poison
### Title: Poison data
### Aliases: poison
### Keywords: datasets

### ** Examples


data(poison)
poison.lm <- lm(Time~factor(Poison) * factor(Treatment), data=poison) 
xplot(poison.lm,w=c(4,2))
anova(poison.lm)
# improved fit using a transformation
poison.lm2 <- lm(1/Time~factor(Poison) * factor(Treatment), data=poison) 
xplot(poison.lm2,w=c(4,2))
anova(poison.lm)




