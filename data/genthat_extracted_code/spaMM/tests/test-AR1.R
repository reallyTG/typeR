cat("\ntest AR1:\n")

if (spaMM.getOption("example_maxtime")>12) { # 
  set.seed(123)
  nobs <- 500
  distm <- as.matrix(dist(1:nobs)) 
  m <- (-0.4)^distm 
  cholm <- t(chol(m))
  eta <- 1+ cholm %*% rnorm(nobs) ## hglm_lambda=1
  obs <- rpois(nobs,exp(eta))
  plot(obs)
  fake <- data.frame(obs=obs,age=1:nobs)
  fitar1 <- corrHLfit(obs ~ 1+AR1(1|age),family=poisson(),data=fake,verbose=c(TRACE=TRUE))
  testthat::expect_equal(logLik(fitar1), c(p_bv=-1269.06022553))
}

## same with nested AR1 within individual
## il faut pas mal de donnees pour estimer ARphi (et le reste) de façon convainquante 

# quick version for routine tests
if (TRUE) {
  set.seed(123)
  age    <-    (rep(c(1:((Nage <- 30))),times=(Nind <- 30)))
  ind    <- 	 rep(c(1:Nind),	 each=(Nage))
  distm <- as.matrix(dist(age)) 
  blocks <- proxy::dist(ind,`==`)
  blocks[blocks==0] <- NA
  distm <- distm * as.matrix(blocks) ## nice hack
  distm[is.na(distm)] <- 1e100 ## temporary hack
  m <- (0.4)^distm  ## intriguingly negative ARphi seems much easier to estimate than positive ones.
  cholm <- t(chol(m))
  eta <- 1+ cholm %*% rnorm(Nage*Nind) ## encore lambda=1
  obs <- rpois(Nind*Nage,exp(eta))
  plot(obs)
  fake <- data.frame(obs=obs,age=age,ind=as.factor(ind+1L), ## as.factor( [all > 1] ) to test the dark side of uniqueGeo
                     idx=seq_len(length(obs)))
  ## the sample() provides a check that permutations of the data have no effect
  spaMM.options(sparse_precision=NULL) ## checks the sparse->non-sparse case
  zut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),],ranFix=list(ARphi=0.7040234,lambda=0.7308))
  spaMM.options(sparse_precision=TRUE)
  rezut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),],ranFix=list(ARphi=0.7040234,lambda=0.7308))
  spaMM.options(sparse_precision=FALSE)
  rerezut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),],ranFix=list(ARphi=0.7040234,lambda=0.7308))
  spaMM.options(sparse_precision=NULL)
  testthat::expect_true(diff(range((c(logLik(zut),logLik(rezut),logLik(rerezut),-47.3130016607291))))<1e-8)
  ## check predict on each fit and subset of (permuted) data:
  p1 <- predict(zut,newdata=rezut$data[rownames(rezut$data)>30,])["39"] 
  p2 <- predict(rezut,newdata=rerezut$data[rownames(rerezut$data)>30,])["39"]
  p3 <- predict(rerezut,newdata=zut$data[rownames(zut$data)>30,])["39"]
  testthat::expect_true(diff(range(c(p1,p2,p3, 2.35717079935)))<1e-10) ## sparse much closer when avoiding Cholesky !
}


if (spaMM.getOption("example_maxtime")>13) {
  set.seed(123)
  age    <-    (rep(c(1:((Nage <- 30))),times=(Nind <- 30)))
  ind    <- 	 rep(c(1:Nind),	 each=(Nage))
  distm <- as.matrix(dist(age)) 
  blocks <- proxy::dist(ind,`==`)
  blocks[blocks==0] <- NA
  distm <- distm * as.matrix(blocks) ## nice hack
  distm[is.na(distm)] <- 1e100 ## temporary hack
  m <- (0.4)^distm  ## intriguingly negative ARphi seems much easier to estimate than positive ones.
  cholm <- t(chol(m))
  eta <- 1+ cholm %*% rnorm(Nage*Nind) ## encore lambda=1
  obs <- rpois(Nind*Nage,exp(eta))
  plot(obs)
  
  fake <- data.frame(obs=obs,age=age,ind=ind,idx=seq_len(length(obs)))
  ## the sample() provides a check that permutations of the data have no effect
  spaMM.options(sparse_precision=NULL) ## checks the sparse->non-sparse case
  zut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),])
  spaMM.options(sparse_precision=TRUE)
  rezut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),])
  spaMM.options(sparse_precision=FALSE)
  rerezut <- corrHLfit(obs ~ 1+AR1(1|idx %in% ind),family=poisson(),data=fake[20+sample(20),])
  spaMM.options(sparse_precision=NULL)
  testthat::expect_true(diff(range((c(logLik(zut),logLik(rezut),logLik(rerezut)))))<1e-8)
  ## full data
  fit_ar1nested <- corrHLfit(obs ~ 1+AR1(1|age %in% ind),family=poisson(),data=fake,verbose=c(TRACE=interactive())) 
  testthat::expect_equal(logLik(fit_ar1nested), c(p_bv=-2295.67792783))
}

if (spaMM.getOption("example_maxtime")>0.5) {
  requireNamespace("nlme")
  data("Orthodont",package = "nlme")
  #checkinput <- fitme(distance ~ age + factor(Sex)+( 1 | Subject)+ AR1(1|age %in% Subject), fixed=list(phi=1e-6),
  #      data = Orthodont,verbose=c(TRACE=interactive()),method="REML")  ## 1.5s
  checkinput <- corrHLfit(distance ~ age + factor(Sex)+( 1 | Subject)+ AR1(1|age %in% Subject), ranFix=list(phi=1e-6),
                          data = Orthodont,verbose=c(TRACE=interactive()),HLmethod="REML")
  testthat::expect_equal(logLik(checkinput), c(p_bv=-218.69839984))
  # consistent with 
  # lme(distance ~ age + factor(Sex),random = ~ 1 | Subject, cor=corCAR1(form=~age|Subject),data = Orthodont)
  # which is faster (FIXME: LMM-specific code?)
}