library(heemod)


### Name: join
### Title: Project Beyond a Survival Distribution with Another
### Aliases: join project project_ join_

### ** Examples


dist1 <- define_survival(distribution = "exp", rate = .5)
dist2 <- define_survival(distribution = "gompertz", rate = .5, shape = 1)
join_dist <- join(dist1, dist2, at=20)



