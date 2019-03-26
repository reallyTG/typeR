library(RkMetrics)


### Name: vplot
### Title: A Plotting Function
### Aliases: vplot
### Keywords: vplot

### ** Examples

m1 <- Mortality$D.Male[which(Mortality$Year == 2008)]
m2 <- Mortality$E.Male[which(Mortality$Year == 2008)]
male.1 <- m1/m2
male.2 <- log(male.1[!is.na(male.1)])
vplot(1:length(male.2),male.2)




