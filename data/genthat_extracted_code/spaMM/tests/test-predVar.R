cat("\ntest of prediction variance:")

## two ranefs with estimated lambdas:
data("blackcap")
set.seed(123)
somegrp <- cbind(blackcap,grp=sample(2,14,replace=TRUE))
#somegrp <- cbind(blackcap,grp=c(rep(1,7),rep(2,7))) ## to test cov mat with nonzero var of grp effect
tworanefs <- corrHLfit(migStatus ~ 1 +  (1|grp) +Matern(1|latitude+longitude),data=somegrp,
                       ranFix=list(nu=4,rho=0.4,phi=0.05))
expected <- c("Gibraltar"=0.04880579, "CapeVerde"=0.04884620, "SouthernFrance"=0.04197530, 
              "LaPalma"=0.03337928, "Madeira"=0.04360190)
p1 <- get_predVar(tworanefs)[1:5]
testthat::expect_true(diff(range(p1 -expected))<1e-8)
p1 <- get_predVar(tworanefs,newdata=somegrp[1:5,])
testthat::expect_true(diff(range(p1 -expected))<1e-8)
ranefstwo <- corrHLfit(migStatus ~ 1  +Matern(1|latitude+longitude)+  (1|grp),data=somegrp,
                       ranFix=list(nu=4,rho=0.4,phi=0.05))
p2 <- get_predVar(ranefstwo,newdata=somegrp[1:5,])
testthat::expect_true(diff(range(p1-p2))<1e-10)

twolambda <- corrHLfit(migStatus ~ 1 +  Matern(1|latitude+longitude) +Matern(1|latitude+longitude),data=blackcap,
                       ranFix=list(corrPars=list("1"=list(nu=4,rho=0.4),"2"=list(nu=4,rho=0.4)),phi=0.05))
## but in that case the exact loglamInfo is exactly singular! 
## (this makes sense: ones cannot separately estimate the two lambda's)
## any attempt at computing a non-singular loglamInfo will amplify floating point error.
onelambda <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude),data=blackcap,
                       ranFix=list(nu=4,rho=0.4,phi=0.05))
testthat::expect_true(diff(range(get_predVar(twolambda)[1:5]-get_predVar(onelambda)[1:5]))<1e-7)

# examples from Booth & Hobert 1998 JASA

npos <- c(11,16,14,2,6,1,1,4,10,22,7,1,0,0,1,6)
ntot <- c(36,20,19,16,17,11,5,6,37,32,19,17,12,10,9,7)
treatment <- c(rep(1,8),rep(0,8))
clinic <-c(seq(8),seq(8))
clinics <- data.frame(npos=npos,nneg=ntot-npos,treatment=treatment,clinic=clinic)
fitobject <- HLfit(cbind(npos,nneg)~treatment+(1|clinic),family=binomial(),data=clinics,HLmethod="ML")
res <- sqrt(get_predVar(fitobject))
# res: cf row 2, table 6; some discrepancies (surely stemming from point estimates).
testthat::expect_equal(res[6],c("6"=0.7316108),tolerance=2e-4)

res <- get_respVar(fitobject,variances=list(cov=TRUE))
testthat::expect( !is.null(dim(res)),"is.null(dim(<get_respVar(fitobject,variances=list(cov=TRUE))>))") ## check that a matrix is returned
testthat::expect_equal(res[6,6],0.1061096,tolerance=2e-4) ## check that dmudeta scaling is taken in account.

if(requireNamespace("rsae", quietly = TRUE)) {
  data("landsat", package = "rsae")
  fitobject <- HLfit(HACorn ~ PixelsCorn + PixelsSoybeans + (1|CountyName),data=landsat[-33,],HLmethod="ML")
  newXandZ <- unique(data.frame(PixelsCorn=landsat$MeanPixelsCorn,PixelsSoybeans=landsat$MeanPixelsSoybeans,CountyName=landsat$CountyName))
  res <- get_predVar(fitobject,newdata=newXandZ)
  testthat::expect_equal(res[12],c("32"=27.80684),tolerance=2e-4)
  res <- get_predVar(fitobject,newdata=newXandZ,variances=list(disp=FALSE)) ## sum of cols nu and beta in Table 7
  testthat::expect_equal(res[12],c("32"=26.56215),tolerance=2e-4)
  
  ## comparison dense vs. spprec with use_spprec_qr on an REML non-spatial fit 
  # (bc spprec does not handle Matern and use_spprec_qr affects only REML)
  oldop <- spaMM.options(sparse_precision=FALSE)
  fitdense <- HLfit(HACorn ~ PixelsCorn + PixelsSoybeans + (1|CountyName),data=landsat[-33,],HLmethod="REML")
  spaMM.options(sparse_precision=TRUE)
  oldop2 <- spaMM.options(use_spprec_QR=TRUE)
  # trace(spaMM:::.calc_spprec_hatval_ZX_by_QR,tracer=quote(print(".calc_spprec_hatval_ZX_by_QR")))
  # trace(spaMM:::.calc_Md2hdvb2_info_spprec_by_QR,tracer=quote(print(".calc_Md2hdvb2_info_spprec_by_QR")))
  fitsparse <- HLfit(HACorn ~ PixelsCorn + PixelsSoybeans + (1|CountyName),data=landsat[-33,],HLmethod="REML")
  spaMM.options(oldop); spaMM.options(oldop2)
  testthat::expect_true(diff(range(get_predVar(fitdense,newdata=newXandZ)-get_predVar(fitsparse,newdata=newXandZ)))<1e-8)
  testthat::expect_true(diff(range(get_predVar(fitdense,newdata=newXandZ,variances=list(disp=FALSE)) - 
                                   get_predVar(fitsparse,newdata=newXandZ,variances=list(disp=FALSE))))<1e-8)
} else {
  cat( "package 'rsae' not available, cannot run prediction variance test.\n" )
}

# simple LM
set.seed(123)
n <- 100
k <- rep(1:(n/10), each=10)
data.test <- data.frame(y=rnorm(n, mean=k), x=factor(k))
hlfit <- HLfit(y ~ x, data=data.test)
p <- predict(hlfit, newdata=data.frame(x=unique(data.test$x)), variances=list(respVar=TRUE))
testthat::expect_equal(length(attr(p, "residVar")),10L)
testthat::expect_equal(attr(p, "residVar")[1],c(`1`=0.8347247),tolerance=1e-6)
testthat::expect_equal(attr(p, "predVar")[1],c(`1`=0.08347247),tolerance=1e-6)
testthat::expect_equal(attr(p, "respVar")[1],c(`1`=0.918197),tolerance=1e-6)
## also tests that a single level of the factor in the newdata is not a problem
pp <- predict(hlfit, newdata=data.test[1,], variances=list(respVar=TRUE))
testthat::expect_equal(pp[1],c(`1`=1.074626),tolerance=1e-6)

## multiple tests with two ranefs 
set.seed(123)
data("Loaloa")
ll <- cbind(Loaloa,idx=sample(2,size=nrow(Loaloa),replace=TRUE))
hl <- HLCor(cbind(npos,ntot-npos)~1+Matern(1|longitude+latitude)+(1|idx),data=ll,
            family=binomial(),ranPars=list(nu=0.5,rho=1/0.7),HLmethod="PQL/L")
# verif single point input
p1 <- predict(hl,variances=list(respVar=TRUE))
p2 <- predict(hl,newdata=ll[1,],variances=list(respVar=TRUE))
testthat::expect_equal(attr(p1,"respVar")[1],attr(p2,"respVar")[1])
testthat::expect_equal(p1[1],p2[1])
# verif 'slice' mechanism including Evar (hence new levels of ranef) 
lll <- ll
lll$idx <- lll$idx+1
lll$latitude <- lll$latitude+1
p4 <- predict(hl,newdata=lll[1:101,],variances=list(respVar=TRUE))
p5 <- predict(hl,newdata=lll[101:102,],variances=list(respVar=TRUE))
testthat::expect_equal(attr(p4,"respVar")[101],attr(p5,"respVar")[1])
testthat::expect_equivalent(p4[101],p5[1]) ## _equivalent does not check names and other attributes

## dontrun example from help(predict):
## prediction with distinct given phi's in different locations:
data("blackcap")
set.seed(123)
varphi <- cbind(blackcap,logphi=runif(14))
vphifit <- corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude), 
                     resid.model = list(formula=~0+offset(logphi)),
                     data=varphi,  ranFix=list(nu=4,rho=0.4))
# eg  to catch catch problems with wrong application of a-la-Bates formula:
testthat::expect_equal(logLik(vphifit),c(p_bv=-20.04856),tol=1e-5) 
p1 <- suppressWarnings(get_respVar(vphifit,newdata=data.frame(latitude=1,longitude=1,logphi=1)))
testthat::expect_equal(p1,c(`1`=2.844421),tol=1e-5)
# for predVar computation, phi is not needed 
#     (and could have been specified through ranFix):  
p1 <- suppressWarnings(get_predVar(vphifit,newdata=data.frame(latitude=1,longitude=1)))
testthat::expect_equal(p1,c(`1`=0.1261386),tol=1e-5) ## exact value sensitive to spaMM_tol$Xtol_abs
# verif get_predCov_var_fix()
p1 <- get_predVar(vphifit,variances=list(cov=TRUE))[14,]
fix_X_ZAC.object <- preprocess_fix_corr(vphifit,fixdata=blackcap)
p2 <- get_predCov_var_fix(vphifit,newdata=blackcap[14,],fix_X_ZAC.object=fix_X_ZAC.object)
testthat::expect_true(max(abs(range(p1-p2)))<1e-12)

# # verif calc_logdisp_cov runs after outer optimisation => now tested in many other places
# fitfit <- fitme(migStatus ~ 1 + Matern(1|latitude+longitude),
#                      data=blackcap,  fixed=list(nu=4,rho=0.4))
# get_respVar(fitfit,newdata=data.frame(latitude=1,longitude=1))

# check corret handling of offset in predictions
check_off <- cbind(blackcap,off=runif(14))
voff <- corrHLfit(migStatus ~ 1 + offset(off) + Matern(1|latitude+longitude), 
                  data=check_off,  ranFix=list(nu=4,rho=0.4))
p1 <- predict(voff)
p2 <- predict(voff, newdata=check_off)
testthat::expect_true(max(abs(range(p1-p2)))<1e-12)
#
voff <- corrHLfit(migStatus ~ 0 + offset(off) + Matern(1|latitude+longitude), 
                  data=check_off,  ranFix=list(nu=4,rho=0.4))
p1 <- predict(voff)
p2 <- predict(voff, newdata=check_off)
testthat::expect_true(max(abs(range(p1-p2)))<1e-12)
#
voff <- corrHLfit(migStatus ~ offset(off) + Matern(1|latitude+longitude), 
                  data=check_off,  ranFix=list(nu=4,rho=0.4))
p3 <- predict(voff)
p4 <- predict(voff, newdata=check_off)
testthat::expect_true(max(abs(range(p3-p4)))<1e-12)
testthat::expect_true(max(abs(range(p1-p4)))<1e-12)