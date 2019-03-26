#Auxiliary functions and libraries
#Udated June 2015

library(lars)
library(robustbase)

#Factor that corrects lambda to match RR-LS with -SE
#It is estimated numerically based on (known?) ratios of scale^2/E(r^2) for r~N(mu,sig^2) and different values of mu, sig, and b
#   where scale is the robust bisquare scale, and b is its BDP

facon<-function(delta){
  23.9716-73.4391*delta+64.9480*delta^2
}

#Function to augment X and Y and obtain EN-LS using LARS-LASSO
#Note1: in a LASSO problem, we can not estimate the intercept using a column of 1s as the new coefficient will be penalized!
#Comparing lars vs glmnet, it seems that glmnet is computing the naive EN.
#Note2: Zou and Hastie divide X by a factor of sqrt(1+lambda2). This is to maintain an X with norm 1, but it is not really needed
#Note3: in glmnet the L2-penalty receives a different weight that the L1-penalty, i.e., P=((1-alpha)/2)*L2+alpha*L1
#   Our estimating functions use lambda1-lambda2 parametrization. These functions are called from
#   an alpha-lambda parametrization and changed internally to lambda1-lambda2. The conversion is done
#   according to P

#Note4: this function minimizes L= RSS +lambda1*L1(beta)+lambda2*L2(beta) using LASSO on extended variables
#Note5: this function is not the same one that we need in PENSE, as in that case we are solving a different extended problem.

regrid.en<-function(X,y,lambda1,lambda2){
  if (is.null(dim(X))) {
      dim(X) <- c(1L, length(X))
  }

  n<-dim(X)[1]
  p<-dim(X)[2]

  #Center data first
  Xc <- scale(X, scale = FALSE)

  #Augmented dataset
  Xext<-sqrt(lambda2)*diag(p)
  Xau<-rbind(Xc,Xext)
#   yc<-scale(y,scale=F)
#   yau<-c(yc,rep(0,p))
  yau<-c(y,rep(0,p))

  #Solve a LASSO for the augmented variables to obtain an EN-beta using LARS algorithm
  #The normalization will be performed before using this function, thus turned off here
  obj.beta <- lars::lars(x=Xau, y=yau, type = "lasso", normalize=FALSE, intercept=FALSE)
  beta <- lars::coef.lars(obj.beta,s=lambda1/2,mode="lambda")
  alpha<-mean(y)-beta%*%apply(X,2,mean)  #Note: no penalization for the intercept

  #Get fitted values
  yhat<-rep(alpha,n)+Xc%*%beta

  #Add column of 1s for future work
  Xau.1<-cbind(c(rep(1,n),rep(0,p)), rbind(X, Xext))

  res<-list(intercept=alpha,beta=beta,Xau=Xau.1,yau=yau, fitted=yhat)
  res
}

#---------------

#Sort and omit repeated (up to eps) values of its argument
#This function will be later used to compare critical values of the objective function

unitol<-function(x,eps=1e-10){
  ord.x<-order(x)
  y<-sort(x)
  diff.y<-diff(y)
  z=y[2:length(x)]
  ii=ord.x[2:length(x)]
  y=c(y[1],z[diff.y>eps]) #ordered and keeping only those that differ more than eps
  ind=c(ord.x[1], ii[diff.y>eps]) #index kept
  res<-list(clean=y,index=ind)
  res
}


#Computes the M-scale
scale1 <- function(u, b=0.5, cc=1.54764, initial.sc=median(abs(u))/.6745,
                   max.it=200, eps = 1e-8) {
  sc <- initial.sc
  i <- 0
  err <- 1 + eps
  while( ( (i <- i+1) < max.it ) && (err > eps) ) {
    sc2 <- sqrt( sc^2 * mean( Rho( u / sc, cc ) ) / b   )
    err <- abs(sc2/sc - 1)
    sc <- sc2
  }
  return(sc)
}

#Tukey's Rho function
Rho <- function(r, tuning.rho=1.54764) robustbase::Mchi(x=r, cc=tuning.rho, deriv=0, psi='bisquare')
Rhop <- function(r, tuning.rho=1.54764) robustbase::Mchi(x=r, cc=tuning.rho, deriv=1, psi='bisquare')

#Computes the norm2 of a vector
mynorm <- function(x) sqrt(sum(x^2))

#----------------------------------------------------
#Principal Sensitivity Components
# defined in Pena & Yohai (JASA 94, 434-445, 1999)

princSens<-function(X,y,lambda1,lambda2){
  n<-length(y)
  p<-ncol(X)

  en.all<-regrid.en(X,y,lambda1,lambda2)
  beta.all<-c(en.all$intercept,en.all$beta)
  yhat.all<-en.all$fitted

  #------------------------
  #OLS
  #   beta.all<-coef(lm(y~X))
  #   yhat.all<-cbind(1,X)%*%beta.all
  #------------------------

  #Option a:

  # Sensitiviness to the i_th observation
  # compute coefficients (beta.i) and predicted responses (yhat.R) when the i_th observation is removed
  # adjust the lambdas for the case of (n-1) observation

  beta.i<-matrix(ncol=p+1,nrow=n)
  yhat.R<-matrix(ncol=n,nrow=n)

  for(i in 1:n){
    lam1.i<-lambda1*(n-1)/n
    lam2.i<-lambda2*(n-1)/n
    en.i<-regrid.en(X[-i,],y[-i],lam1.i,lam2.i)
    beta.i[i,]<-c(en.i$intercept,en.i$beta)
    # i_th column of yhat.R are the predicted responses when observation i_th was deleted
    yhat.R[,i]<-rep(en.i$intercept,n)+X%*%en.i$beta

    #    ols.i<-lm(y[-i]~X[-i,])
    #    beta.i[i,]<-coef(ols.i)
    #    yhat.R[,i]<-cbind(1,X)%*%coef(ols.i)
  }

  # R is the matrix of sensitivity vectors (r_i in paper for the LS case, pg 436)
  #   the i_th row of R are the sensitivity of the forecast of the i_th obs when each point is deleted
  #   (i.e., r_ij=yhat_i-yhat_i(j))
  R<-matrix(rep(yhat.all,n),ncol=n)-yhat.R

  # M is defined in equation (8) for the LS case, we need to compute it by hand: sum(r_i*r_i')
  # M=R'R is an nxn matrix

  M<-matrix(0,nrow=n,ncol=n)
  for(i in 1:n){
    ri<-R[i,]
    M<-M+t(t(ri))%*%ri
  }

  # Principal sensitivity components:
  #   z_i: projection of the sensitivity vectors r_i onto the eigenvectors of M (called v, where M=R'R)
  #   thus, z_i are the principal components of the sensitivity vectors r_i (thus the name)
  #   z_i is the i_th row of Z.a
  # For the LS case, and n>p: these components form an orthogonal base of the (p+1)-dimensional
  #   space generated by the columns of (1,X).

  v<-eigen(M)$vectors #columns contain eigenvectors of M
  Z.a<-R%*%v  #Note: each row i of Z is the projection of r_i onto v (the columns of v, v_j, are the eigenvectors of M)
  #                 (i.e., z_ij is the projection of r_i onto v_j)

  # If p<n, the first (p+1)-columns of Z.a form an orthogonal base.

  if(p<n){Z.n<-Z.a[,1:(p+1)]}else{Z.n<-Z.a}

  #-----------------------------------------------------
  # THINK: we need to re-think the effect of penalization and sparse models
  # Note that if there are k estimated betahat's *and* betahat_i's equal to 0, then
  # only (p+1-k) columns of Z.a are different from 0
  # (I need to check the math).
  # This will happen often in the context of penalized estimators (and sparse model)
  # In this cases, Z.a will generate a subspace of dimension < (p+1)
  #   what does this mean in the context of sensitivity components and initial estimators?

  # if p>n? v and Z.a are (nxn) but what is the rank of Z.a?

  # It seems that for both cases, p<n and p>n,
  #   Z.a has min(n,p+1-k) columns different from 0 (see PrincSensSim.R for a sparse case of p>n)
  #
  # for now, I retain Z.a as given for the case of p>n as Z.a has dimension (nxn)

  #-----------------------------------------------------

  # Option b:
  # Calculate the standardized change on the regression parameters when the i_th observation is deleted

  X1<-cbind(1,X)
  svd.X1<-svd(X1)
  A<-svd.X1$u
  B<-svd.X1$v
  S<-diag(svd.X1$d)

  st.fact<-B%*%S%*%t(B) #(X'X)^(1/2)

  # rows of beta.change has the change in the estimated parameters when the i_th observation is deleted
  beta.change<-t(beta.all-t(beta.i))
  # each column of gamma.i is the vector defined in Eq (13)
  #   gamma_i=standardized change on the regression parameters when the i_th observation is deleted
  #   each column captures this change for each observation removed (i.e., gamma.i is a (p+1)xn matrix)
  gamma.i<-st.fact%*%t(beta.change)

  # Q = gamma'gamma
  #   note that this is a (p+1)x(p+1) matrix, so we may want to avoid it if p>>n

  Q<-matrix(0,(p+1),(p+1))

  for(i in 1:n){
    Q.i<-gamma.i[,i]%*%t(gamma.i[,i])
    Q<-Q+Q.i
  }

  # U has the eigenvalues of Q in its columns
  U<-eigen(Q)$vectors

  # Compute X(X'X)^(-1/2) using SVD
  #   for LS, this factor transforms the effects in regression parameters into effects in forecast: st.fact2*gamma_i
  st.fact2<-A%*%t(B)

  # thus, Z.p is the *direction* of forecast change
  # TO DO: look at this matrix for the p>n case
  Z.p<-st.fact2%*%U

  res<-list(zn=Z.n,zp=Z.p)
  res
}

#---------------------------------------------------------
#Computes PY iterative algorithm using EN estimator
#   this function is called by initEst.en. Thus, defaults values are specified there

#clean.method: if the estimated scale is too large and the outliers highly affected the residuals of the good points, it is difficult to flag outliers.
#        Two methods are proposed that can be combined to get good initial estimates:
#       "threshold": observations with residuals above a threshold (C.res, default=2) are deleted in each iteration
#       "proportion": proportion (prop, default=0.4) of observations with largest residuals are deleted in each iteration
# py.nit: number of iterations to obtain clean subsamples in PY algorithm

#psc.method: how the principal sensitivity components are calculated. Options:
#           "rr": it compute the PSC of the RR-LS (default)
#           "Qp": it computes the PSC using the eigenvectors of the pxp matrix Q
#           "Mn": it computes the PSC using the eigenvectors of the nxn matrix M

#Based on simulation results, we will use ENRR with "proportion", prosac=0.8, prop=0.4

#NOTE: contfact was removed from this version

enpy<-function(X,y,lambda1,lambda2,deltaesc,cc.scale,
               psc.method=c("rr","Qp","Mn"),prosac,clean.method=c("threshold","proportion"),
               C.res,prop,py.nit,en.tol){

  #Original data
  X.all<-X
  y.all<-y
  n<-dim(X)[1]
  p<-dim(X)[2]
  n.all<-n

  #Corrects lambda to solve the S-objective criteria with cc=1

  lam0.2<-lambda2*cc.scale^2
  lam0.1<-lambda1*cc.scale^2

  factr<-facon(deltaesc) #corrects lambda to match EN-LS
  lamLS.2<-lam0.2/factr
  lamLS.1<-lam0.1/factr

  #Add iterative steps to ENPY
  critbest<-c()
  betabest<-c()


  for(i in 1:py.nit){

    if(i==1){
      betabest.i<-rep(0,p+1)
    }else{
      betabest.i<-betabest #keep the current est, it may be removed by unitol from the set A
    }

    betakeep<-betabest
    critkeep<-critbest

    ext.model<-regrid.en(X,y,lamLS.1,lamLS.2)
    Xau<-ext.model$Xau
    yau<-ext.model$yau
    betaj<-c(ext.model$intercept,ext.model$beta)
    resau<-yau-Xau%*%betaj

    #Computation of the PSC:

    if(psc.method=="rr"){
      #Singular Value Decomposition to obtain H matrix
      svd.Xau<-svd(Xau)
      A<-svd.Xau$u

      h<-apply(t(A)^2,2,sum) #diagonal of H matrix
      w<-as.vector((resau/(1-h))^2)
      ab<-A%*%t(svd.Xau$v)
      Q<-t(ab)%*%diag(w)%*%ab
      U<-eigen(Q)$vectors
      Z<-ab%*%U #each columns of Z represent the forcast change for each observation in the direction of u_j (col of U)

      #take out the 'added' observations
      Z <- Z[1:n,]
    }

    if(psc.method=="Qp"){
      Z<-princSens(X,y,lamLS.1,lamLS.2)$zp
    }

    if(psc.method=="Mn"){
      Z<-princSens(X,y,lamLS.1,lamLS.2)$zn
    }

    #Compute the M-scale for the EN-LS and value of objective function to be minimized by EN-SE
    sigls<-scale1(resau[1:n],b=deltaesc,cc=1)
    critj<-n*sigls^2+lam0.2*mynorm(betaj[2:(p+1)])^2+lam0.1*sum(abs(betaj[2:(p+1)]))

    critkeep<-c(critkeep,critj)
    betakeep<-cbind(betakeep,betaj)

    #Compute the M-scale of EN-LS when influencial observations are omitted

    #proportion of extreme residuals to omit
    # m<-round(prosac*(n))
    m<-floor(prosac*(n))

    n1<-n-m #new sample size

    #corrects EN-LS lambda to acknowledge new sample size
    lam1<-lamLS.1*n1/n
    lam2<-lamLS.2*n1/n

    Xuno<-cbind(rep(1,n),X)
    #colnames(Xuno)[1]<-"Intercept"  #we may want to add names to X if they are not available

    #For each column of Z, remove the most influencial observations (3 schemes) and obtain an EN-LS (total of 3p scales)
    for(j in 1:ncol(Z)){
      zj<-Z[,j]

      #Remove m observations with the highest forcast change (i.e., m-highest z_ij, order(zj) the sort is increasing)
      X.ord<-X[order(zj),]
      y.ord<-y[order(zj)]

      Xj<-X.ord[1:n1,]
      yj<-y.ord[1:n1]
      regj<-regrid.en(Xj,yj,lam1,lam2)
      betaj<-c(regj$intercept,regj$beta)

      resj<-y-Xuno%*%betaj #residuals of ALL observations using betaj based on clean sample
      sigj<-scale1(resj,b=deltaesc,cc=1)
      critj<-n*sigj^2+lam0.2*mynorm(betaj[2:(p+1)])^2+lam0.1*sum(abs(betaj[2:(p+1)]))
      critkeep<-c(critkeep,critj)
      betakeep<-cbind(betakeep,betaj) #we may want to clean up the colnames??

      #Remove m observations with the lowest forcast change (large negative) (i.e., m-lowest z_ij, order(zj,decreasing=TRUE))
      X.ord<-X[order(zj,decreasing=TRUE),]
      y.ord<-y[order(zj,decreasing=TRUE)]

      Xj<-X.ord[1:n1,]
      yj<-y.ord[1:n1]
      regj<-regrid.en(Xj,yj,lam1,lam2)
      betaj<-c(regj$intercept,regj$beta)

      resj<-y-Xuno%*%betaj #residuals of ALL observations using betaj based on clean sample
      sigj<-scale1(resj,b=deltaesc,cc=1)
      critj<-n*sigj^2+lam0.2*mynorm(betaj[2:(p+1)])^2+lam0.1*sum(abs(betaj[2:(p+1)]))
      critkeep<-c(critkeep,critj)
      betakeep<-cbind(betakeep,betaj)

      #Remove m observations with the highest absolute forcast change (large absolute values)
      X.ord<-X[order(abs(zj)),]
      y.ord<-y[order(abs(zj))]

      Xj<-X.ord[1:n1,]
      yj<-y.ord[1:n1]
      regj<-regrid.en(Xj,yj,lam1,lam2)
      betaj<-c(regj$intercept,regj$beta)

      resj<-y-Xuno%*%betaj #residuals of ALL observations using betaj based on clean sample
      sigj<-scale1(resj,b=deltaesc,cc=1)
      critj<-n*sigj^2+lam0.2*mynorm(betaj[2:(p+1)])^2+lam0.1*sum(abs(betaj[2:(p+1)]))
      critkeep<-c(critkeep,critj)
      betakeep<-cbind(betakeep,betaj)

    } #here we obtain a set A of 3*(p+1)+1 initial estimates

    best.set<-unitol(critkeep)
    #     critkeep<-best.set$clean
    #     ii<-best.set$index
    #     betakeep<-betakeep[,ii] #we need betakeep to be a matrix but this will always be for p>1, or intercept+X
    # outliers.det<-outliers.det[ii]

    #Select the estimate with minimum PENSE objective function
    critbest<-best.set$clean[1]
    betabest<-as.vector(betakeep[,best.set$index[1]])

#     #Remove (almost) equivalent candidates
#     best.set<-unitol(critkeep)
#     critkeep<-best.set$clean
#     ii<-best.set$index
#     betakeep<-betakeep[,ii] #we need betakeep to be a matrix but this will always be for p>1, or intercept+X
#     # outliers.det<-outliers.det[ii]
#
#     #Select the estimate with minimum PENSE objective function
#     critbest<-critkeep[1]
#     betabest<-as.vector(betakeep[,1])

    #Flag observations with large residuals from the original sample
    X1.all<-cbind(rep(1,n.all),X.all)

    res.best<-y.all-X1.all%*%betabest #residuals of ALL observations using betaj based on clean sample
    sig.best<-scale1(res.best,b=deltaesc,cc=1)

  if(clean.method=="threshold"){
    #Identify observations with residuals above a threshold
    index.rm<-which(abs(res.best)>C.res*sig.best)


    #Remove identified outliers
    if(length(index.rm)>0&length(index.rm)<n.all){
    y<-y.all[-index.rm]
    X<-X.all[-index.rm,]
    n<-dim(X)[1]
    }else{
      y<-y.all
      X<-X.all
      n<-dim(X)[1]
    }
  }

  if(clean.method=="proportion"){
    n1<-floor(n.all*prop)
    # n1<-ceiling(n.all*prop)
    index.rm<-order(abs(res.best))[(n.all-n1+1):n.all]

    #Remove identified outliers
    if(length(index.rm)>0&length(index.rm)<n.all){
      y<-y.all[-index.rm]
      X<-X.all[-index.rm,]
      n<-dim(X)[1]
    }else{
      y<-y.all
      X<-X.all
      n<-dim(X)[1]
    }

  }

    #Sample size adjustment of lambdas
    n.adj<-n/n.all
    lam0.2<-n.adj*lambda2*cc.scale^2
    lam0.1<-n.adj*lambda1*cc.scale^2

    lamLS.2<-lam0.2/factr
    lamLS.1<-lam0.1/factr

    #break if convergence was achieved

    ifelse(((mynorm(betabest-betabest.i)/mynorm(betabest.i))<en.tol),break,next)
  } #Iterate py.nit number of times or until convergence
  #Note: it may converge at a bad value if the outliers were never detected
  res=list(objF=critkeep,coeff=betakeep)
  res
}

#----------------------------------------------------------------------------------
#Initial estimator: ENPYit

#------------------
#Main function to compute an initial estimates for PENSE adapting the idea in Penia and Yohai JASA 1999
#The initial estimates are the best EN-LS based on complete and "clean" samples
#Samples are cleaned using different methods based on principal sensitivity components of EN-LS

#NEW: some iterations are incorporated to ENPY algorithm to remove points with large residuals before computing the PSC (py.nit)
#Since these initial candidates are EN-LS, a small number of PENSE iterations (csteps) are added at the end, with tolerance at default
#The criteria for "best" is based on PENSE's objective function


initEst.en <- function(X,y,lambda1,lambda2,deltaesc=0.5,cc.scale=1.54764,psc.method="rr",clean.method="proportion",
                       prop=0.4,C.res=2,py.nit=10,prosac=0.8,en.tol=1e-6,csteps=10,pense.tol=1e-6,nkeep=5){
  #Input:
  # X,y: data assumed normalized
  # lambda1: L1-penalty
  # lambda2: L2-penalty
  # cc.scale: c value for the rho function of the M-scale
  # method.clean: "threshold" deletes points with residuals above a threshold (C*sigma),
  #               "proportion" deletes a proportion of observations with largest residuals
  #               Both can be used by passing both in a vector
  # csteps: number of PENSE iterations run to the initial candidates (default=10, M in Tech Rep)
  # nkeep: number of initial candidates to select (default=5, i.e., J in Tech Rep)

  # deltaesc: delta used by the M-scale
  # psc.method: method to compute the PSC
  #   a) rr: *approximate* the EN's PSC with those of RR-LS (the mathematical derivations used do not hold for EN). Default
  #   b) Qp: compute the PSC from the pxp Q matrix
  #   c) Mn: compute the PSC from the nxn M matrix
  # C.res: constant to compare residuals against scale (PY suggested C=2)
  # py.nit: number of iterations of the ENPY algorithm (R in Tech Rep)
  #  (i.e., cleaning by residuals-->generate candidates using PSC)
  # en.tol: convergence of RRPY, PENSE's tolerance is fixed at default (1e-6)
  # prosac: proportion of observations removed based on the PSC (default is 80%)


  #X needs to be a matrix, we may want to have some formating here
  n<-dim(X)[1]
  p<-dim(X)[2]
  #arg<-list(...)

  #Correct penalty parameters
  lam0.2<-lambda2*cc.scale^2
  lam0.1<-lambda1*cc.scale^2

  #Store results
  betakeep<-c()
  critkeep<-c()


  #Iterative algorithm based on PSC
  # the following loops allow using both methods to clean


  if("threshold"%in%clean.method){
    enpyThr<-enpy(X,y,lambda1,lambda2,deltaesc=deltaesc,cc.scale=cc.scale,
                  psc.method=psc.method,prosac=prosac,clean.method="threshold",
                  C.res=C.res,py.nit=py.nit,en.tol=en.tol)
    critkeep<-c(critkeep,enpyThr$objF)
    betakeep<-cbind(betakeep,enpyThr$coeff)
  }

  if("proportion"%in%clean.method){
    enpyProp<-enpy(X,y,lambda1,lambda2,deltaesc=deltaesc,cc.scale=cc.scale,clean.method="proportion",
                   psc.method=psc.method,prosac=prosac,prop=prop,py.nit=py.nit,en.tol=en.tol)
    critkeep<-c(critkeep,enpyProp$objF)
    betakeep<-cbind(betakeep,enpyProp$coeff)
  }

#After py.nit iterations or convergence, betakeep contains ~3(p+1)+2 candidates (some may be removed if redundant) per method from the last iteration

  crit.nkeep<-c()
  beta.nkeep<-c()
  #For each candidate, a short PENSE is computed.
  #The nkeep estimates with minimum EN criterion will be output as initial estimates of PENSE

  for(k in 1:length(critkeep)){
    alphak<-betakeep[1,k]
    betak<-betakeep[2:(p+1),k]

    en.se<-pen.s.reg(y, X, nit=csteps, lam0.1, lam0.2, alphak, betak,
                     cc.m=1, b=deltaesc,epsilon=pense.tol)


    crit.nkeep<-c(crit.nkeep,en.se$objF)
    beta.nkeep<-cbind(beta.nkeep,c(en.se$intercept[en.se$max.it],en.se$slopes[en.se$max.it,]))
  }

  best.set<-unitol(crit.nkeep) #avoid ties
  crit.nkeep<-best.set$clean
  ii<-best.set$index
  beta.nkeep<-beta.nkeep[,ii] #we need betakeep to be a matrix but this will always be for p>1, or intercept+X

  #keep best nkeep candidates
  nk<-min(nkeep,length(ii))
  critkeep<-crit.nkeep[1:nk]
  betakeep<-beta.nkeep[,1:nk]

  res<-list(initCoef=betakeep,objF=critkeep)
  res
}

#Note: coefficients were not corrected for bias

#-------------------------------------------------------------------
#Drawing initial random samples of size ninit

#Note:
#ns=the size of the elemental set subsamples, lasso can be run with ns=3
#nsamp=number of subsamples of size ns to be evaluated
#nkeep=number of beta to keep after C-steps for a longer PENSE iteration.

initEst.subsamp <- function(X,y,lambda1,lambda2,deltaesc=0.5,cc.scale=1.54764,
                            ns=3,nsamp=500,csteps=5,nkeep=5,pense.tol=1e-6){

  n<-dim(X)[1]
  p<-dim(X)[2]

  #Corrects lambda to solve the S-objective criteria with cc=1
  lam0.2<-lambda2*cc.scale^2
  lam0.1<-lambda1*cc.scale^2

  #Corrects lambda for EN-LS to match EN-SE
  factr<-facon(deltaesc)

  lamLS.1<-lam0.1/factr
  lamLS.2<-lam0.2/factr

  Xuno<-cbind(rep(1,n),X)
  #colnames(Xuno)[1]<-"Intercept"  #we may want to add names to X if they are not available

  critkeep<-c()
  betakeep<-c()

  for(i in 1:nsamp){
    indices <- sample(n,ns)
    xs <- X[indices,]
    ys <- y[indices]

    en.i<-regrid.en(xs,ys,lamLS.1*ns/n,lamLS.2*ns/n)
    alphak<-en.i$intercept
    betak<-en.i$beta

    en.se<-pen.s.reg(y, X, nit=csteps, lam0.1, lam0.2, alphak, betak,
                     cc.m=1, b=deltaesc, epsilon=pense.tol)
    critkeep<-c(critkeep,en.se$objF)
    last<-length(en.se$intercept)
    betakeep<-cbind(betakeep,c(en.se$intercept[last],en.se$slopes[last,]))
  }

  #Remove (almost) equivalent candidates, stay with best m ones

  best.set<-unitol(critkeep)
  critkeep<-best.set$clean
  ii<-best.set$index
  betakeep<-betakeep[,ii] #we need betakeep to be a matrix but this will always be for p>1, or intercept+X

  nkeep<-min(nkeep,length(ii))
  critkeep<-critkeep[1:nkeep]
  betakeep<-betakeep[,1:nkeep]

  res<-list(initCoef=betakeep,objF=critkeep)
  res
}

#================================================
#Authors: Gaby and Matias
#Date: Oct 2013

#Computes PENSE given a pair of lambdas and an initial estimator

#Input
# y,X: data, assumed normalized
# nit: maximum number of iterations
# lambda1, lambda2: L1 and L2 penalty parameter
# alpha1, beta1: initial estimators
# cc.m, b: tuning constants of M-est
# epsilon: tolerance for convergence
# trace: shows the trace of the obj function to be minimized

#Output
# intercept,slopes: PENSE estimator
# resid: residues
# scale: robust M-scale
# max.it: number of iterations performed
# objF: value of the objective function attained

pen.s.reg <- function(y, X, nit, lambda1, lambda2, alpha1, beta1,
                      cc.m=1.54764, b=.5, epsilon=1e-6,trace=F)
{
  p <- ncol(X)
  n <- nrow(X)
  n.star <- n+p

  #Intercept, slopes, and scale
  betahats <- matrix(ncol=p+2,nrow=nit)

  alpha <- alpha1
  beta <- beta1

  r <- as.vector(y-alpha-X%*%beta)
  Sbeta <- scale1(r,cc=cc.m)

  #store initial values in a matrix
  betahats[1,] <- c(alpha1,beta1,Sbeta)

  #Objective function
  obj.func.o <- n*(Sbeta)^2+lambda2*sum(beta^2)+lambda1*sum(abs(beta))
  if(trace==T){print(paste('Our: ', obj.func.o, sep=''))}

  for (i in 2:nit){

    # New beta

    rs <- r / Sbeta
    Wbeta <- Rhop(rs,cc.m) / rs
    taubeta <- n * 2*(Sbeta)^2 / sum( r^2 * Wbeta )
    Wbeta.tilda <- taubeta*Wbeta

    #define weighted-extended variables
    X.star<-rbind(X*sqrt(Wbeta.tilda),sqrt(2*lambda2)*diag(p))
    y.star<-c((y-alpha)*sqrt(Wbeta.tilda) ,rep(0,p))

    #lasso.obj<-sum((y.star-X.star%*%beta)^2)+lambda1*sum(abs(beta))
    #print(paste('LARS: ', lasso.obj, sep=''))

    #Solve a LASSO for the weighted-extended variables to obtain an updated beta using LARS algorithm
    obj.beta <- lars::lars(x=X.star, y=y.star, type = "lasso", normalize=FALSE, intercept=FALSE)
    beta <- lars::coef.lars(obj.beta,s=lambda1,mode="lambda")
    #lar.obj is 1/2*sum((y.star-X.star%*%beta)^2)+lam1*sum(abs(beta))
    #we need to solve: sum((y.star-X.star%*%beta)^2)+2*lambda1*sum(abs(beta)) --> s=lambda1 in coef() call

    # New alpha
    Walpha <-Wbeta/sum(Wbeta)
    alpha <- sum(Walpha*(y-X%*%beta))

    # Update scale
    r <- as.vector(y-alpha-X%*%beta)
    Sbeta <- scale1(r,cc=cc.m)

    #Obj function
    obj.func <- n*(Sbeta)^2+lambda2*sum(beta^2)+lambda1*sum(abs(beta))
    if(trace==T){print(paste('Our: ', obj.func, sep=''))}

    betahats[i,] <- c(alpha,beta,Sbeta)
    ifelse(((mynorm(betahats[i,]-betahats[i-1,])/mynorm(betahats[i-1,]))<epsilon),break,next)
  }
  return(list(intercept=betahats[1:i,1],slopes=betahats[1:i,2:(p+1)], resid=r,
              scale=betahats[1:i,p+2],max.it=i, objF=obj.func))
}

#END
