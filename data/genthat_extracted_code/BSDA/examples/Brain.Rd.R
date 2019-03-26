library(BSDA)


### Name: Brain
### Title: Brain weight versus body weight of 28 animals
### Aliases: Brain
### Keywords: datasets

### ** Examples


plot(log(brainweight) ~ log(bodyweight), data = Brain, 
     pch = 19, col = "blue", main = "Example 2.3")
mod <- lm(log(brainweight) ~ log(bodyweight), data = Brain)      
abline(mod, lty = "dashed", col = "blue")





