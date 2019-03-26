library(ecm)


### Name: durbinH
### Title: Calculate Durbin's h-statistic
### Aliases: durbinH

### ** Examples

##Not run

#Build a simple AR1 model to predict performance of the Wilshire 5000 Index
data(Wilshire)
Wilshire$Wilshire5000Lag1 <- c(NA, Wilshire$Wilshire5000[1:(nrow(Wilshire)-1)])
Wilshire <- Wilshire[complete.cases(Wilshire),]
AR1model <- lm(Wilshire5000 ~ Wilshire5000Lag1, data=Wilshire)

#Check Durbin's h-statistic on AR1model
durbinH(AR1model, "Wilshire5000Lag1")
#The h-statistic is 4.23, which means there is likely autocorrelation in the data.




