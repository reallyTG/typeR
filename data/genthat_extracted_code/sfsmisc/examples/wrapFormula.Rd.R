library(sfsmisc)


### Name: wrapFormula
### Title: Enhance Formula by Wrapping each Term, e.g., by "s(.)"
### Aliases: wrapFormula
### Keywords: models

### ** Examples

myF <- wrapFormula(Fertility ~ . , data = swiss)
myF # Fertility ~ s(Agriculture) + s(....) + ...

if(require("mgcv")) {
   m1 <- gam(myF, data = swiss)
   print( summary(m1) )
   plot(m1, pages = 1) ; title(format(m1$call), line= 2.5)
}

## other wrappers:
wrapFormula(Fertility ~ . , data = swiss, wrap = "lo(*)")
wrapFormula(Fertility ~ . , data = swiss, wrap = "poly(*, 4)")



