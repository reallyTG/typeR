library(demoKde)


### Name: demoKde-package
### Title: Kernel density estimation demonstration and exploration
### Aliases: demoKde-package demoKde
### Keywords: package

### ** Examples

if(require("graphics")) {
  with(MASS::Boston, {
      Criminality <- log(crim)
      hist(Criminality, freq=FALSE, main="", border="grey", las=1)
      lines(stats::density(Criminality), col="skyblue", lwd=8)
      lines(kde(Criminality))
      lines(kde(Criminality, kernel = kernelUniform), col="red")
      rug(jitter(Criminality), col="blue")
      legend("topright", c("density histogram",
        "KDE gaussian (denstiy)", "KDE gaussian (kde)",
        "KDE rectangular (kde)"), lty = "solid", lwd=c(1,8,1,1),
        col=c("grey", "skyblue", "black", "red"), bty="n")
  })
}



