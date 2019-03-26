library(IncDTW)


### Name: plot_idtw
### Title: Plot the results from Dynamic Time Warping
### Aliases: plot_idtw plot.idtw plotQC plotWarp

### ** Examples


Q <- cumsum(rnorm(100))
C <- Q[11:100] + rnorm(90, 0, 0.5)
# the ordinary calculation
tmp <- dtw(Q = Q, C = C, ws = 15, return_wp = TRUE, return_QC = TRUE) 

plotQC(tmp, Q, C)
plotWarp(tmp, Q, C)
plot(tmp, type = 'warp')
plot(tmp, Q = Q, C = C, type = 'QC')
# since return_QC = TRUE, this is also possible
plot(tmp, type = 'QC')




