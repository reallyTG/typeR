library(plotrix)


### Name: ruginv
### Title: Add an Inverse Rug to a Plot
### Aliases: ruginv
### Keywords: misc

### ** Examples

 require(stats)
 plot(density(faithful$eruptions,bw=0.15))
 ruginv(faithful$eruptions,ticksize=-0.05)
 ruginv(jitter(faithful$eruptions,amount=0.01),side=3,col="lightblue")



