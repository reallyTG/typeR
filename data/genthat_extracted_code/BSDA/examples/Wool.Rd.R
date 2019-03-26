library(BSDA)


### Name: Wool
### Title: Strength tests of two types of wool fabric
### Aliases: Wool
### Keywords: datasets

### ** Examples


boxplot(strength ~ type, data = Wool, col = c("blue", "purple"))
t.test(strength ~ type, data = Wool, var.equal = TRUE)




