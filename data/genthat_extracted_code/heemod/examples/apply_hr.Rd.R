library(heemod)


### Name: apply_hr
### Title: Apply a Hazard Ratio
### Aliases: apply_hr

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .25)
ph_dist <- apply_hr(dist1, 0.5)




