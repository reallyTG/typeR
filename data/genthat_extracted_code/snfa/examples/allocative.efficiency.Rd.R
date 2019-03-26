library(snfa)


### Name: allocative.efficiency
### Title: Allocative efficiency estimation
### Aliases: allocative.efficiency

### ** Examples

data(USMacro)

USMacro <- USMacro[complete.cases(USMacro),]

#Extract data
X <- as.matrix(USMacro[,c("K", "L")])
y <- USMacro$Y

X.price <- as.matrix(USMacro[,c("K.price", "L.price")])
y.price <- rep(1e9, nrow(USMacro)) #Price of $1 billion of output is $1 billion

#Run model
efficiency.model <- allocative.efficiency(X, y,
                                         X.price, y.price,
                                         X.constrained = X,
                                         model = "br",
                                         method = "mc")

#Plot technical/allocative efficiency over time
library(ggplot2)

technical.df <- data.frame(Year = USMacro$Year,
                          Efficiency = efficiency.model$technical.efficiency)

ggplot(technical.df, aes(Year, Efficiency)) +
  geom_line()

allocative.df <- data.frame(Year = rep(USMacro$Year, times = 2),
                            log.overallocation = c(efficiency.model$log.overallocation[,1],
                                                   efficiency.model$log.overallocation[,2]),
                            Variable = rep(c("K", "L"), each = nrow(USMacro)))

ggplot(allocative.df, aes(Year, log.overallocation)) +
  geom_line(aes(color = Variable))

#Estimate average overallocation across sample period
lm.model <- lm(log.overallocation ~ 0 + Variable, allocative.df)
summary(lm.model)
  



