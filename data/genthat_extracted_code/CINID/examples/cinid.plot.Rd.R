library(CINID)


### Name: cinid.plot
### Title: Print the observed distribution and the estimated one
### Aliases: cinid.plot
### Keywords: print

### ** Examples

data(s.oryzae)
soryzae <- s.oryzae$data
mu4.soryzae <- s.oryzae$mu4
sd4.soryzae <- s.oryzae$sd4

HCW.soryzae <- cinid.table(soryzae, mu4 = mu4.soryzae, sd4 = sd4.soryzae)
HCW.soryzae.plot <- cinid.plot(HCW.soryzae, breaks = 50)



