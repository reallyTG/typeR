library(lmerTest)


### Name: plot.ls_means
### Title: Bar Plots of LS-Means
### Aliases: plot.ls_means
### Keywords: internal

### ** Examples


# Fit example model with 2 factors:
data("cake", package="lme4")
cake$Temp <- factor(cake$temperature, ordered = FALSE)
model <- lmer(angle ~ recipe * Temp + (1|recipe:replicate), cake)

# Extract LS-means:
(lsm <- ls_means(model))

# Multi-frame plot of the LS-means
plot(lsm)

# Compute list of 'single frame' plots:
res <- plot(lsm, mult=FALSE)

# Display each plot separately:
plot(res[[1]])
plot(res[[2]])

# Example with pairwise differences of LS-means:
(lsm <- ls_means(model, pairwise = TRUE))
plot(lsm, which="Temp")




