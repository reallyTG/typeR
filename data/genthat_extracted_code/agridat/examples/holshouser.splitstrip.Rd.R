library(agridat)


### Name: holshouser.splitstrip
### Title: Split strip plot on soybeans
### Aliases: holshouser.splitstrip
### Keywords: datasets

### ** Examples


data(holshouser.splitstrip)
dat <- holshouser.splitstrip
dat$spacing <- factor(dat$spacing)
dat$pop <- factor(dat$pop)

# Experiment layout and field trends
if(require(desplot)){
  desplot(yield ~ col*row, data=dat,
          out1=block, # unknown aspect
          main="holshouser.splitstrip")
  desplot(spacing ~ col*row, data=dat,
          out1=block, out2=cultivar, # unknown aspect
          col=cultivar, text=pop, cex=.8, shorten='none', col.regions=c('wheat','white'),
          main="holshouser.splitstrip experiment design")
}


# Overall main effects and interactions
if(require(HH)){
  interaction2wt(yield~cultivar*spacing*pop, dat,
                 x.between=0, y.between=0,
                 main="holshouser.splitstrip")
}

## Schabenberger's SAS model, page 497
## proc mixed data=splitstripplot;
##   class block cultivar pop spacing;
##   model yield = cultivar spacing spacing*cultivar pop pop*cultivar
##                 spacing*pop spacing*pop*cultivar / ddfm=satterth;
##   random block block*cultivar block*cultivar*spacing block*cultivar*pop;
## run;

## Not run: 
##D   ## Now lme4. This design has five error terms--four are explicitly given.
##D   require(lme4)
##D   require(lucid)
##D   m1 <- lmer(yield ~ cultivar * spacing * pop +
##D                (1|block) + (1|block:cultivar) + (1|block:cultivar:spacing) +
##D                (1|block:cultivar:pop), data=dat)
##D   vc(m1) ## Variances match Schabenberger, page 498.
##D   ##                    grp        var1 var2   vcov  sdcor
##D   ##     block:cultivar:pop (Intercept) <NA> 2.421  1.556
##D   ## block:cultivar:spacing (Intercept) <NA> 1.244  1.116
##D   ##         block:cultivar (Intercept) <NA> 0.4523 0.6725
##D   ##                  block (Intercept) <NA> 3.037  1.743
##D   ##               Residual        <NA> <NA> 3.928  1.982
##D   
## End(Not run)




