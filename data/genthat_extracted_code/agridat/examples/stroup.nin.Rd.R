library(agridat)


### Name: stroup.nin
### Title: RCB experiment of wheat at the Nebraska Intrastate Nursery
### Aliases: stroup.nin

### ** Examples


data(stroup.nin)
dat <- stroup.nin

# Experiment layout. All "Buckskin" plots are near left side
if(require(desplot)){
  desplot(yield~col*row, dat,
          aspect=47.3/26.4, out1="rep", num=gen, cex=0.6, # true aspect
          main="stroup.nin - yield heatmap (true shape)")
}

# ----- nlme -----

require(nlme)
# Random RCB model
lme1 <- lme(yield ~ 0 + gen, random=~1|rep, data=dat, na.action=na.omit)

# Linear (Manhattan distance) correlation model
lme2 <- gls(yield ~ 0 + gen, data=dat,
           correlation = corLin(form = ~ col + row, nugget=TRUE),
           na.action=na.omit)

# Random block and spatial correlation.
# Note: corExp and corSpher give nearly identical results
lme3 <- lme(yield ~ 0 + gen, data=dat,
            random = ~ 1 | rep,
            correlation = corExp(form = ~ col + row),
            na.action=na.omit)

AIC(lme1,lme2,lme3) # lme2 is lowest
##      df      AIC
## lme1 58 1333.702
## lme2 59 1189.135
## lme3 59 1216.704

# Compare the estimates from the two methods
eff = data.frame(ranblock=fixef(lme1), corLin = coef(lme2),
                 corExp = fixef(lme3))
rownames(eff) <- gsub("gen", "", rownames(eff))
plot(eff$ranblock, eff$corLin, xlim=c(13,37), ylim=c(13,37),
     main="stroup.nin - Gen estimates (intercepts differ)",
     xlab="RCB (random block)", ylab="corLin",type='n')
text(eff$ranblock, eff$corLin, rownames(eff), cex=0.5)
abline(0,1)

# ----------------------------------------------------------------------------

# Note, the 'sommer' package has dropped support for ar1

# ----------------------------------------------------------------------------

## Not run: 
##D   if(require(SpATS)){
##D     
##D     dat <- transform(dat, yf = as.factor(row), xf = as.factor(col))
##D     
##D     sp1 <- SpATS(response = "yield",
##D                  spatial = ~ SAP(col, row, nseg = c(10,20), degree = 3, pord = 2),
##D                  genotype = "gen",
##D                  #fixed = ~ colcode + rowcode,
##D                  random = ~ yf + xf,
##D                  data = dat,
##D                  control = list(tolerance = 1e-03))
##D     plot(sp1)
##D     
##D     eff <- cbind(eff, spats=predict(sp1, which="gen")$predicted.values)
##D     plot(eff$ranblock, eff$spats, xlim=c(13,37), ylim=c(13,37),
##D          main="stroup.nin - Gen estimates",
##D          xlab="RCB (random block)", ylab="SpATS",type='n')
##D     text(eff$ranblock, eff$spats, rownames(eff), cex=0.5)
##D     abline(0,1)
##D   }
##D   
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D  
##D   # RCB analysis
##D   dat.rcb <- asreml(yield ~ gen, random = ~ rep, data=dat,
##D                     na.method.X="omit")
##D   pred.rcb <- predict(dat.rcb, data=dat, classify="gen")$predictions
##D 
##D   # Two-dimensional AR1xAR1 spatial model
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$xf, dat$yf),]
##D   dat.sp <- asreml(yield~gen, data=dat,
##D                    rcov=~ar1(xf):ar1(yf),
##D                    na.method.X='ignore')
##D   pred.sp <- predict(dat.sp, data=dat, classify="gen")$predictions
##D 
##D   require(lucid)
##D   vc(dat.sp)
##D   ##     effect component std.error z.ratio constr
##D   ## R!variance   48.7      7.155       6.8    pos
##D   ##   R!xf.cor    0.6555   0.05638    12      unc
##D   ##   R!yf.cor    0.4375   0.0806      5.4    unc
##D 
##D   # Compare the estimates from the two methods
##D   plot(pred.rcb$pvals[,2], pred.sp$pvals[,2], xlim=c(13,37), ylim=c(13,37),
##D        xlab="RCB",ylab="AR1xAR1",type='n')
##D   title("stroup.nin: Comparison of predicted values")
##D   text(pred.rcb$pvals[,2],pred.sp$pvals[,2],
##D        as.character(pred.rcb$pvals[,1]),cex=0.5)
##D   abline(0,1) 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   
##D   ## require(asreml4)
##D   ## data(stroup.nin)
##D   ## dat <- stroup.nin
##D 
##D   ## # Note, ASREML4 stand-alone might not need a completely-filled rectangle
##D   ## # of plots to perform AR1xAR1 analysis.  It might be able to fill in missing
##D   ## # combinations of rows/columns. The R version asreml4 still seems to require
##D   ## # rectangles.
##D 
##D   ## # RCB analysis
##D   ## dat.rcb <- asreml(yield ~ gen, random = ~ rep, data=dat,
##D   ##                   na.action=na.method(x="omit"))
##D   ## pred.rcb <- predict(dat.rcb, data=dat, classify="gen")
##D 
##D   ## # Two-dimensional AR1xAR1 spatial model
##D   ## dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   ## #dat <- dat[order(dat$xf, dat$yf),]
##D   ## dat.sp <- asreml(yield~gen, data=dat,
##D   ##                  residual = ~ar1(xf):ar1(yf),
##D   ##                  na.action=na.method(x="omit"))
##D   ## pred.sp <- predict(dat.sp, data=dat, classify="gen")
##D 
##D   ## require(lucid)
##D   ## vc(dat.sp)
##D   ## ##     effect component std.error z.ratio constr
##D   ## ## R!variance   48.7      7.155       6.8    pos
##D   ## ##   R!xf.cor    0.6555   0.05638    12      unc
##D   ## ##   R!yf.cor    0.4375   0.0806      5.4    unc
##D 
##D   ## # Compare the estimates from the two methods
##D   ## plot(pred.rcb$pvals[,2], pred.sp$pvals[,2], xlim=c(13,37), ylim=c(13,37),
##D   ##      xlab="RCB", ylab="AR1xAR1", type='n')
##D   ## title("stroup.nin: Comparison of predicted values")
##D   ## text(pred.rcb$pvals[,2],pred.sp$pvals[,2],
##D   ##      as.character(pred.rcb$pvals[,1]),cex=0.5)
##D   ## abline(0,1)
##D   
## End(Not run)

# ----------------------------------------------------------------------------




