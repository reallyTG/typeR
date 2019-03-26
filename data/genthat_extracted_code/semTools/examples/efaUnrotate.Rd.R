library(semTools)


### Name: efaUnrotate
### Title: Analyze Unrotated Exploratory Factor Analysis Model
### Aliases: efaUnrotate

### ** Examples


unrotated <- efaUnrotate(HolzingerSwineford1939, nf = 3,
                         varList=paste0("x", 1:9), estimator = "mlr")
summary(unrotated, std = TRUE)
inspect(unrotated, "std")

dat <- data.frame(HolzingerSwineford1939,
                  z = rnorm(nrow(HolzingerSwineford1939), 0, 1))
unrotated2 <- efaUnrotate(dat, nf = 2, varList = paste0("x", 1:9), aux = "z")




