library(fastR2)


### Name: Poison
### Title: Poison data
### Aliases: Poison
### Keywords: datasets

### ** Examples


data(poison)
poison.lm <- lm(time~factor(poison) * factor(treatment), data = Poison) 
plot(poison.lm,w = c(4,2))
anova(poison.lm)
# improved fit using a transformation
poison.lm2 <- lm(1/time ~ factor(poison) * factor(treatment), data = Poison) 
plot(poison.lm2,w = c(4,2))
anova(poison.lm)




