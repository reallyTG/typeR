library(iopsych)


### Name: paretoXX
### Title: Computes data needed for a XX Pareto plot.
### Aliases: paretoXX

### ** Examples

# Setup Data
data(dls2007)
r_mat <- dls2007[1:6, 2:7]

#Run Model
XX1 <- paretoXX(r_mat=r_mat, x_col=1:4, y_col=5:6)

# Plot Multiple correlations
plot(c(0,1), c(.3,.5), type="n", xlab="C1 Wt", ylab="mr") 
lines(XX1$wt_one, (XX1$R2)[,1])
lines(XX1$wt_one, (XX1$R2)[,2])



