library(lmerTest)


### Name: as.data.frame.ls_means
### Title: Coerce 'ls_means' Objects to 'data.frame's
### Aliases: as.data.frame.ls_means
### Keywords: internal

### ** Examples


# Fit example model:
data("cake", package="lme4")
cake$Temp <- factor(cake$temperature, ordered = FALSE)
model <- lmer(angle ~ recipe + Temp + (1|recipe:replicate), cake)

# Extract LS-means:
head(lsm <- ls_means(model))

# Coerce LS-means objects to data.frames:
head(as.data.frame(lsm))
head(as.data.frame(lsm, add_levels=FALSE))




