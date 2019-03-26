library(refund.shiny)


### Name: plot_shiny
### Title: plot_shiny The generic function for interactive plots of
###   functional data analyses
### Aliases: plot_shiny

### ** Examples


## Not run: 
##D 
##D library(refund)
##D library(dplyr)
##D 
##D ##### FPCA Example on real data #####
##D 
##D data(cd4)
##D SC = fpca.sc(cd4)
##D plot_shiny(SC)
##D 
##D ##### FPCA Examples on simulated data #####
##D 
##D set.seed(2678695)
##D n = 101
##D m = 101
##D s1 = 20
##D s2 = 10
##D s = 4
##D t = seq(-1, 1, l=m)
##D v1 = t + sin(pi*t)
##D v2 = cos(3*pi*t)
##D V = cbind(v1/sqrt(sum(v1^2)), v2/sqrt(sum(v2^2)))
##D U = matrix(rnorm(n*2), n, 2)
##D D = diag(c(s1^2, s2^2))
##D eps = matrix(rnorm(m*n, sd=s), n, m)
##D Y = U%*%D%*%t(V) + eps
##D 
##D SC = fpca.sc(Y)
##D FACE = fpca.face(Y)
##D SSVD = fpca.ssvd(Y, verbose=FALSE)
##D S = fpca2s(Y)
##D  
##D plot_shiny(SC)
##D plot_shiny(FACE)
##D plot_shiny(SSVD)
##D plot_shiny(S)
##D 
##D #' ##### MFPCA Example #####
##D 
##D data(DTI)
##D Y = DTI$cca
##D id = DTI$ID
##D 
##D mfpca.dti = mfpca.sc(Y=Y, id = id, twoway = FALSE)
##D plot_shiny(mfpca.dti)
##D 
##D ##### FoSR Example #####
##D 
##D data(DTI)
##D DTI = DTI[complete.cases(DTI),]
##D fit.fosr = bayes_fosr(cca ~ pasat + sex, data = DTI)
##D plot_shiny(fit.fosr)
##D 
##D ##### FoSR Example with outliers #####
##D 
##D DTI$cca[1,] = DTI$cca[1,] + .4
##D DTI$cca[2,] = DTI$cca[2,] + .4
##D 
##D fosr.dti2 = bayes_fosr(cca ~ pasat + sex, data = DTI)
##D plot_shiny(fosr.dti2)
##D 
##D ##### Longitudinal FoSR Examples #####
##D 
##D data(DTI2)
##D class(DTI2$cca) = class(DTI2$cca)[-1]
##D DTI2 = subset(DTI2, select = c(cca, id, pasat))
##D DTI2 = DTI2[complete.cases(DTI2),]
##D 
##D fosr.dti3 = bayes_fosr(cca ~ pasat + re(id), data = DTI2, Kt = 10, Kp = 4, cov.method = "FPCA")
##D plot_shiny(fosr.dti3)
##D plot_shiny(fosr.dti3$fpca.obj)
##D 
##D ##### LFPCA Example on real data #####
##D 
##D data(DTI)
##D MS <- subset(DTI, case ==1)  # subset data with multiple sclerosis (MS) case
##D 
##D index.na <- which(is.na(MS$cca))  
##D Y <- MS$cca; Y[index.na] <- fpca.sc(Y)$Yhat[index.na]; sum(is.na(Y))
##D id <- MS$ID 
##D visit.index <- MS$visit 
##D visit.time <- MS$visit.time/max(MS$visit.time)
##D 
##D lfpca.dti1 <- fpca.lfda(Y = Y, subject.index = id,  
##D                        visit.index = visit.index, obsT = visit.time, 
##D                        LongiModel.method = 'lme',
##D                        mFPCA.pve = 0.95)
##D plot_shiny(lfpca.dti1)
##D 
##D lfpca.dti2 <- fpca.lfda(Y = Y, subject.index = id,  
##D                        visit.index = visit.index, obsT = visit.time, 
##D                        LongiModel.method = 'fpca.sc',
##D                        mFPCA.pve = 0.80, sFPCA.pve = 0.80)
##D plot_shiny(lfpca.dti2)
##D 
##D 
## End(Not run)




