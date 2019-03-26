library(agridat)


### Name: acorsi.grayleafspot
### Title: Multi-environment trial evaluating 36 maize genotypes in 9
###   locations
### Aliases: acorsi.grayleafspot
### Keywords: datasets

### ** Examples


data(acorsi.grayleafspot)
dat <- acorsi.grayleafspot

# Acorsi figure 2. Note: Acorsi used cell means
op <- par(mfrow=c(2,1), mar=c(5,4,3,2))
boxplot(y ~ env, dat, las=2,
        xlab="environment", ylab="GLS severity")
title("acorsi.grayleafspot")
boxplot(y ~ gen, dat, las=2,
        xlab="genotype", ylab="GLS severity")
par(op)

## Not run: 
##D   
##D   # GLM models
##D   
##D   # glm main-effects model with logit u(1-u) and wedderburn u^2(1-u)^2
##D   # variance functions
##D   # glm1 <- glm(y~ env/rep + gen + env, data=dat, family=quasibinomial)
##D   # glm2 <- glm(y~ env/rep + gen + env, data=dat, family=wedderburn)
##D   # plot(glm2, which=1); plot(glm2, which=2)
##D   
##D   # GAMMI models of Acorsi. See also section 7.4 of Turner
##D   # "Generalized nonlinear models in R: An overview of the gnm package"
##D   
##D   # full gnm model with wedderburn, seems to work
##D   require(gnm)
##D   set.seed(1)
##D   gnm1 <- gnm(y ~  env/rep + env + gen + instances(Mult(env,gen),2),
##D               data=dat,
##D               family=wedderburn, iterMax =800)
##D   deviance(gnm1) # 433.8548
##D   # summary(gnm1)
##D   # anova(gnm1, test ="F")  # anodev, Acorsi table 4
##D   ##                          Df Deviance Resid. Df Resid. Dev       F    Pr(>F)    
##D   ## NULL                                       647     3355.5                      
##D   ## env                       8  1045.09       639     2310.4 68.4696 < 2.2e-16 ***
##D   ## env:rep                   9    12.33       630     2298.1  0.7183    0.6923    
##D   ## gen                      35  1176.23       595     1121.9 17.6142 < 2.2e-16 ***
##D   ## Mult(env, gen, inst = 1) 42   375.94       553      745.9  4.6915 < 2.2e-16 ***
##D   ## Mult(env, gen, inst = 2) 40   312.06       513      433.9  4.0889 3.712e-14 ***
##D 
##D 
##D   # maybe better, start simple and build up the model
##D   gnm2a <- gnm(y ~  env/rep + env + gen,
##D                data=dat,
##D                family=wedderburn, iterMax =800)
##D 
##D   # add first interaction term
##D   res2a <- residSVD(gnm2a, env, gen, 2)
##D   gnm2b <- update(gnm2a, . ~ . + Mult(env,gen,inst=1),
##D                   start = c(coef(gnm2a), res2a[, 1]))
##D   deviance(gnm2b) # 692.19
##D 
##D   # add second interaction term
##D   res2b <- residSVD(gnm2b, env, gen, 2)
##D   gnm2c <- update(gnm2b, . ~ . + Mult(env,gen,inst=1) + Mult(env,gen,inst=2),
##D                   start = c(coef(gnm2a), res2a[, 1], res2b[,1]))
##D   deviance(gnm2c) # 433.8548
##D   # anova(gnm2c) # weird error message
##D 
##D   # note, to build the ammi biplot, use the first column of res2a to get
##D   # axis 1, and the FIRST column of res2b to get axis 2. Slightly confusing
##D   emat <- cbind(res2a[1:9, 1], res2b[1:9, 1])
##D   rownames(emat) <- gsub("fac1.", "", rownames(emat))
##D   
##D   gmat <- cbind(res2a[10:45, 1], res2b[10:45, 1])
##D   rownames(gmat) <- gsub("fac2.", "", rownames(gmat))
##D 
##D   # match Acorsi figure 4
##D   biplot(gmat, emat, xlim=c(-2.2, 2.2), ylim=c(-2.2, 2.2), expand=2, cex=0.5,
##D          xlab="Axis 1", ylab="Axis 2",
##D          main="acorsi.grayleafspot - GAMMI biplot")
## End(Not run)




