library(agridat)


### Name: harris.wateruse
### Title: Water use by horticultural trees
### Aliases: harris.wateruse
### Keywords: datasets

### ** Examples


data(harris.wateruse)
dat <- harris.wateruse

# Compare to Schabenberger & Pierce, fig 7.23
if(require(latticeExtra)){
  useOuterStrips(xyplot(water ~ day|species*age,dat, as.table=TRUE,
                        group=tree, type=c('p','smooth'),
                        main="harris.wateruse 2 species, 2 ages (10 trees each)"))
}

# Note that measurements on day 268 are all below the trend line and
# thus considered outliers.  Delete them.
dat <- subset(dat, day!=268)


# Schabenberger figure 7.24
xyplot(water ~ day|tree,dat, subset=age=="A2" & species=="S2",
       as.table=TRUE, type=c('p','smooth'),
       ylab="Water use profiles of individual trees",
       main="harris.wateruse (Age 2, Species 2)")

# Rescale day for nicer output, and convergence issues, add quadratic term
dat <- transform(dat, ti=day/100)
dat <- transform(dat, ti2=ti*ti)


# Start with a subgroup: age 2, species 2
d22 <- droplevels(subset(dat, age=="A2" & species=="S2"))

# ----- Model 1, for subgroup A2,S2

# First, a fixed quadratic that is common to all trees, plus
# a random quadratic deviation for each tree.

## Schabenberger, Output 7.26
## proc mixed;
##   class tree;
##   model water = ti ti*ti / s;
##   random intercept ti ti*ti/subject=tree;

require(nlme)
## We use pdDiag() to get uncorrelated random effects
m1n <- lme(water ~ 1 + ti + ti2, data=d22, na.action=na.omit,
           random = list(tree=pdDiag(~1+ti+ti2)))

## Not run: 
##D   
##D   # Various other models with lme4 & asreml
##D   
##D require(lucid)
##D vc(m1n)
##D ##       effect variance    stddev
##D ##  (Intercept)   0.2691 0.5188
##D ##           ti   0      0.0000144
##D ##          ti2   0      0.0000039
##D ##     Residual   0.1472 0.3837
##D 
##D require(lme4)
##D m1l <- lmer(water ~ 1 + ti + ti2 + (1|tree) +
##D             (0+ti|tree) + (0+ti2|tree), data=d22)
##D 
##D vc(m1l)
##D ##      grp        var1 var2   vcov  sdcor
##D ##     tree (Intercept) <NA> 0.2691 0.5188
##D ##   tree.1          ti <NA> 0      0
##D ##   tree.2         ti2 <NA> 0      0
##D ## Residual        <NA> <NA> 0.1472 0.3837
##D 
##D 
##D # Once the overall quadratic trend has been removed, there is not
##D # too much evidence for consecutive observations being correlated
##D d22r <- subset(d22, !is.na(water))
##D d22r$res <- resid(m1n)
##D xyplot(res ~ day|tree,d22r,
##D        as.table=TRUE, type=c('p','smooth'),
##D        ylab="residual",
##D        main="harris.wateruse - Residuals of individual trees")
##D op <- par(mfrow=c(4,3))
##D tapply(d22r$res, d22r$tree, acf)
##D par(op)
##D 
##D # ----- Model 2, add correlation of consecutive measurements
##D 
##D ## Schabenberger (page 516) adds correlation.
##D ## Note how the fixed quadratic model is on the "ti = day/100" scale
##D ## and the correlated observations are on the "day" scale.  The
##D ## only impact this has on the fitted model is to increase the
##D ## correlation parameter by a factor of 100, which was likely
##D ## done to get better convergence.
##D 
##D ## proc mixed data=age2sp2;
##D ##   class tree;
##D ##   model water = ti ti*ti / s ;
##D ##   random intercept /subject=tree s;
##D ##   repeated /subject=tree type=sp(exp)(day);
##D 
##D ## Same as SAS, use ti for quadratic, day for correlation
##D m2l <- lme(water ~ 1 + ti + ti2, data=d22,
##D           random = ~ 1|tree,
##D           cor = corExp(form=~ day|tree),
##D           na.action=na.omit)
##D m2l # Match output 7.27.  Same fixef, ranef, variances, exp corr
##D 
##D vc(m2l)
##D ##       effect variance stddev
##D ##  (Intercept)   0.2656 0.5154
##D ##     Residual   0.1541 0.3926
##D 
##D # ---
##D 
##D ## Now use asreml.  When I tried rcov=~tree:exp(ti),
##D ## the estimated parameter value was on the 'boundary', i.e. 0.
##D ## Changing rcov to the 'day' scale produced a sensible estimate
##D ## that matched SAS.
##D ## Note: SAS and asreml use different parameterizations for the correlation
##D ## SAS uses exp(-d/phi) and asreml uses phi^d.
##D ## SAS reports 3.79, asreml reports 0.77, and exp(-1/3.7945) = 0.7683274
##D ## Note: normally a quadratic would be included as 'pol(day,2)'
##D 
##D require(asreml)
##D d22 <- d22[order(d22$tree, d22$day),]
##D m2a <- asreml(water ~ 1 + ti + ti2,
##D               data=d22,
##D               random = ~ tree,
##D               rcov=~tree:exp(day))
##D 
##D vc(m2a)
##D ##         effect component std.error z.ratio constr
##D ##  tree!tree.var    0.2656   0.1301      2      pos
##D ##     R!variance    0.1541   0.01611     9.6    pos
##D ##      R!day.pow    0.7683   0.04191    18    uncon
##D 
##D 
##D # ----- Model 3. Full model for all species/ages.  Schabenberger p. 518
##D 
##D ## /* Continuous AR(1) autocorrelations included      */
##D ## proc mixed data=wateruse;
##D ##   class age species tree;
##D ##   model water = age*species age*species*ti age*species*ti*ti / noint s;
##D ##   random intercept ti / subject=age*species*tree s;
##D ##   repeated / subject=age*species*tree type=sp(exp)(day);
##D 
##D 
##D m3l <- lme(water ~ 0 + age:species + age:species:ti + age:species:ti2,
##D            data=dat, na.action=na.omit,
##D            random = list(tree=pdDiag(~1+ti)),
##D            cor = corExp(form=~ day|tree),
##D            )
##D 
##D m3l # Match Schabenberger output 7.27.  Same fixef, ranef, variances, exp corr
##D 
##D vc(m3l)
##D ##       effect variance stddev
##D ##  (Intercept)  0.1549  0.3936
##D ##           ti  0.02785 0.1669
##D ##     Residual  0.16    0.4
##D 
##D # --- asreml
##D 
##D dat <- dat[order(dat$tree,dat$day),]
##D m3a <- asreml(water ~ 0 + age:species + age:species:ti + age:species:ti2,
##D              data=dat,
##D              random = ~ age:species:tree + age:species:tree:ti,
##D              rcov = ~ tree:exp(day)
##D              )
##D 
##D vc(m3a) # Note: day.pow = .8091 = exp(-1/4.7217)
##D ##                       effect component std.error z.ratio constr
##D ##     age:species:tree!age.var   0.1549   0.07192      2.2    pos
##D ##  age:species:tree:ti!age.var   0.02785  0.01343      2.1    pos
##D ##                   R!variance   0.16     0.008917    18      pos
##D ##                    R!day.pow   0.8091   0.01581     51    uncon
##D 
## End(Not run)



