library(ssym)


### Name: Snacks
### Title: Textures of five different types of snacks
### Aliases: Snacks

### ** Examples

data("Snacks", package="ssym")
boxplot(log(Snacks$texture) ~ Snacks$type, xlab="Type of Snack", ylab="Log(texture)")



