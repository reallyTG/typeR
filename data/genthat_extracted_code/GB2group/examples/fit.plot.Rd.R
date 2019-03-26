library(GB2group)


### Name: fit.plot
### Title: Plot of the estimated Lorenz curve and the empirical income
###   shares
### Aliases: fit.plot

### ** Examples

fit.ln <- fitgroup.ln(y = c(9, 13, 17, 22, 39), gini.e = 0.29)
fit.b2 <- fitgroup.b2(y = c(9, 13, 17, 22, 39), gini.e = 0.29)
fit.plot(c("fit.ln", "fit.b2"), fit.legend = TRUE, l.size = 0.8)



