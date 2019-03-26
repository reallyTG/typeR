library(robust)


### Name: summary.covfm
### Title: Summary Method
### Aliases: summary.covClassic summary.covRob summary.covfm
### Keywords: methods

### ** Examples

  data(woodmod.dat)
  woodm.cov <- covClassic(woodmod.dat)
  summary(woodm.cov)

  woodm.covRob <- covRob(woodmod.dat)
  summary(woodm.covRob)

  woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                         data = woodmod.dat)
  summary(woodm.fm)



