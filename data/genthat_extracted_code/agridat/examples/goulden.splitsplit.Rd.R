library(agridat)


### Name: goulden.splitsplit
### Title: Split-split plot experiment of wheat
### Aliases: goulden.splitsplit
### Keywords: datasets

### ** Examples


data(goulden.splitsplit)
dat <- goulden.splitsplit

if(require(desplot)) {

  ## Experiment design. Goulden p. 152-153
  ## desplot(gen ~ col*row, data=dat,
  ##         out1=block, out2=trt, text=dust, col=inoc, cex=1,
  ##         main="goulden.splitsplit")
  
  desplot(yield ~ col*row, data=dat,
          out1=block, out2=gen, col=inoc, num=trt, cex=1,
          main="goulden.splitsplit")

}

# Match Goulden table 40
m1 <- aov(yield ~ gen
          + dust + dry + dust:dry + gen:dust + gen:dry + gen:dust:dry
          + inoc + inoc:gen + inoc:dust + inoc:dry
          + inoc:dust:dry +inoc:gen:dust + inoc:gen:dry
          + Error(block/(gen+gen:dust:dry+gen:inoc:dry)), data=dat)
summary(m1)




