library(agridat)


### Name: burgueno.alpha
### Title: Incomplete block alpha design
### Aliases: burgueno.alpha
### Keywords: datasets

### ** Examples


data(burgueno.alpha)
dat <- burgueno.alpha

if(require(desplot)){
  desplot(yield~col*row, dat,
          out1=rep, out2=block, # aspect unknown
          text=gen, cex=1,shorten="none",
          main='burgueno.alpha')
}


## Not run: 
##D   require(lme4)
##D   require(lucid)
##D   # Inc block model
##D   m0 <- lmer(yield ~ gen + (1|rep/block), data=dat)
##D   vc(m0) # Matches Burgueno p. 26
##D   ##        grp        var1 var2   vcov sdcor
##D   ##  block:rep (Intercept) <NA>  86900 294.8
##D   ##        rep (Intercept) <NA> 200900 448.2
##D   ##   Residual        <NA> <NA> 133200 365  
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D 
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf, dat$yf),]                 
##D 
##D   # Sequence of models on page 36
##D   
##D   m1 <- asreml(yield ~  gen, data=dat)
##D   m1$loglik # -232.13
##D   
##D   m2 <- asreml(yield ~  gen, data=dat,
##D                random = ~ rep)
##D   m2$loglik # -223.48
##D 
##D   # Inc Block model
##D   m3 <- asreml(yield ~  gen, data=dat,
##D                random = ~ rep/block)
##D   m3$loglik # -221.42
##D   m3$coef$fixed # Matches solution on p. 27
##D 
##D   # AR1xAR1 model
##D   m4 <- asreml(yield ~ 1 + gen, data=dat,
##D                rcov = ~ar1(xf):ar1(yf))
##D   m4$loglik # -221.47
##D   plot(variogram(m4), main="burgueno.alpha") # Figure 1
##D   
##D   m5 <- asreml(yield ~ 1 + gen, data=dat,
##D                random= ~ yf, rcov = ~ar1(xf):ar1(yf))
##D   m5$loglik # -220.07
##D 
##D   m6 <- asreml(yield ~ 1 + gen + pol(yf,-2), data=dat,
##D                rcov = ~ar1(xf):ar1(yf))
##D   m6$loglik # -204.64 vs. 203.69
##D   
##D   m7 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
##D                random= ~ spl(yf), rcov = ~ar1(xf):ar1(yf))
##D   m7$loglik # -212.51
##D   
##D   m8 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
##D                random= ~ spl(yf))
##D   m8$loglik # -213.91
##D 
##D   # Polynomial model with predictions
##D   m9 <- asreml(yield ~ 1 + gen + pol(yf,-2) + pol(xf,-2), data=dat,
##D                random= ~ spl(yf),  rcov = ~ar1(xf):ar1(yf))
##D   m9$loglik # -191.44 vs -189.61
##D   #p9 <- predict(m9, classify="gen:xf:yf", levels=list(xf=1,yf=1)) 
##D   #p9$predictions
##D   
##D   m10 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D                 rcov = ~ar1(xf):ar1(yf))
##D   m10$loglik # -211.56
##D   
##D   m11 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D                 random= ~ spl(yf), rcov = ~ar1(xf):ar1(yf))
##D   m11$loglik # -208.90
##D   
##D   m12 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D                 random= ~ spl(yf)+spl(xf), rcov = ~ar1(xf):ar1(yf))
##D   m12$loglik # -206.82
##D   
##D   m13 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D                 random= ~ spl(yf)+spl(xf))
##D   m13$loglik # -207.52
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D 
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## dat <- dat[order(dat$xf, dat$yf),]                 
##D 
##D   ## # Sequence of models on page 36
##D   
##D   ## m1 <- asreml(yield ~  gen, data=dat)
##D   ## m1$loglik # -232.13
##D   
##D   ## m2 <- asreml(yield ~  gen, data=dat,
##D   ##              random = ~ rep)
##D   ## m2$loglik # -223.48
##D 
##D   ## # Inc Block model
##D   ## m3 <- asreml(yield ~  gen, data=dat,
##D   ##              random = ~ rep/block)
##D   ## m3$loglik # -221.42
##D   ## m3$coef$fixed # Matches solution on p. 27
##D 
##D   ## # AR1xAR1 model
##D   ## m4 <- asreml(yield ~ 1 + gen, data=dat,
##D   ##              resid = ~ar1(xf):ar1(yf))
##D   ## m4$loglik # -221.47
##D   ## plot(varioGram(m4), main="burgueno.alpha") # Figure 1
##D   
##D   ## m5 <- asreml(yield ~ 1 + gen, data=dat,
##D   ##              random= ~ yf, resid = ~ar1(xf):ar1(yf))
##D   ## m5$loglik # -220.07
##D 
##D   ## m6 <- asreml(yield ~ 1 + gen + pol(yf,-2), data=dat,
##D   ##              resid = ~ar1(xf):ar1(yf))
##D   ## m6$loglik # -204.64 vs. 203.69
##D   
##D   ## m7 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
##D   ##              random= ~ spl(yf), resid = ~ar1(xf):ar1(yf))
##D   ## m7$loglik # -212.51
##D   
##D   ## m8 <- asreml(yield ~ 1 + gen + lin(yf), data=dat,
##D   ##              random= ~ spl(yf))
##D   ## m8$loglik # -213.91
##D 
##D   ## # Polynomial model with predictions
##D   ## m9 <- asreml(yield ~ 1 + gen + pol(yf,-2) + pol(xf,-2), data=dat,
##D   ##              random= ~ spl(yf),
##D   ##              resid = ~ar1(xf):ar1(yf))
##D   ## m9 <- update(m9)
##D   ## m9$loglik # -191.44 vs -189.61
##D   ## p9 <- predict(m9, classify="gen:xf:yf", levels=list(xf=1,yf=1)) 
##D   ## p9
##D   
##D   ## m10 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D   ##               resid = ~ar1(xf):ar1(yf))
##D   ## m10$loglik # -211.56
##D   
##D   ## m11 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D   ##               random= ~ spl(yf),
##D   ##               resid = ~ar1(xf):ar1(yf))
##D   ## m11$loglik # -208.90
##D   
##D   ## m12 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D   ##               random= ~ spl(yf)+spl(xf),
##D   ##               resid = ~ar1(xf):ar1(yf))
##D   ## m12$loglik # -206.82
##D   
##D   ## m13 <- asreml(yield ~ 1 + gen + lin(yf)+lin(xf), data=dat,
##D   ##               random= ~ spl(yf)+spl(xf))
##D   ## m13$loglik # -207.52
##D 
## End(Not run)




