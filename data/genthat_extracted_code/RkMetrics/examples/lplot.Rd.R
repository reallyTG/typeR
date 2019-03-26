library(RkMetrics)


### Name: lplot
### Title: A Plotting Function
### Aliases: lplot
### Keywords: lplot

### ** Examples

m1 <- Mortality$D.Male[which(Mortality$Year == 2008)]
m2 <- Mortality$E.Male[which(Mortality$Year == 2008)]
male.1 <- m1/m2
male.2 <- log(male.1[!is.na(male.1)])
lplot(1:length(male.2),male.2)

lplot(1:length(male.2),male.2,add=TRUE)




