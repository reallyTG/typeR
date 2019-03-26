library(snfa)


### Name: fit.sf
### Title: Non-parametric stochastic frontier
### Aliases: fit.sf

### ** Examples

data(USMacro)

USMacro <- USMacro[complete.cases(USMacro),]

#Extract data
X <- as.matrix(USMacro[,c("K", "L")])
y <- USMacro$Y

#Fit frontier
fit.sf <- fit.sf(X, y,
                 X.constrained = X,
                 method = "mc")

print(fit.sf$mean.efficiency)
# [1] 0.9772484

#Plot efficiency over time
library(ggplot2)

plot.df <- data.frame(Year = USMacro$Year,
                      Efficiency = fit.sf$mode.efficiency)

ggplot(plot.df, aes(Year, Efficiency)) +
  geom_line()
  



