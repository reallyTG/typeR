library(robust)


### Name: plot.covfm
### Title: Plot Method
### Aliases: plot.covfm plot.covRob plot.covClassic
### Keywords: methods hplot

### ** Examples

data(woodmod.dat)

woodm.cov <- covClassic(woodmod.dat)
woodm.covRob <- covRob(woodmod.dat)

plot(woodm.cov)
plot(woodm.covRob)

woodm.fm <- fit.models(list(Robust = "covRob", Classical = "covClassic"),
                       data = woodmod.dat)
plot(woodm.fm)



