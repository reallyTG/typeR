library(qrmtools)


### Name: mean_excess
### Title: Mean Excess
### Aliases: mean_excess_np mean_excess_plot mean_excess_GPD
### Keywords: nonparametric hplot

### ** Examples

## (Sample) mean excess function
data(fire)
ME <- mean_excess_np(fire)
stopifnot(dim(ME) == c(2164, 2),
          all.equal(ME[nrow(ME),], c(65.707491, 121.066231),
                    check.attributes = FALSE))

## A 'manual' (sample) mean excess plot
plot(ME, xlab = "Threshold", ylab = "Mean excess over threshold")

## (Sample) mean excess plot
mean_excess_plot(fire)
## => Any value in [10, 20] seems reasonable here as threshold choice
##    (one would probably go with 10 to benefit from a larger sample size).

## With mean excess functions of two fitted GPDs overlaid
u <- c(10, 20) # thresholds
fit <- lapply(u, function(u.) fit_GPD_MLE(fire[fire > u.] - u.))
q <- lapply(u, function(u.) seq(u., ME[nrow(ME),"x"], length.out = 129))
MEF.GPD <- lapply(1:2, function(k)
    mean_excess_GPD(q[[k]]-u[k], shape = fit[[k]]$par[["shape"]],
                    scale = fit[[k]]$par[["scale"]]))
mean_excess_plot(fire, ylim = range(ME, unlist(MEF.GPD)))
col <- c("royalblue3", "maroon3")
for(k in 1:2) lines(q[[k]], MEF.GPD[[k]], col = col[k])
legend("bottomright", col = rev(col), lty = rep(1, length(u)), bty = "n",
       legend = as.expression(sapply(rev(seq_along(u)),
       function(k) substitute("Threshold choice"~~u==u., list(u. = u[k])))))



