library(agridat)


### Name: besag.endive
### Title: Presence of footroot disease in an endive field
### Aliases: besag.endive
### Keywords: datasets

### ** Examples


data(besag.endive)
dat <- besag.endive

# Incidence map.  Figure 2 of Friel and Pettitt
if(require(desplot)){
  grays <- colorRampPalette(c("#d9d9d9","#252525"))
  desplot(disease~col*row, dat,
          col.regions=grays(2),
          aspect = 0.5, # aspect unknown
          main="besag.endive - Disease incidence")
}

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Besag (2000) "An Introduction to Markov Chain Monte Carlo" suggested
##D   # that the autologistic model is not a very good fit for this data.
##D   # We try it anyway.  No idea if this is correct or how to interpret...
##D 
##D   require(ngspatial)
##D   A = adjacency.matrix(179,14)
##D   X = cbind(x=dat$col, y=dat$row)
##D   Z = as.numeric(dat$disease=="Y")
##D   m1 <- autologistic(Z ~ 0+X, A=A, control=list(confint="none"))
##D 
##D   summary(m1)
##D   ## Coefficients:
##D   ##      Estimate Lower Upper MCSE
##D   ## Xx  -0.007824    NA    NA   NA
##D   ## Xy  -0.144800    NA    NA   NA
##D   ## eta  0.806200    NA    NA   NA
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   # Now try an AR1xAR1 model.
##D   dat2 <- transform(dat, xf=factor(col), yf=factor(row),
##D                     pres=as.numeric(disease=="Y"))
##D 
##D   m2 <- asreml(pres ~ 1, data=dat2, rcov= ~ar1(xf):ar1(yf))
##D   # The 0/1 response is arbitrary, but there is some suggestion
##D   # of auto-correlation in the x (.17) and y (.10) directions,
##D   # suggesting the pattern is more 'patchy' than just random noise,
##D   # but is it meaningful?
##D   
##D   require(lucid)
##D   vc(m2)
##D   ##     effect component std.error z.ratio constr
##D   ## R!variance   0.1301   0.003798    34      pos
##D   ##   R!xf.cor   0.1699   0.01942      8.7  uncon
##D   ##   R!yf.cor   0.09842  0.02038      4.8  uncon
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   
##D   ## # Now try an AR1xAR1 model.
##D   ## dat2 <- transform(dat, xf=factor(col), yf=factor(row),
##D   ##                   pres=as.numeric(disease=="Y"))
##D 
##D   ## m2 <- asreml(pres ~ 1, data=dat2,
##D   ##              resid = ~ar1(xf):ar1(yf))
##D   ## # The 0/1 response is arbitrary, but there is some suggestion
##D   ## # of auto-correlation in the x (.17) and y (.10) directions,
##D   ## # suggesting the pattern is more 'patchy' than just random noise,
##D   ## # but is it meaningful?
##D   
##D   ## require(lucid)
##D   ## vc(m2)
##D   ## ##       effect component std.error z.ratio bound ##D 
##D   ## ##     xf:yf(R)   0.1301   0.003798    34       P   0
##D   ## ## xf:yf!xf!cor   0.1699   0.01942      8.7     U   0
##D   ## ## xf:yf!yf!cor   0.09842  0.02038      4.8     U   0
##D 
## End(Not run)




