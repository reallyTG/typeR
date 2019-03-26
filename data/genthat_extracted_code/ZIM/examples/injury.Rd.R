library(ZIM)


### Name: injury
### Title: Example: Injury Series from Occupational Health
### Aliases: injury
### Keywords: datasets

### ** Examples

data(injury)
plot(injury, type = "o", pch = 20, xaxt = "n", yaxt = "n", ylab = "Injury Count")
  axis(side = 1, at = seq(1, 96, 8))
  axis(side = 2, at = 0:9)
  abline(v = 57, lty = 2)
  mtext("Pre-intervention",  line = 1, at = 25, cex = 1.5)
  mtext("Post-intervention", line = 1, at = 80, cex = 1.5)



