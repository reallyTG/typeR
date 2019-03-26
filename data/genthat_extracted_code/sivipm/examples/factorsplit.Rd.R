library(sivipm)


### Name: factorsplit
### Title: Transform Categorical Variables into Numeric Variables
### Aliases: factorsplit

### ** Examples

a <- data.frame(V=1:3, color=c("red","green","black"),
                       temp=c("hot", "cold", "hot"))
b <- factorsplit(a)
# The columns in b are: V, color_red, color_green,  color_red, temp



