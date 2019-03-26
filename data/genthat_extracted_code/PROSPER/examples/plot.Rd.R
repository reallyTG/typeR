library(PROSPER)


### Name: plot
### Title: Simple plot for prosper simulation results
### Aliases: plot plot,prosper,missing-method

### ** Examples

data(param.LOLRI)
mod_lolri    <- prosper.LOLRI(param.weed=param.LOLRI, area=50, 
                                       duration=3, repetitions=2)
plot(mod_lolri)



