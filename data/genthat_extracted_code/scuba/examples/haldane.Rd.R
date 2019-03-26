library(scuba)


### Name: haldane
### Title: Tissue Saturation by Haldane Model
### Aliases: haldane
### Keywords: utilities

### ** Examples

  # First dive to 25 m for 20 min with safety stop
  d1 <- dive(c(25,20),c(5,5))
  # Evaluate saturation according to DSAT model
  s1 <- haldane(d1)
  s1
  # Look at saturation (in ata)
  barplot(s1$N2, ylab="Saturation (ata)")
  # Look at relative saturation
  M0 <- param(pickmodel("D"), "N2", "M0")
  barplot(100 * s1$N2/M0, ylab="Saturation (percent)")

  # Evaluate saturation after 2 hour surface interval
  s2 <- haldane(dive(c(0,120)), prevstate=s1)
  # Then after another dive to 18 m for 30 min with safety stop
  s3 <- haldane(dive(c(18, 30),c(5,3)), prevstate=s2)
  # Assess effect of breathing 80% oxygen at safety stop
  s3o <- haldane(dive(c(18, 30),5, nitrox(0.8), c(5,3)), prevstate=s2)

  # Inspect saturation during dive d1 at time 10 minutes
  s10 <- haldane(chop.dive(d1, 0, 10))

  # Progressive saturation during dive
  # A real dive
  plot(deepmine, col=1, key.gases="none")
  # compute saturations during dive
  hmine <- haldane(deepmine, model="Z", progressive=TRUE)
  # show N2 saturations during dive
  # Image plot
  image(x=times.dive(deepmine), y=1:17, z=hmine[,,"N2"],
      xlab="Time (min)", ylab="Compartment", axes=FALSE)
  axis(1)
  axis(2, at=1:17, labels=dimnames(hmine)[[2]])
  # Perspective plot
  persp(x=times.dive(deepmine), y=1:17, z=hmine[,,"N2"],
      xlab="Time (min)", ylab="Compartment", zlab="Saturation (atm)",
      col="green3", shade=0.6, border=NA,
      theta=20, phi=30, ltheta=120, lphi=20)
       
  #....  Derived quantities .....
  hmine <- haldane(deepmine, model="Z", progressive=TRUE, derived=TRUE)
  der <- attr(hmine, "derived")
  names(der)

  # Decompression ceiling depth (time x compartment x gas)
  dcd <- der$Dceiling
  # Overall decompression ceiling at each time point
  dc <- apply(dcd, 1, max)

  # plot dive with deco ceiling
  plot(deepmine, key.gases="none", col=1)
  lines(times.dive(deepmine), -dc, lty=3, lwd=2)
  legend(100, -60, lty=c(1,3), lwd=2,
      legend=c("dive profile", "deco ceiling"))

  # Nitrogen washout for tissue 1b (positive values indicate off-gassing)
  plot(times.dive(deepmine), der$washout[,"1b", "N2"],
        type="l", xlab="Time (min)", ylab="Washout")



