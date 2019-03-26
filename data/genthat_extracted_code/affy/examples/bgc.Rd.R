library(affy)


### Name: bg.correct
### Title: Background Correction
### Aliases: bg.correct bg.correct.none bg.correct.rma bg.correct.mas
### Keywords: manip

### ** Examples

if (require(affydata)) {
  data(Dilution)

  ##bgc will be the bg corrected version of Dilution
  bgc <- bg.correct(Dilution, method="rma") 

  ##This plot shows the tranformation
  plot(pm(Dilution)[,1],pm(bgc)[,1],log="xy",
  main="PMs before and after background correction")
}



