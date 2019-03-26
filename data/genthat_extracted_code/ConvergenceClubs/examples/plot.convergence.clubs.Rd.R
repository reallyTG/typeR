library(ConvergenceClubs)


### Name: plot.convergence.clubs
### Title: Plot method for S3 class 'convergence.clubs'
### Aliases: plot.convergence.clubs

### ** Examples


data("filteredGDP")

clubs <- findClubs(filteredGDP, dataCols=2:35, unit_names = 1, refCol=35, time_trim = 1/3,
                   cstar = 0, HACmethod = "FQSB")

#plot transition paths for all clubs
plot(clubs)
plot(clubs, y_fixed=TRUE)
plot(clubs, nrows=2,ncols=4)

plot(clubs, ncols=3, lty='dotdash', lwd=3, col="blue")
plot(clubs, ncols=3, y_fixed=TRUE, lty='dotdash', lwd=3, col="blue")

#Plot transition paths only for some clubs
plot(clubs, clubs=c(2,4,5))
plot(clubs, nrows=1, ncols=3, clubs=c(2,4,5), avgTP = FALSE)
plot(clubs, nrows=1, ncols=3, clubs=c(2,4,5), avgTP = FALSE, legend=TRUE)
plot(clubs, clubs=c(2,4,5), avgTP_clubs = c(1,3))
plot(clubs, clubs=c(2,4,5), avgTP_clubs = c(1,3), legend=TRUE)

#Only plot average transition paths
plot(clubs, clubs=NULL, avgTP = TRUE, legend=TRUE)





