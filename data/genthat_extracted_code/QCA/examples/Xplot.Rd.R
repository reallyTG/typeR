library(QCA)


### Name: Xplot
### Title: Display the distribution of points for a single condition
### Aliases: Xplot
### Keywords: functions

### ** Examples


# Lipset's raw data
data(LR)

# plot the DEV (level of developent) causal condition
Xplot(LR$DEV)

# jitter the points vertically
Xplot(LR$DEV, jitter = TRUE)

# make the x axis large enough to accommodate all values
Xplot(LR$DEV, jitter = TRUE, at = pretty(LR$DEV))

# clip plotting between the range of min and max
Xplot(LR$DEV, jitter = TRUE, at = range(LR$DEV))



