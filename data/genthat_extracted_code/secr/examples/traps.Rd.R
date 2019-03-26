library(secr)


### Name: traps
### Title: Detector Array
### Aliases: 'traps object' traps traps<-
### Keywords: classes

### ** Examples


demotraps <- make.grid(nx = 8, ny = 6, spacing = 30)
demotraps    ## uses print method for traps
summary (demotraps)

plot (demotraps, border = 50, label = TRUE, offset = 8, 
    gridlines=FALSE)  

## generate an arbitrary covariate `randcov'
covariates (demotraps) <- data.frame(randcov = rnorm(48))

## overplot detectors that have high covariate values
temptr <- subset(demotraps, covariates(demotraps)$randcov > 0.5)
plot (temptr, add = TRUE, 
    detpar = list (pch = 16, col = "green", cex = 2))  



