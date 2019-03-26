library(broom)


### Name: tidy_xyz
### Title: Tidy a(n) xyz object masquerading as list
### Aliases: tidy_xyz xyz_tidiers

### ** Examples


A <- list(x = 1:5, y = 1:3, z = matrix(runif(5 * 3), nrow = 5))
image(A)
tidy(A)




