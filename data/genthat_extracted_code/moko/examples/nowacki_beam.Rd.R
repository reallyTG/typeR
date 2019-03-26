library(moko)


### Name: nowacki_beam
### Title: Test function: The Nowacki Beam
### Aliases: nowacki_beam

### ** Examples


grid <- expand.grid(seq(0, 1, , 50),seq(0, 1, , 50))
res <- apply(grid, 1, nowacki_beam, box = data.frame(b = c(10, 50), h = c(50, 250)))
par(mfrow = c(3,3))
for(i in 1:nrow(res))
 contour(matrix(res[i,],50))



