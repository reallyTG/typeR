library(mbbefd)


### Name: eecf
### Title: Empirical Exposure Curve Function
### Aliases: eecf plot.eecf lines.eecf print.eecf summary.eecf

### ** Examples


x <- c(0.4756816, 0.1594636, 0.1913558, 0.2387725, 0.1135414, 0.7775612,
  0.6858736, 0.4340655, 0.3181558, 0.1134244)

#print
eecf(x)

#summary
summary(eecf(x))

#plot
plot(eecf(x))

#lines
lines(eecf(x[1:4]), col="red")



