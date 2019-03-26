library(RkMetrics)


### Name: iplot
### Title: A Plotting Function
### Aliases: iplot
### Keywords: iplot

### ** Examples

m1 <- Mortality$D.Male[which(Mortality$Year == 2008)]
m2 <- Mortality$E.Male[which(Mortality$Year == 2008)]
male.1 <- m1/m2
male.2 <- log(male.1[!is.na(male.1)])
iplot(1:length(male.2),male.2)

iplot(1:length(male.2),male.2,add=TRUE)




