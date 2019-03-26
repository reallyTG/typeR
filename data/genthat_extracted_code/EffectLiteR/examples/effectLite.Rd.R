library(EffectLiteR)


### Name: effectLite
### Title: Estimate average and conditional effects
### Aliases: effectLite

### ** Examples

## Example with one categorical covariate
m1 <- effectLite(y="y", x="x", k="z", control="0", data=nonortho)
print(m1) 

## Example with one categorical and one continuous covariate
m1 <- effectLite(y="dv", x="x", k=c("k1"), z=c("z1"), control="control", data=example01)
print(m1)

## Example with latent outcome and latent covariate
measurement <- '
eta2 =~ 1*CPM12 + 1*CPM22
eta1 =~ 1*CPM11 + 1*CPM21
CPM11 + CPM12 ~ 0*1
CPM21 ~ c(m,m)*1
CPM22 ~ c(p,p)*1'

m1 <- effectLite(y="eta2", x="x", z=c("eta1"), control="0", 
                 measurement=measurement, data=example02lv)
print(m1)

## Not run: 
##D ## Example with cluster variable and sampling weights
##D m1 <- effectLite(y="y", x="x", z="z", fixed.cell=TRUE, control="0", 
##D                     syntax.only=F, data=example_multilevel, 
##D                     ids=~cid, weights=~weights)
##D print(m1)
## End(Not run)



