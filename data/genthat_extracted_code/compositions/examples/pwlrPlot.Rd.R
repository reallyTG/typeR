library(compositions)


### Name: pwlrPlot
### Title: Plots of pairwise logratio against a covariable.
### Aliases: pwlrPlot pwlrplot
### Keywords: hplot

### ** Examples


data(Hydrochem)
xc = acomp(Hydrochem[,c("Ca","Mg","Na","K")])
fk = Hydrochem$River
pH = -log10(Hydrochem$H)
## x=acomp, y=factor 
pwlrPlot(xc, fk, border=2:5)
## x=factor, y=acomp
pwlrPlot(fk,xc, col=2:5)
## x=acomp, y=numeric, with colors by river
pwlrPlot(xc, pH, col=as.integer(fk)+1)
## x=numeric, y=acomp, with line
pwlrPlot(pH, xc, add.robust=TRUE)




