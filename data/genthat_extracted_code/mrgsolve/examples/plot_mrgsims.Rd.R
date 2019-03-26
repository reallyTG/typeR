library(mrgsolve)


### Name: plot_mrgsims
### Title: Generate a quick plot of simulated data
### Aliases: plot_mrgsims plot,mrgsims,missing-method
###   plot,mrgsims,formula-method

### ** Examples


mod <- mrgsolve:::house(end=48, delta=0.2) %>% init(GUT=1000)

out <- mrgsim(mod)

plot(out)

plot(out, subset=time <=24)

plot(out, GUT+CP~.)

plot(out, CP+RESP~time, col="black", scales="same", lty=2)




