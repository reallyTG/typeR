library(spsurvey)


### Name: write.object
### Title: Write an Object to a Plot
### Aliases: write.object
### Keywords: aplot

### ** Examples

z <- rnorm(100)
z.mean <- c(tapply(z, rep(1:4, rep(25,4)), mean), mean(z))
z.sd <- sqrt(c(tapply(z, rep(1:4, rep(25,4)), var), var(z)))
z.upper <- z.mean+1.96*z.sd
z.lower <- z.mean-1.96*z.sd
obj <- data.frame(rbind(z.mean, z.sd, z.upper, z.lower))
dimnames(obj) <- list(c("Mean Estimate", "Standard Deviation",
  "Lower 95% Conf. Bound", "Upper 95% Conf. Bound"), c(
  paste("Stratum", 1:4, sep=""), "AllStrata"))
write.object(obj, n.digits=3, r.cex=0.75)

obj <- data.frame(matrix(round(5 + runif(30), 1), nrow=6))
colnames(obj) <- c("United.States", "Russia", "Germany",
  "Japan", "France")
write.object(obj, n.digits=1, r.names=FALSE)



