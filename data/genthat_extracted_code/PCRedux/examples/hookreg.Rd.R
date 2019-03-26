library(PCRedux)


### Name: hookreg
### Title: A function to calculate the slope and intercept of an
###   amplification curve data from a quantitative PCR experiment at the
###   end of the data stream.
### Aliases: hookreg
### Keywords: hook intercept slope

### ** Examples


# Calculate slope and intercept on noise (negative) amplification curve data
# for the last eight cycles.

library(qpcR)
library(magrittr)

 res_hook <- sapply(2:ncol(boggy), function(i) {
     hookreg(x=boggy[, 1], y=boggy[, i])}) %>% t %>%
     data.frame(sample=colnames(boggy)[-1],.)
res_hook

data_colors <- rainbow(ncol(boggy[, -1]), alpha=0.5)
cl <- kmeans(na.omit(res_hook[, 2:3]), 2)$cluster

par(mfrow=c(1,2))
matplot(x=boggy[, 1], y=boggy[, -1], xlab="Cycle", ylab="RFU",
 main="boggy Data Set", type="l", lty=1, lwd=2, col=data_colors)
 legend("topleft", as.character(res_hook$sample), pch=19,
         col=data_colors, bty="n")

plot(res_hook$intercept, res_hook$slope, pch=19, cex=2, col=data_colors,
 xlab="intercept", ylab="Slope",
 main="Clusters of Amplification Curves with an Hook Effect-like Curvature\nboggy Data Set")
 points(res_hook$intercept, res_hook$slope, col=cl, pch=cl, cex=cl)
 legend("topright", c("Strong Hook effect", " Weak Hook effect"), pch=c(1,2), col=c(1,2), bty="n")
 text(res_hook$intercept, res_hook$slope, res_hook$sample)




