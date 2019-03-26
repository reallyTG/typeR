library(demoKde)


### Name: kde
### Title: Univariate kernel density estimation directly in R code.
### Aliases: kde
### Keywords: distribution dplot

### ** Examples

if(require("graphics")) {
  with(MASS::geyser, {
      hist(waiting, freq=FALSE, main="", border="grey", las=1)
      lines(stats::density(waiting), col="skyblue", lwd=8)
      lines(kde(waiting))
      lines(kde(waiting, kernel = kernelUniform), col="red")
      rug(jitter(waiting), col="blue")
      legend("topleft", c("density histogram",
        "KDE gaussian (denstiy)", "KDE gaussian (kde)",
        "KDE rectangular (kde)"), lty = "solid", lwd=c(1,8,1,1),
        col=c("grey", "skyblue", "black", "red"), bty="n")
  })
}



