library(HH)


### Name: panel.pairs.hh
### Title: Function based on S-Plus panel.pairs to add the subpanel.scales
###   and panel.cex arguments.
### Aliases: panel.pairs.hh
### Keywords: dplot

### ** Examples

if.R(s={
     longley <- data.frame(longley.x, Employed = longley.y)
     },r={
     data(longley)
     })

if.R(s=
     splom( ~ longley, pch=16, cex=.55,
           superpanel=panel.pairs.hh, subpanel.scales=list(cex=.8),
           pscales=2,
           panel.cex=.8)
     ,r=
     splom( ~ longley, pch=16,
           pscales=2,
           varname.cex=.8,
           axis.text.cex=.5)
   )



