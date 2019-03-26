library(TropFishR)


### Name: ELEFAN
### Title: ELEFAN
### Aliases: ELEFAN

### ** Examples

## No test: 
data(alba)

### Response Surface Analysis (varies Linf and K) ###

# 'cross' method (used in FiSAT)
fit1 <- ELEFAN(
   x = alba, method = "cross",
   Linf_range = seq(from = 10, to = 20, length.out = 10),
   K_range = exp(seq(from = log(0.1), to = log(2), length.out = 20)),
   cross.date = alba$dates[3], cross.midLength = alba$midLengths[4],
   contour = TRUE
)
fit1$Rn_max; unlist(fit1$par)
plot(fit1); points(alba$dates[3], alba$midLengths[4], col=2, cex=2, lwd=2)

# 'cross' method (bin with maximum score crossed)
fit2 <- ELEFAN(
   x = alba, method = "cross",
   Linf_range = seq(from = 10, to = 20, length.out = 20),
   K_range = exp(seq(from = log(0.1), to = log(2), length.out = 20)),
   cross.max = TRUE,
   contour = TRUE
)
fit2$Rn_max; unlist(fit2$par)
plot(fit2); points(alba$dates[7], alba$midLengths[9], col=2, cex=2, lwd=2)


# 'optimise' method (default)
fit3 <- ELEFAN(
   x = alba, method = "optimise",
   Linf_range = seq(from = 10, to = 20, length.out = 10),
   K_range = exp(seq(from = log(0.1), to = log(2), length.out = 20)),
   contour = TRUE
)
fit3$Rn_max; unlist(fit3$par)
plot(fit3)


### K-Scan (varies K, Linf is fixed) ###

# 'cross' method
fit4 <- ELEFAN(
   x = alba, method = "cross",
   Linf_fix = 10,
   K_range = round(exp(seq(from = log(0.1), to = log(2), length.out = 50)),2),
   cross.date = alba$dates[3], cross.midLength = alba$midLengths[4]
)
fit4$Rn_max; unlist(fit4$par)
plot(fit4); points(alba$dates[3], alba$midLengths[4], col=2, cex=2, lwd=2)

## End(No test)




