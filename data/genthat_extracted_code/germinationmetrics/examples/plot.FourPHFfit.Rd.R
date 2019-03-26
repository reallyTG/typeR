library(germinationmetrics)


### Name: plot.FourPHFfit
### Title: Plot the four-parameter hill function fitted cumulative
###   germination curve from a 'FourPHFfit' object
### Aliases: plot.FourPHFfit

### ** Examples


x <- c(0, 0, 0, 0, 4, 17, 10, 7, 1, 0, 1, 0, 0, 0)
y <- c(0, 0, 0, 0, 4, 21, 31, 38, 39, 39, 40, 40, 40, 40)
int <- 1:length(x)
total.seeds = 50

# From partial germination counts
#----------------------------------------------------------------------------
fit1 <- FourPHFfit(germ.counts = x, intervals = int,
                   total.seeds = 50, tmax = 20)

# From cumulative germination counts
#----------------------------------------------------------------------------
fit2 <- FourPHFfit(germ.counts = y, intervals = int,
                   total.seeds = 50, tmax = 20, partial = FALSE)

# Default plots
plot(fit1)
plot(fit2)

# No labels
plot(fit1, plotlabels = FALSE)
plot(fit2, plotlabels = FALSE)

# Only the FPHF curve
plot(fit1, rog = FALSE, t50.total = FALSE, t50.germ = FALSE,
     tmgr = FALSE, mgt = FALSE, uniformity = FALSE)
plot(fit2, rog = FALSE, t50.total = FALSE, t50.germ = FALSE,
     tmgr = FALSE, mgt = FALSE, uniformity = FALSE)

# Without y axis limits adjustment
plot(fit1, limits = FALSE)
plot(fit2, limits = FALSE)




