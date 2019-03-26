library(fastpseudo)


### Name: fast_pseudo_mean
### Title: Calculate pseudo-observations.
### Aliases: fast_pseudo_mean

### ** Examples

# Dummy data

id <- c(1, 2, 3, 4)
female <- c(0, 1, 1, 0)
time <- c(23, 45, 38, 66)
event <- c(1, 0, 0, 0)

# Compute pseudo-observations

pseudo = fast_pseudo_mean(time, event, 50)

# Create a data frame

test <- data.frame(id, female, pseudo)

# Fit a regression model

library(geepack)

summary(fit <- geese(pseudo ~ female,
data = test, id=id, jack = TRUE, family=gaussian,
corstr="independence", scale.fix=FALSE))



