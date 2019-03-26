library(agridat)


### Name: besag.met
### Title: Multi-environment trial of corn laid out in incomplete-blocks
### Aliases: besag.met

### ** Examples


data(besag.met)
dat <- besag.met

if(require(desplot)){
  desplot(yield ~ col*row|county, dat,
          aspect=36/11, # true aspect
          out1=rep, out2=block,
          main="besag.met")
}

# Average reps
datm <- aggregate(yield ~ county + gen, data=dat, FUN=mean)

# Sections below fit heteroskedastic variance models (variance for each variety)
# asreml takes 1 second, lme 73 seconds, SAS PROC MIXED 30 minutes

# ----------------------------------------------------------------------------

## Not run: 
##D   # lme
##D   require(nlme)
##D   m1l <- lme(yield ~ -1 + gen, data=datm, random=~1|county,
##D              weights = varIdent(form=~ 1|gen))
##D   m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2
##D   ##           G02    G03    G04    G05    G06    G07    G08
##D   ##  91.90 210.75  63.03 112.05  28.39 237.36  72.72  42.97
##D   ## ... etc ...
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   
##D   # asreml Using 'rcov' ALWAYS requires sorting the data
##D 
##D   datm <- datm[order(datm$gen),]
##D   m1a <- asreml(yield ~ gen, data=datm,
##D                 random = ~ county,
##D                 rcov = ~ at(gen):units,
##D                 predict=asreml:::predict.asreml(classify="gen"))
##D 
##D   require(lucid)
##D   vc(m1a)[1:7,]
##D   ##             effect component std.error z.ratio constr
##D   ##  county!county.var   1324       838.2      1.6    pos
##D   ##   gen_G01!variance     91.93     58.82     1.6    pos
##D   ##   gen_G02!variance    210.7     133.9      1.6    pos
##D   ##   gen_G03!variance     63.03     40.53     1.6    pos
##D   ##   gen_G04!variance    112.1      71.53     1.6    pos
##D   ##   gen_G05!variance     28.39     18.63     1.5    pos
##D   ##   gen_G06!variance    237.4     150.8      1.6    pos
##D 
##D 
##D   # We get the same results from asreml & lme
##D   plot(m1a$gammas[-1],
##D        m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2)
##D 
##D 
##D   # The following example shows how to construct a GxE biplot
##D   # from the FA2 model.
##D 
##D   dat <- besag.met
##D   dat <- transform(dat, xf=factor(col), yf=factor(row))
##D   dat <- dat[order(dat$county, dat$xf, dat$yf), ]
##D   
##D   # First, AR1xAR1
##D   m1 <- asreml(yield ~ county, data=dat,
##D                random = ~ gen:county,
##D                rcov = ~ at(county):ar1(xf):ar1(yf))
##D   # Add FA1.
##D   # For ASExtras:::summary.fa, use fa(county,1):gen, NOT gen:fa(county,1)
##D   m2 <- update(m1, random=~fa(county,1):gen)
##D   # FA2
##D   m3 <- update(m2, random=~fa(county,2):gen)
##D   
##D   # Use the loadings to make a biplot
##D   vars <- vc(m3)
##D   psi <- vars[grepl(".var$", vars$effect), "component"]
##D   la1 <- vars[grepl(".fa1$", vars$effect), "component"]
##D   la2 <- vars[grepl(".fa2$", vars$effect), "component"]
##D   mat <- as.matrix(data.frame(psi, la1, la2))
##D   rot <- svd(mat[,-1])$v # rotation matrix
##D   lam <- mat[,-1] ##D 
##D   colnames(lam) <- c("load1", "load2")
##D   
##D   co3 <- coef(m3)$random # Scores are the GxE coefficients
##D   ix1 <- grepl("_Comp1:gen", rownames(co3))
##D   ix2 <- grepl("_Comp2:gen", rownames(co3))
##D   sco <- matrix(c(co3[ix1], co3[ix2]), ncol=2, byrow=FALSE)
##D   sco <- sco ##D 
##D   dimnames(sco) <- list(levels(dat$gen) , c('load1','load2'))
##D   rownames(lam) <- levels(dat$county)
##D   sco[,1] <- -1 * sco[,1]
##D   lam[,1] <- -1 * lam[,1]
##D   biplot(sco, lam, cex=.5, main="FA2 coefficient biplot")
##D   # G variance matrix
##D   gvar <- lam ##D 
##D   
##D   # Now get predictions and make an ordinary biplot
##D   p3 <- predict(m3, data=dat, classify="county:gen")
##D   p3 <- p3$pred$pval
##D   require("gge")  
##D   bi3 <- gge(predicted.value ~ gen*county, data=p3, scale=FALSE)
##D   if(interactive()) dev.new()
##D   # Very similar to the coefficient biplot
##D   biplot(bi3, stand=FALSE, # what does 'stand' do?
##D          main="SVD biplot of FA2 predictions")
##D 
##D   # latent factor plots and more
##D   if(FALSE) {
##D     library(ASExtras)
##D     ASExtras:::summary.fa(m3, g.list=c("G01","G02","G03","G04","G05","G06","G07","G08")) 
##D     out <- ASExtras:::summary.fa(m3,uniplot=0,blups=1,regplot=1,addedplot=0,heatmap=0) 
##D     loads <- as.data.frame(out$gammas$`fa(county, 2):gen`$`rotated loads`)
##D     loads$county <- rownames(loads)
##D     
##D     regdat <- out$blups$`fa(county, 2):gen`$blups.inmet
##D     regdat <- merge(regdat, loads)
##D     
##D     library(latticeExtra)
##D     xyplot(blup ~ fac_1|gen, data=regdat, as.table=TRUE)+
##D       xyplot(regblup ~ fac_1|gen, data=regdat,
##D              as.table=TRUE, type='r')
##D     }
##D 
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D  ##  require(asreml4)
##D   
##D  ##  # asreml Using 'rcov' ALWAYS requires sorting the data
##D  ##  datm <- datm[order(datm$gen),]
##D 
##D  ##  m1 <- asreml(yield ~ gen, data=datm,
##D  ##               random = ~ county,
##D  ##               resid = ~ dsum( ~ units|gen))
##D  ##  #summary(m1)$varcomp[1:7,]
##D  ##  require(lucid)
##D  ##  vc(m1)[1:7,]
##D  ## ##     effect component std.error z.ratio bound ##D 
##D  ## ##     county   1324       838.2      1.6     P 0  
##D  ## ## gen_G01(R)     91.95     58.85     1.6     P 0  
##D  ## ## gen_G02(R)    210.7     133.8      1.6     P 0.1
##D  ## ## gen_G03(R)     63.04     40.55     1.6     P 0  
##D  ## ## gen_G04(R)    112.1      71.54     1.6     P 0  
##D  ## ## gen_G05(R)     28.38     18.61     1.5     P 0.1
##D  ## ## gen_G06(R)    237.4     150.8      1.6     P 0  
##D   
##D  ##  # We get the same results from asreml & lme
##D  ##  plot(m1$vparameters[-1],
##D  ##     m1l$sigma^2 * c(1, coef(m1l$modelStruct$varStruct, unc = FALSE))^2)
##D 
##D  ##  # The following example shows how to construct a GxE biplot
##D  ##  # from the FA2 model.
##D 
##D  ##  dat <- besag.met
##D  ##  dat <- transform(dat, xf=factor(col), yf=factor(row))
##D  ##  dat <- dat[order(dat$county, dat$xf, dat$yf), ]
##D 
##D  ##  # First, AR1xAR1
##D  ##  m1 <- asreml(yield ~ county, data=dat,
##D  ##               random = ~ gen:county,
##D  ##               resid = ~ dsum( ~ ar1(xf):ar1(yf)|county))
##D 
##D  ##  # Add FA1
##D  ##  m2 <- update(m1, random=~gen:fa(county,1))
##D  ##  # FA2
##D  ##  m3 <- update(m2, random=~gen:fa(county,2))
##D 
##D  ##  # Use the loadings to make a biplot
##D  ##  vars <- vc(m3)
##D  ##  psi <- vars[grepl("!var$", vars$effect), "component"]
##D  ##  la1 <- vars[grepl("!fa1$", vars$effect), "component"]
##D  ##  la2 <- vars[grepl("!fa2$", vars$effect), "component"]
##D  ##  mat <- as.matrix(data.frame(psi, la1, la2))
##D  ##  rot <- svd(mat[,-1])$v # rotation matrix
##D  ##  lam <- mat[,-1] ##D 
##D  ##  colnames(lam) <- c("load1", "load2")
##D 
##D  ##  co3 <- coef(m3)$random # Scores are the GxE coefficients
##D  ##  ix1 <- grepl("_Comp1$", rownames(co3))
##D  ##  ix2 <- grepl("_Comp2$", rownames(co3))
##D  ##  sco <- matrix(c(co3[ix1], co3[ix2]), ncol=2, byrow=FALSE)
##D  ##  sco <- sco ##D 
##D  ##  dimnames(sco) <- list(levels(dat$gen) , c('load1','load2'))
##D  ##  rownames(lam) <- levels(dat$county)
##D  ##  sco[,1] <- -1 * sco[,1]
##D  ##  lam[,1] <- -1 * lam[,1]
##D  ##  biplot(sco, lam, cex=.5, main="FA2 coefficient biplot")
##D  ##  # G variance matrix
##D  ##  gvar <- lam ##D 
##D   
##D  ##  # Now get predictions and make an ordinary biplot
##D  ##  p3 <- predict(m3, data=dat, classify="county:gen")
##D  ##  p3 <- p3$pvals
##D  ##  require("gge")  
##D  ##  bi3 <- gge(predicted.value ~ gen*county, data=p3, scale=FALSE)
##D  ##  if(interactive()) dev.new()
##D  ##  # Very similar to the coefficient biplot
##D  ##  biplot(bi3, stand=FALSE, main="SVD biplot of FA2 predictions")
##D 
## End(Not run)




