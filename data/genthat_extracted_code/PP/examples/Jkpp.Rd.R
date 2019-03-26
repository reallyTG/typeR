library(PP)


### Name: JKpp
### Title: Run a jackknife
### Aliases: JKpp JKpp.fourpl JKpp.gpcm JKpp.gpcm4pl print.jk summary.jk

### ** Examples

################# Jackknife ###################################################

### 4 PL model ######

### data creation ##########

set.seed(1623)
# intercepts
diffpar <- seq(-3,3,length=12)
# slope parameters
sl     <- round(runif(12,0.5,1.5),2)
la     <- round(runif(12,0,0.25),2)
ua     <- round(runif(12,0.8,1),2)

# response matrix
abpar <- rnorm(10,0,1.7)
awm <- sim_4pl(beta = diffpar,alpha = sl,lowerA = la,upperA=ua,theta = abpar)

## 1PL model ##### 

# MLE
res1plmle <- PP_4pl(respm = awm,thres = diffpar,type = "mle")
# WLE
res1plwle <- PP_4pl(respm = awm,thres = diffpar,type = "wle")
# MAP estimation
res1plmap <- PP_4pl(respm = awm,thres = diffpar,type = "map")
# EAP estimation
res1pleap <- PP_4pl(respm = awm,thres = diffpar,type = "eap")
# robust estimation
res1plrob <- PP_4pl(respm = awm,thres = diffpar,type = "robust")

## centering method = mean
res_jk1 <- JKpp(res1plmle)
res_jk2 <- JKpp(res1plwle)
res_jk3 <- JKpp(res1plmap)
res_jk4 <- JKpp(res1plrob)
res_jk5 <- JKpp(res1pleap)

summary(res_jk1)

## centering method = median
res_jk1a <- JKpp(res1plmle,cmeth = "median")
res_jk2a <- JKpp(res1plwle,cmeth = "median")
res_jk3a <- JKpp(res1plmap,cmeth = "median")

summary(res_jk2a)

## centering method = AMT
res_jk1b <- JKpp(res1plmle,cmeth = "AMT")
res_jk2b <- JKpp(res1plwle,cmeth = "AMT")
res_jk3b <- JKpp(res1plmap,cmeth = "AMT")

summary(res_jk3b)


## 2PL model ##### 

# MLE
res2plmle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "mle")
# WLE
res2plwle <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "wle")
# MAP estimation
res2plmap <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "map")
# EAP estimation
res2pleap <- PP_4pl(respm = awm,thres = diffpar,slopes = sl,type = "eap")
# robust estimation
res2plrob <- PP_4pl(respm = awm,thres = diffpar,slopes = sl,type = "robust")

res_jk6 <- JKpp(res2plmle)
res_jk7 <- JKpp(res2plwle)
res_jk8 <- JKpp(res2plmap)
res_jk9 <- JKpp(res2pleap)
res_jk10 <- JKpp(res2plrob)

### GPCM model ######

# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)
awmatrix <- matrix(c(1,0,2,0,1,1,1,0,0,1,2,0,0,0,0,0,0,0,0,1,
                     1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)


### PCM model ######

# MLE
respcmlmle <- PP_gpcm(respm = awmatrix,thres = THRES,
                      slopes = rep(1,ncol(THRES)),type = "mle")
# WLE
respcmwle <- PP_gpcm(respm = awmatrix,thres = THRES,
                     slopes = rep(1,ncol(THRES)),type = "wle")
# MAP estimation
respcmmap <- PP_gpcm(respm = awmatrix,thres = THRES,
                     slopes = rep(1,ncol(THRES)),type = "map")


res_jk11 <- JKpp(respcmlmle)
res_jk12 <- JKpp(respcmwle)
res_jk13 <- JKpp(respcmmap)

### GPCM/4-PL mixed model ######

THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)

sl     <- c(0.5,1,1.5,1.1,1,0.98)

THRESx <- THRES
THRESx[2,1:3] <- NA

# for the 4PL item the estimated parameters are submitted, 
# for the GPCM items the lower asymptote = 0 
# and the upper asymptote = 1.
la     <- c(0.02,0.1,0,0,0,0)
ua     <- c(0.97,0.91,1,1,1,1)

awmatrix <- matrix(c(1,0,1,0,1,1,1,0,0,1
                     ,2,0,0,0,1,0,0,0,0,1
                     ,0,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)

# create model2est
# this function tries to help finding the appropriate 
# model by inspecting the THRESx.
model2est <- findmodel(THRESx)


# MLE estimation
respmixed_mle <- PPall(respm = awmatrix,
                       thres = THRESx, 
                       slopes = sl,
                       lowerA = la,
                       upperA=ua,
                       type = "mle",
                       model2est=model2est)
# WLE estimation
respmixed_wle <- PPall(respm = awmatrix,
                       thres = THRESx, 
                       slopes = sl,
                       lowerA = la,
                       upperA=ua,
                       type = "wle",
                       model2est=model2est)


res_jk114 <- JKpp(respmixed_mle)
res_jk115 <- JKpp(respmixed_wle)



