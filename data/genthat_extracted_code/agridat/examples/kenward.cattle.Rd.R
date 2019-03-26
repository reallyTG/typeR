library(agridat)


### Name: kenward.cattle
### Title: Repeated measurement of weights of calves with two treatments.
### Aliases: kenward.cattle
### Keywords: datasets

### ** Examples


data(kenward.cattle)
dat <- kenward.cattle

# Profile plots
require(lattice)
foo1 <- xyplot(weight~day|trt, data=dat, type='l', group=animal,
               xlab="Day", ylab="Animal weight", main="kenward.cattle")
print(foo1)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # lme4. Fixed treatment intercepts, treatment polynomial trend.
##D   # Random deviation for each animal
##D   require(lme4)
##D   m1a <-lmer(weight ~ trt*poly(day, 4) + (1|animal), data=dat,
##D              REML = FALSE)
##D   # Change separate polynomials into common polynomial
##D   m1b <-lmer(weight ~ trt + poly(day, 4) + (1|animal), data=dat,
##D              REML = FALSE)
##D   # Drop treatment differences
##D   m1c <-lmer(weight ~ poly(day, 4) + (1|animal), data=dat,
##D              REML = FALSE)
##D   anova(m1a, m1b, m1c) # Significant differences between trt polynomials
##D 
##D   # Overlay polynomial predictions on plot
##D   require(latticeExtra)
##D   dat$pred <- predict(m1a, re.form=NA)
##D   foo1 + xyplot(pred ~ day|trt, data=dat,
##D                 lwd=2, col="black", type='l')
##D 
##D   # A Kenward-Roger Approximation and Parametric Bootstrap
##D   library(pbkrtest)
##D   KRmodcomp(m1b, m1c) # Non-signif
##D   # Model comparison of nested models using parametric bootstrap methods
##D   # PBmodcomp(m1b, m1c, nsim=500)
##D   ## Parametric bootstrap test; time: 13.20 sec; samples: 500 extremes: 326;
##D   ## large : weight ~ trt + poly(day, 4) + (1 | animal)
##D   ## small : weight ~ poly(day, 4) + (1 | animal)
##D   ##          stat df p.value
##D   ## LRT    0.2047  1  0.6509
##D   ## PBtest 0.2047     0.6527
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # ASREML approach to model. Not final by any means.
##D   # Maybe a spline curve for each treatment, plus random deviations for each time
##D   # asreml3
##D   require(asreml)
##D   m1 <- asreml(weight ~  1 + lin(day) +    # overall line
##D                  trt + trt:lin(day),       # different line for each treatment
##D                data=dat,
##D                random = ~ spl(day) +       # overall spline
##D                  trt:spl(day) +            # different spline for each treatment
##D                  dev(day) + trt:dev(day) ) # non-spline deviation at each time*trt
##D   
##D   p1 <- predict(m1, data=dat, classify="trt:day")
##D   p1 <- p1$predictions$pvals
##D   foo2 <- xyplot(predicted.value ~ day|trt, p1, type='l', lwd=2, lty=1, col="black")
##D   
##D   require(latticeExtra)
##D   print(foo1 + foo2)
##D 
##D   # Not much evidence for treatment differences
##D   
##D   anova(m1)
##D   ##               Df Sum of Sq Wald statistic Pr(Chisq)    
##D   ## (Intercept)    1  37128459         139060    <2e-16 ***
##D   ## trt            1       455              2    0.1917    
##D   ## lin(day)       1    570798           2138    <2e-16 ***
##D   ## trt:lin(day)   1       283              1    0.3031    
##D   ## residual (MS)          267                             
##D   
##D   require(lucid)
##D   vc(m1)
##D   ##               effect component std.error z.ratio constr
##D   ##             spl(day)  25.29    24.09        1       pos
##D   ##             dev(day)   1.902    4.923       0.39    pos
##D   ## trt:spl(day)!trt.var   0.00003  0.000002   18      bnd 
##D   ## trt:dev(day)!trt.var   0.00003  0.000002   18      bnd 
##D   ##           R!variance 267       14.84       18       pos
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # ASREML approach to model. Not final by any means.
##D   # Maybe a spline curve for each treatment, plus random deviations for each time
##D   ## require(asreml4)
##D   ## m1 <- asreml(weight ~  1 + lin(day) +    # overall line
##D   ##                trt + trt:lin(day),       # different line for each treatment
##D   ##              data=dat,
##D   ##              random = ~ spl(day) +       # overall spline
##D   ##                trt:spl(day) +            # different spline for each treatment
##D   ##                dev(day) + trt:dev(day) ) # non-spline deviation at each time*trt
##D   
##D   ## p1 <- predict(m1, data=dat, classify="trt:day",
##D   ##               design.points=list(day=0:133))
##D   ## p1 <- p1$pvals
##D   ## foo2 <- xyplot(predicted.value ~ day|trt, p1, type='l', lwd=2, lty=1, col="black")
##D   
##D   ## require(latticeExtra)
##D   ## print(foo1 + foo2)
##D 
##D   ## # Not much evidence for treatment differences
##D   
##D   ## wald(m1)
##D   ## ##               Df Sum of Sq Wald statistic Pr(Chisq)    
##D   ## ## (Intercept)    1  37128459         139060    <2e-16 ***
##D   ## ## trt            1       455              2    0.1917    
##D   ## ## lin(day)       1    570798           2138    <2e-16 ***
##D   ## ## trt:lin(day)   1       283              1    0.3031    
##D   ## ## residual (MS)          267                             
##D   
##D   ## require(lucid)
##D   ## vc(m1)
##D   ## ##               effect component std.error z.ratio constr
##D   ## ##             spl(day)  25.29    24.09        1       pos
##D   ## ##             dev(day)   1.902    4.923       0.39    pos
##D   ## ## trt:spl(day)!trt.var   0.00003  0.000002   18      bnd 
##D   ## ## trt:dev(day)!trt.var   0.00003  0.000002   18      bnd 
##D   ## ##           R!variance 267       14.84       18       pos
##D 
## End(Not run)

# ----------------------------------------------------------------------------




