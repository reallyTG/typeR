library(ellipse)


### Name: pairs.profile
### Title: Profile pairs
### Aliases: pairs.profile
### Keywords: dplot regression nonlinear

### ** Examples

 # Plot everything for the Puromycin data
 data(Puromycin)
 Purboth <- nls(formula = rate ~ ((Vm + delV * (state == "treated"))
   * conc)/(K + conc), data = Puromycin,
   start = list(Vm = 160, delV = 40, K = 0.05))
 Pur.prof <- profile(Purboth)
 ellipse::pairs(Pur.prof, plot.ellipse = TRUE)
 
 # Show the corresponding plot from MASS:
 if (requireNamespace("MASS"))
   graphics::pairs(Pur.prof)



