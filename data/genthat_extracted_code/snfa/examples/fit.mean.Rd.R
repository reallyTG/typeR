library(snfa)


### Name: fit.mean
### Title: Kernel smoothing with additional constraints
### Aliases: fit.mean

### ** Examples

data(USMacro)

USMacro <- USMacro[complete.cases(USMacro),]

#Extract data
X <- as.matrix(USMacro[,c("K", "L")])
y <- USMacro$Y

#Reflect data for fitting
reflected.data <- reflect.data(X, y)
X.eval <- reflected.data$X
y.eval <- reflected.data$y

#Fit frontier
fit.mc <- fit.mean(X.eval, y.eval, 
                   X.constrained = X,
                   X.fit = X,
                   method = "mc")

#Plot input productivities over time
library(ggplot2)
plot.df <- data.frame(Year = rep(USMacro$Year, times = 2),
                      Elasticity = c(fit.mc$gradient.fit[,1] * X[,1] / y,
                                     fit.mc$gradient.fit[,2] * X[,2] / y),
                      Variable = rep(c("Capital", "Labor"), each = nrow(USMacro)))

ggplot(plot.df, aes(Year, Elasticity)) +
  geom_line() +
  facet_grid(Variable ~ ., scales = "free_y")
  



