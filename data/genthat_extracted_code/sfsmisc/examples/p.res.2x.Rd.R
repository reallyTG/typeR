library(sfsmisc)


### Name: p.res.2x
### Title: Stahel's Residual Plot against 2 X's
### Aliases: p.res.2x p.res.2x.default p.res.2x.formula
### Keywords: hplot regression

### ** Examples

xx <- rep(1:10,7)
yy <- rep(1:7, rep(10,7))
zz <- rnorm(70)
p.res.2x(xx,yy,zz, restricted = 2, main = "i.i.d.  N(0,1) random residuals")
## Don't show: 
 p.res.2x(xx,yy,zz, restricted = 2, main = "p.res.2x(*, xlim, ylim)",
          xlim = c(2,8), ylim = c(1,4))
## End(Don't show)
example(lm.influence, echo = FALSE)

op <- mult.fig(2, marP=c(-1,-1,-1,0), main="p.res.2x(*,*, residuals(lm.SR))")$old.par
with(LifeCycleSavings,
     { p.res.2x(pop15, ddpi, residuals(lm.SR), scol=c("red", "blue"))
       p.res.2x(pop75, dpi,  residuals(lm.SR), scol=2:1)
     })

## with formula interface:
p.res.2x(~ pop15 + ddpi, lm.SR, scol=c("red", "blue"))
p.res.2x(~ pop75 +  dpi, lm.SR, scol=2:1)

par(op) # revert par() settings above



