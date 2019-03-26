library(secr)


### Name: turnover
### Title: Specifying a Dynamic Population
### Aliases: turnover
### Keywords: datagen

### ** Examples


par (mfrow = c(2,3), mar = c(1,1,1,1))

## birth and death only
grid <- make.grid(nx = 7, ny = 4, detector = 'proximity', spacing = 10)
pop <- sim.popn (Nbuffer = 100, core = grid, nsessions = 6,    
    details = list(lambda = 0.8, phi = 0.6, sigma.m = 0))
sapply(pop, nrow)  ## how many individuals?
plot(pop)

## movement only
pop2 <- sim.popn (Nbuffer = 100, core = grid, nsessions = 6,    
    details = list(lambda = 1, phi = 1, sigma.m = 10, edgemethod = "wrap"))
pop3 <- sim.popn (Nbuffer = 100, core = grid, nsessions = 6,    
    details = list(lambda = 1, phi = 1, sigma.m = 10, edgemethod = "clip"))
sapply(pop2, nrow)  ## how many individuals?
plot(pop2)

## show effect of edgemethod --
tracks <- function (pop, ...) {
    rn <- unlist(lapply(pop, rownames))
    plot(pop[[1]], pch = 16)
    for (i in unique(rn))
       lines(t(sapply(pop, '[', i, 1:2)), ...)
}
par (mfrow=c(1,2))
tracks(pop2, type = 'o')
tracks(pop3, type = 'o')




