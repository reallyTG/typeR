library(fdANOVA)


### Name: plotFANOVA
### Title: Plot Univariate Functional Data
### Aliases: plotFANOVA
### Keywords: Plot

### ** Examples

# Some of the examples may run some time.

# gait data (both features)
library(fda)
gait.data.frame <- as.data.frame(gait)
x.gait <- vector("list", 2)
x.gait[[1]] <- as.matrix(gait.data.frame[, 1:39])
x.gait[[2]] <- as.matrix(gait.data.frame[, 40:78])

# vector of group labels
group.label.gait <- rep(1:3, each = 13)
## No test: 
plotFANOVA(x = x.gait[[1]], int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), separately = TRUE)
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), means = TRUE)

plotFANOVA(x = x.gait[[1]], int = c(0.025, 0.975), smooth = TRUE)
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), smooth = TRUE)
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), separately = TRUE, smooth = TRUE)
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), means = TRUE, smooth = TRUE)

plotFANOVA(x = x.gait[[2]], int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), separately = TRUE)
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), means = TRUE)

plotFANOVA(x = x.gait[[2]], int = c(0.025, 0.975), smooth = TRUE)
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), smooth = TRUE)
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), separately = TRUE, smooth = TRUE)
plotFANOVA(x = x.gait[[2]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), means = TRUE, smooth = TRUE)

# Canadian Weather data (both features)
library(fda)
x.CW <- vector("list", 2)
x.CW[[1]] <- CanadianWeather$dailyAv[,,1]
x.CW[[2]] <- CanadianWeather$dailyAv[,,2]

# vector of group labels
group.label.CW <- rep(c("Eastern", "Western", "Northern"), c(15, 15, 5))

plotFANOVA(x = x.CW[[1]])
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW))
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW),
           separately = TRUE)
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW),
           means = TRUE)

plotFANOVA(x = x.CW[[1]], smooth = TRUE)
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW),
           smooth = TRUE)
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW),
           separately = TRUE, smooth = TRUE)
plotFANOVA(x = x.CW[[1]], group.label = as.character(group.label.CW),
           means = TRUE, smooth = TRUE)

plotFANOVA(x = x.CW[[2]])
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW))
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW),
           separately = TRUE)
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW),
           means = TRUE)

plotFANOVA(x = x.CW[[2]], smooth = TRUE)
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW),
           smooth = TRUE)
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW),
           separately = TRUE, smooth = TRUE)
plotFANOVA(x = x.CW[[2]], group.label = as.character(group.label.CW),
           means = TRUE, smooth = TRUE)
## End(No test)
## Don't show: 
plotFANOVA(x = x.gait[[1]], int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975))
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), separately = TRUE)
plotFANOVA(x = x.gait[[1]], group.label = as.character(group.label.gait),
           int = c(0.025, 0.975), means = TRUE)
## End(Don't show)



