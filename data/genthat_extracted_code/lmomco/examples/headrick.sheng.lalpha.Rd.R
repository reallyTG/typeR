library(lmomco)


### Name: headrick.sheng.lalpha
### Title: The Sample Headrick and Sheng L-alpha
### Aliases: headrick.sheng.lalpha lalpha
### Keywords: L-alpha (sample) Headrick and Sheng L-alpha

### ** Examples

# Table 1 in Headrick and Sheng (2013)
TV1 <- # Observations in cols 1:3, estimated nonexceedance probabilities in cols 4:6
c(2, 4, 3, 0.15, 0.45, 0.15,       5, 7, 7, 0.75, 0.95, 1.00,
  3, 5, 5, 0.35, 0.65, 0.40,       6, 6, 6, 0.90, 0.80, 0.75,
  7, 7, 6, 1.00, 0.95, 0.75,       5, 2, 6, 0.75, 0.10, 0.75,
  2, 3, 3, 0.15, 0.25, 0.15,       4, 3, 6, 0.55, 0.25, 0.75,
  3, 5, 5, 0.35, 0.65, 0.40,       4, 4, 5, 0.55, 0.45, 0.40)
T1 <- matrix(ncol=6, nrow=10)
for(r in seq(1,length(TV1), by=6)) T1[(r/6)+1, ] <- TV1[r:(r+5)]
colnames(T1) <- c("X1", "X2", "X3", "FX1", "FX2", "FX3"); T1 <- as.data.frame(T1)

lco2 <- matrix(nrow=3, ncol=3)
lco2[1,1] <- lmoms(T1$X1)$lambdas[2]
lco2[2,2] <- lmoms(T1$X2)$lambdas[2]
lco2[3,3] <- lmoms(T1$X3)$lambdas[2]
lco2[1,2] <- 2*cov(T1$X1, T1$FX2); lco2[1,3] <- 2*cov(T1$X1, T1$FX3)
lco2[2,1] <- 2*cov(T1$X2, T1$FX1); lco2[2,3] <- 2*cov(T1$X2, T1$FX3)
lco2[3,1] <- 2*cov(T1$X3, T1$FX1); lco2[3,2] <- 2*cov(T1$X3, T1$FX2)
headrick.sheng.lalpha(lco2)$alpha     # Headrick and Sheng (2013): alpha = 0.807
# 0.8074766
headrick.sheng.lalpha(T1[,1:3])$alpha #              FXs not used: alpha = 0.781
# 0.7805825



