library(quokar)


### Name: frame_ald_weight
### Title: Weighting Matrix of Quantile regression using Asymmetric Laplace
###   Distrubtion
### Aliases: frame_ald_weight

### ** Examples

library(ggplot2)
library(dplyr)
library(ALDqr)
data(ais)
y <- ais$BMI
x <- cbind(1, ais$LBM)
tau <-  c(0.1, 0.5, 0.9)
error <- 1e-06
iter <- 100
weights <- frame_ald_weight(y, x, tau, error, iter)
weights




