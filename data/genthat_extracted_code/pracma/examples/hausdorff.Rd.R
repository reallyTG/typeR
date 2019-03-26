library(pracma)


### Name: hausdorff_dist
### Title: Hausdorff Distance
### Aliases: hausdorff_dist
### Keywords: math

### ** Examples

P <- matrix(c(1,1,2,2, 5,4,5,4), 4, 2)
Q <- matrix(c(4,4,5,5, 2,1,2,1), 4, 2)
hausdorff_dist(P, Q)    # 4.242641 = sqrt(sum((c(4,2)-c(1,5))^2))



