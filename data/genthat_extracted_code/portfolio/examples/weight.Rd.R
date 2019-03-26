library(portfolio)


### Name: weight
### Title: Calculate Position Weights
### Aliases: weight
### Keywords: file

### ** Examples

data <- data.frame(in.var = 1:50, weight.var = NA)
data$in.var <- as.numeric(data$in.var)

weight(data, in.var = "in.var", type = "linear", size = "quintile",
       sides = c("long", "short"))

data$weight.var[25] <- -0.05
weight(data, in.var = "in.var", type = "linear", size = "quintile",
       sides = c("long", "short"), weight.var = "weight.var")



