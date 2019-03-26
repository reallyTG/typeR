library(LambertW)


### Name: IGMM
### Title: Iterative Generalized Method of Moments - IGMM
### Aliases: IGMM
### Keywords: iteration optimize

### ** Examples


# estimate tau for the skewed version of a Normal
y <- rLambertW(n = 1000, theta = list(beta = c(2, 1), gamma = 0.2), 
               distname = "normal")
fity <- IGMM(y, type = "s")
fity
summary(fity)
plot(fity)

# estimate tau for the skewed version of an exponential
y <- rLambertW(n = 1000, theta = list(beta = 1, gamma = 0.5), 
               distname = "exp")
fity <- IGMM(y, type = "s", skewness.x = 2, location.family = FALSE)
fity
summary(fity)
plot(fity)

# estimate theta for the heavy-tailed version of a Normal = Tukey's h
y <- rLambertW(n = 500, theta = list(beta = c(2, 1), delta = 0.2), 
               distname = "normal")
system.time(
fity <- IGMM(y, type = "h")
)
fity
summary(fity)
plot(fity)




