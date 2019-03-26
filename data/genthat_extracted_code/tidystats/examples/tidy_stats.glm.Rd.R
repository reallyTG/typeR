library(tidystats)


### Name: tidy_stats.glm
### Title: Create a tidy stats data frame from a glm object
### Aliases: tidy_stats.glm

### ** Examples

# Get data
counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
d.AD <- data.frame(treatment, outcome, counts)

# Run model
glm.D93 <- glm(counts ~ outcome + treatment, family = poisson())

# Tidy stats
tidy_stats(glm.D93)




