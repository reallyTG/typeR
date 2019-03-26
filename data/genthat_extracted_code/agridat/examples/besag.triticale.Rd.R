library(agridat)


### Name: besag.triticale
### Title: Four-way factorial agronomic experiment in triticale
### Aliases: besag.triticale
### Keywords: datasets

### ** Examples


data(besag.triticale)
dat <- besag.triticale

if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          # aspect unknown
          main="besag.triticale")
}

## Not run: 
##D   # Besag & Kempton are not perfectly clear on the model, but
##D   # indicate that there was no evidence of any two-way interactions.
##D   # A reduced, main-effect model had genotype effects that were
##D   # "close to significant" at the five percent level.
##D   # The model below has p-value of gen at .04, so must be slightly
##D   # different than their model.
##D   dat <- transform(dat, rate=factor(rate), nitro=factor(nitro))
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   m2 <- lm(yield ~ gen + rate + nitro + regulator + yf, data=dat)
##D   anova(m2)
##D   
##D   # Similar, but not exact, to Besag figure 5
##D   dat$res <- resid(m2)
##D   require(lattice)
##D   xyplot(res ~ col|as.character(row), data=dat,
##D          as.table=TRUE, type="s", layout=c(1,3),
##D          main="besag.triticale")
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D 
##D   # Besag uses an adjustment based on neighboring plots.
##D   # This analysis fits the standard AR1xAR1 residual model
##D 
##D   dat <- dat[order(dat$xf, dat$yf), ]
##D   m3 <- asreml(yield ~ gen + rate + nitro + regulator +
##D                  gen:rate + gen:nitro + gen:regulator +
##D                  rate:nitro + rate:regulator +
##D                  nitro:regulator + yf, data=dat,
##D                rcov = ~ ar1(xf):ar1(yf))
##D   anova(m3) # Strongly significant gen, rate, regulator
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D 
##D   ## # Besag uses an adjustment based on neighboring plots.
##D   ## # This analysis fits the standard AR1xAR1 residual model
##D 
##D   ## dat <- dat[order(dat$xf, dat$yf), ]
##D   ## m3 <- asreml(yield ~ gen + rate + nitro + regulator +
##D   ##                gen:rate + gen:nitro + gen:regulator +
##D   ##                rate:nitro + rate:regulator +
##D   ##                nitro:regulator + yf, data=dat,
##D   ##              resid = ~ ar1(xf):ar1(yf))
##D   ## wald(m3) # Strongly significant gen, rate, regulator
##D   ## ##                 Df Sum of Sq Wald statistic Pr(Chisq)    
##D   ## ## (Intercept)      1   1288255        103.971 < 2.2e-16 ***
##D   ## ## gen              2    903262         72.899 < 2.2e-16 ***
##D   ## ## rate             1    104774          8.456  0.003638 ** 
##D   ## ## nitro            1       282          0.023  0.880139    
##D   ## ## regulator        2    231403         18.676 8.802e-05 ***
##D   ## ## yf               2      3788          0.306  0.858263    
##D   ## ## gen:rate         2      1364          0.110  0.946461    
##D   ## ## gen:nitro        2     30822          2.488  0.288289    
##D   ## ## gen:regulator    4     37269          3.008  0.556507    
##D   ## ## rate:nitro       1      1488          0.120  0.728954    
##D   ## ## rate:regulator   2     49296          3.979  0.136795    
##D   ## ## nitro:regulator  2     41019          3.311  0.191042    
##D   ## ## residual (MS)          12391                             
##D 
## End(Not run)




