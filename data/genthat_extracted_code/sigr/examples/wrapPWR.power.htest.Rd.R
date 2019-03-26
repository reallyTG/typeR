library(sigr)


### Name: wrapPWR.power.htest
### Title: Wrap pwr test.
### Aliases: wrapPWR.power.htest

### ** Examples


if(require("pwr", quietly = TRUE)) {
  # Example from pwr package
  #  Exercise 6.1 p. 198 from Cohen (1988)
  test <- pwr::pwr.2p.test(h=0.3,n=80,sig.level=0.05,alternative="greater")
  wrapPWR(test)
}




