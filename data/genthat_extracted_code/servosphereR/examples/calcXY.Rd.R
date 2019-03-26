library(servosphereR)


### Name: calcXY
### Title: Calculate (x, y) coordinates
### Aliases: calcXY

### ** Examples

 servosphere <- list(data.frame(id = rep(1, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("a", 200),
                                date = rep("2032018", 200)),
                     data.frame(id = rep(2, 200),
                                stimulus = rep(c(0, 1), each = 100),
                                dT = sample(8:12, 200, replace = TRUE),
                                dx = runif(200, 0, 5),
                                dy = runif(200, 0, 5),
                                treatment = rep("b", 200),
                                date = rep("2032018", 200)))
servosphere <- calcXY(servosphere)



