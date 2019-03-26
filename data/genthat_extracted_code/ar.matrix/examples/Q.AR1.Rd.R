library(ar.matrix)


### Name: Q.AR1
### Title: Precision matrix for an AR1 process
### Aliases: Q.AR1 r.AR1

### ** Examples

require("ggplot2")
# simulate AR1 GMRF
obs <- r.AR1(100, M=30, sigma=1, rho=.98)
# resulting matrix is n x M
dim(obs)
# subtract off the first time point to more easily observe correlation
obs_adj <- obs - obs[,1]
# move objects to a data frame
ar1_df <- data.frame(obs=c(t(obs_adj)), realization=rep(1:100, each=30),
                     time=rep(1:30, 100))
# plot each realization
ggplot(data=ar1_df, aes(time, obs, group=realization, color=realization)) +
    geom_line()




