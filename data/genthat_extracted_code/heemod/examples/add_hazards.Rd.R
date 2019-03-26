library(heemod)


### Name: add_hazards
### Title: Add Hazards
### Aliases: add_hazards add_hazards_

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .125)
dist2 <- define_survival(distribution = "weibull", shape = 1.2, scale = 50)
combined_dist <- add_hazards(dist1, dist2)




