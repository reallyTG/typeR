library(agridat)


### Name: yates.oats
### Title: Yield of oats in a split-plot experiment
### Aliases: yates.oats

### ** Examples


library(agridat)
data(yates.oats)
dat <- yates.oats

## # Means match Rothamsted report p. 144
## require(dplyr)
## dat %>% group_by(nitro,gen) %>%
##   summarize(grain=mean(grain)*80/112,
##             straw=mean(straw)*80/112)

if(require(desplot)){
  # Experiment design & yield heatmap
  desplot(yield ~ col*row, dat,
          out1=block, num=nitro, col=gen,
          cex=1, aspect=511/176, # true aspect
          main="yates.oats")
}


# Roughly linear gradient across the field.  The right-half of each
# block has lower yield.  The blocking is inadequate!
require("lattice")
xyplot(yield ~ col|factor(nitro), dat,
       type = c('p', 'r'), xlab='col', as.table = TRUE,
       main="yates.oats")

## Not run: 
##D   require(lme4)
##D   # Typical split-plot analysis. Non-significant gen differences
##D   m3 <- lmer(yield ~ nitro * gen + (1|block/gen), data=dat)
##D   # Residuals still show structure
##D   xyplot(resid(m3) ~ dat$col, xlab='col', type=c('p','smooth'),
##D          main="yates.oats")
##D   
##D   # Add a linear trend for column
##D   m4 <- lmer(yield ~ col + nitro * gen + (1|block/gen), data=dat)
##D   # xyplot(resid(m4) ~ dat$col, type=c('p','smooth'), xlab='col')
##D   
##D   ## Compare fits
##D   AIC(m3,m4)
##D   ##    df      AIC
##D   ## m3  9 581.2372
##D   ## m4 10 557.9424 # Substantially better
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Marginal predictions from emmeans package and asreml::predict
##D 
##D   # --- nlme ---
##D   require(nlme)
##D   require(emmeans)
##D   # create unbalance
##D   dat2 <- yates.oats[-c(1,2,3,5,8,13,21,34,55),]
##D   m5l <- lme(yield ~ factor(nitro) + gen, random = ~1 | block/gen,
##D              data = dat2)
##D 
##D   # --- asreml ---
##D   require(asreml)
##D   m5a <- asreml(yield ~ factor(nitro) + gen,
##D                 random = ~ block + block:gen, data=dat2)
##D 
##D   require(lucid)
##D   vc(m5l)
##D   vc(m5a)
##D 
##D   emmeans::emmeans(m5l, "gen")
##D   predict(m5a, data=dat, classify="gen")$predictions$pvals
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Demonstrate use of regress package, compare to lme
##D 
##D   library(regress)
##D   dat$nitrof <- factor(dat$nitro)
##D   m6 <- regress(yield ~ nitrof + gen, ~block + I(block:gen), identity=TRUE,
##D                 verbose=1, data=dat)
##D   summary(m6)
##D   ## Variance Coefficients:
##D   ##                Estimate Std. Error
##D   ##   block         214.468    168.794
##D   ##   I(block:gen)  109.700     67.741
##D   ##   In            162.558     32.189
##D 
##D   # ordinal causes clash with VarCorr
##D   if(is.element("package:ordinal", search())) detach(package:ordinal)
##D   
##D   m7 <- lme(yield ~ nitrof + gen, random = ~ 1|block/gen, data=dat)
##D   lme4::VarCorr(m7)
##D   ##             Variance     StdDev  
##D   ## block =     pdLogChol(1)         
##D   ## (Intercept) 214.4716     14.64485
##D   ## gen =       pdLogChol(1)         
##D   ## (Intercept) 109.6929     10.47344
##D   ## Residual    162.5591     12.74987
## End(Not run)




