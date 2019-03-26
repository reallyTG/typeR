library(heemod)


### Name: apply_af
### Title: Apply an Acceleration Factor
### Aliases: apply_af

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .25)
aft_dist <- apply_af(dist1, 1.5)



