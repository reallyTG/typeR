library(PP)


### Name: PV
### Title: Draw Plausible values
### Aliases: PV PV.fourpl PV.gpcm PV.gpcm4pl print.pv summary.pv

### ** Examples

################# Plausible values #############################################################


### 4 PL model ######


### data creation ##########

set.seed(1522)
# intercepts
diffpar <- seq(-3,3,length=12)
# slope parameters
sl     <- round(runif(12,0.5,1.5),2)
la     <- round(runif(12,0,0.25),2)
ua     <- round(runif(12,0.8,1),2)

# response matrix
awm <- matrix(sample(0:1,10*12,replace=TRUE),ncol=12)


# EAP estimation - 2pl model
res2pleap <- PP_4pl(respm = awm,thres = diffpar, slopes = sl,type = "eap")

# draw 10 plausible values
res_pv  <- PV(res2pleap)
summary(res_pv)

# draw 10 plausible values - use a metropolitan hastings algorithm
res_pv2  <- PV(res2pleap,approx = FALSE)
summary(res_pv2)

# ------ check the PVs


# -- autocorrelation?
autocor <- function(acv)
  {
  cor(acv[-1],acv[-length(acv)]) 
  }


res_pvac  <- PV(res2pleap,approx = FALSE,npv = 200)

# independent draws - so there cannot be any systematic autocorrelation when
# approx = TRUE. So this acts as a kind of benchmark for the MH-Alg.
res_pvac2  <- PV(res2pleap,approx = TRUE,npv = 200)

apply(res_pvac$pvdraws,1,autocor)
apply(res_pvac2$pvdraws,1,autocor)

# -- autocorrelation distr?


apply(res_pvac$pvdraws,1,quantile)
apply(res_pvac2$pvdraws,1, quantile)




### GPCM model ######


# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)
awmatrix <- matrix(c(1,0,2,0,1,1,1,0,0,1
                     ,2,0,0,0,0,0,0,0,0,1,1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)


# EAP estimation
resgpcmeap <- PP_gpcm(respm = awmatrix,thres = THRES, slopes = sl,type = "eap")


res_gpcmpv  <- PV(resgpcmeap,approx = FALSE,npv = 20)




### GPCM and 4PL model ######


# some threshold parameters
THRES  <- matrix(c(-2,-1.23,1.11,3.48,1
                   ,2,-1,-0.2,0.5,1.3,-0.8,1.5),nrow=2)
# slopes
sl     <- c(0.5,1,1.5,1.1,1,0.98)

THRESx <- THRES
THRESx[2,1:3] <- NA

# for the 4PL item the estimated parameters are submitted, 
# for the GPCM items the lower asymptote = 0 
# and the upper asymptote = 1.
la     <- c(0.02,0.1,0,0,0,0)
ua     <- c(0.97,0.91,1,1,1,1)

awmatrix <- matrix(c(1,0,1,0,1,1,1,0,0,1
                     ,2,0,0,0,0,0,0,0,0,1
                     ,1,2,2,1,1,1,1,0,0,1),byrow=TRUE,nrow=5)

model2est <- findmodel(THRESx)


# EAP estimation
respcmeap1 <- PPall(respm = awmatrix,thres = THRESx, 
                    slopes = sl,lowerA = la, upperA=ua, type = "eap",
                    model2est=model2est)


res_mixedpv_1  <- PV(respcmeap1,approx = FALSE,npv = 200)

# rowMeans of plausible values should approximate the EAPs
rowMeans(res_mixedpv_1$pvdraws)
# EAPs
respcmeap1

# show the quantiles of the empirical distribution
apply(res_mixedpv_1$pvdraws,1,quantile)




