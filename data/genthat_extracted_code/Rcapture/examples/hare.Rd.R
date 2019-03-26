library(Rcapture)


### Name: hare
### Title: Snowshoe Hare Data
### Aliases: hare
### Keywords: datasets

### ** Examples

data(hare)
desc <- descriptive(hare)
plot(desc)
  # The fi plot shows that the two animals caught on all occasions create 
  # some heterogeneity in the capture probabilities.

closedp(hare)
  # The best fitting model Mth Poisson2(N = 81.1, s.e. = 5.7) has an AIC of 146. 
closedpCI.t(hare, m = "Mth", h = "Poisson", h.control = list(theta = 2))

  # One can compare the fit of this model with that obtained by removing the
  # 2 hares caught 6 times. This can be done by adding a column to the design 
  # matrix for Mt taking the value 1 for the capture history (1,1,1,1,1,1).
col <- rep(0, 2^6-1)
mat <- histpos.t(6)
col[rowSums(mat) == 6] <- 1
closedpCI.t(hare, mX = cbind(mat, col), mname = "Mt without 111111")
  # This gives N = 76.8 (s.e. = 3.9) with an AIC of 146.



