library(heemod)


### Name: apply_or
### Title: Apply an Odds Ratio
### Aliases: apply_or

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .25)
po_dist <- apply_or(dist1, 1.2)



