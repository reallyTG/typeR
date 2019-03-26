library(idmTPreg)


### Name: plot.TPreg
### Title: Plotting a TPreg object
### Aliases: plot.TPreg

### ** Examples

data(colonTPreg)

co13 <- TPreg( ~ Age + Nodes + treatment, colonTPreg, link = "logit", s = 0, R = 9, t = 1200,
  by = 110, trans = "13", ncores = 1)
plot(co13, covar = "Nodes", Ylim = list(c(-0.5,0.5)))

 ## No test: 
co11 <- TPreg( ~ Age + Nodes + treatment, colonTPreg, link = "logit", s = 0, by = 10,
  R = 199, t = 365*5, trans = "11")
plot(co11, covar = c("Age", "Nodes", "treatmentLev", "treatmentLev.5FU"),
Ylim = list(c(-0.1,0.1), c(-0.5,0.5), c(-2,2), c(-2,2)))
## End(No test)




