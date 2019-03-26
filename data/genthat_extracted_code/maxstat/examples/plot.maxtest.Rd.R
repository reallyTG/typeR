library(maxstat)


### Name: plot.maxtest
### Title: Print and Plot Standardized Statistics
### Aliases: plot.maxtest print.maxtest plot.mmaxtest print.mmaxtest
### Keywords: htest

### ** Examples


set.seed(29)

x <- sort(runif(20))
y <- rbinom(20, 1, 0.5)
mydata <- data.frame(c(x,y))

mod <- maxstat.test(y ~ x, data=mydata, smethod="Median", 
                    pmethod="HL", alpha=0.05)
print(mod)
plot(mod)




