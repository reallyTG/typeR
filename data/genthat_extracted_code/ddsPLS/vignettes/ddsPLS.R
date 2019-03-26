## ----eval=F--------------------------------------------------------------
#  n_lambda <- 20

## ----eval=F--------------------------------------------------------------
#  NCORES <- 7

## ---- fig.show='hold',message=FALSE--------------------------------------
library(ddsPLS)

## ---- fig.show='hold',message=FALSE,eval=F-------------------------------
#  library(doParallel)
#  library(RColorBrewer)
#  data("liver.toxicity")
#  X <- scale(liver.toxicity$gene)
#  Y <- scale(liver.toxicity$clinic)
#  mddsPLS_model_reg <- mddsPLS(Xs = X,Y = Y,lambda=0.9,R = 1,
#                               mode = "reg",verbose = TRUE)

## ----fig.width=12, fig.height=10,message=FALSE,eval=F--------------------
#  res_cv_reg <- perf_mddsPLS(Xs = X,Y = Y,
#                             R = 1,lambda_min=0.7,n_lambda=n_lambda,
#                             mode = "reg",NCORES = NCORES,kfolds = "loo")
#  plot(res_cv_reg,legend_names=colnames(Y))

## ---- fig.show='hold',fig.width=7, fig.height=5,message=FALSE,eval=T-----
data("penicilliumYES")
X <- penicilliumYES$X
X <- scale(X[,which(apply(X,2,sd)>0)])
classes <- c("Melanoconidium","Polonicum","Venetum")
Y <- as.factor(unlist(lapply(classes,
                             function(tt){rep(tt,12)})))
mddsPLS_model_class <- mddsPLS(Xs = X,Y = Y,lambda = 0.956,R = 2,
                               mode = "clas",verbose = TRUE)

## ---- fig.show='hold',fig.width=7, fig.height=5,message=FALSE,eval=T-----
plot(mddsPLS_model_class$mod$t,col=Y,pch=as.numeric(Y)+15,cex=2,
     xlab="1st X component, 2 var. selected",
     ylab="2nd X component, 2 var. selected")
legend(-2,0,legend=classes,col=1:3,pch=15+(1:3),box.lty=0,y.intersp=2)

## ----fig.width=7, fig.height=6,message=FALSE,eval=F----------------------
#  res_cv_class <- perf_mddsPLS(X,Y,R = 2,lambda_min=0.92,n_lambda=n_lambda,
#                               mode = "clas",NCORES = NCORES,
#                               fold_fixed = rep(1:12,3))
#  plot(res_cv_class,legend_names = levels(Y),pos_legend="bottomleft")

## ----fig.width=7, fig.height=6,message=FALSE,eval=F----------------------
#  n <- 20 # number of individuals
#  R <- 5 # number of created dimensions in __L__
#  T_ <- 10 # number of blocks
#  sd_error <- 0.1 # Standard-deviation of the spike-covariance model element matrices of $E_t$ and $E_y$
#  p_s <- sample(x = 100:200,size = T_,replace = T) # number of variables per block $X_t$
#  q <- 10  # number of variable in $Y$
#  R_real <- 3 # number of components of __L__ described in __Y__
#  p_missing <- 0.3 # the proportion of missing values

## ----fig.width=7, fig.height=6,message=FALSE,eval=F----------------------
#  o_x <- seq(0,1,length.out = 1000)
#  o_y <- (o_x-0.5)^2
#  o_y[which(o_y<0.2)] <- 0 # keep only low or high potential diagonal elements
#  all_omegas <- sample(o_x,prob = o_y,size = R*T_) # Select R*T_ elements
#  
#  all_omegas_y <- sample(o_x,prob = o_y,size = R_real) # Select R_real elements
#  Omegas_y <- diag(c(all_omegas_y,rep(0,R-R_real))) # Create the Omega_y diagonal matrix

## ----message=FALSE,eval=F------------------------------------------------
#  Xs <- list()
#  L <- matrix(rnorm(n*R),nrow = n)
#  for(k in 1:T_){
#      Omegas <- diag(all_omegas[1:R+(k-1)*R])
#      Us <- svd(matrix(rnorm(p_s[k]*n),nrow = n))$v[,1:R]
#      E_k <- matrix(rnorm(n*p_s[k],sd = sd_error),nrow = n)
#      Xs[[k]]<- scale(E_k + tcrossprod(L%*%Omegas,Us))
#  }

## ----message=FALSE,eval=F------------------------------------------------
#  values <- expand.grid(1:n,1:T_)
#  values_id <- 1:(n*T_)
#  probas <- rep(1,n*T_)/(n*T_)
#  number_miss_samp <- floor(n*T_*p_missing)
#  missin_samp <- matrix(NA,nrow = number_miss_samp,ncol = 2)
#  for(sam in 1:number_miss_samp){
#    curr_id <- values_id[sample(values_id,size = 1,prob = probas)]
#    missin_samp[sam,1] <- values[curr_id,1]
#    missin_samp[sam,2] <- values[curr_id,2]
#    probas[curr_id] <- 0
#    if(length(which(na.omit(missin_samp[,1])==missin_samp[sam,1]))==n){
#      probas[which(values[,1]==missin_samp[sam,1])] <- 0
#    }
#    Xs[[missin_samp[sam,2]]][missin_samp[sam,1],] <- NA ## Remove individual value
#  }
#  

## ----message=FALSE,eval=F------------------------------------------------
#  V <- svd(matrix(rnorm(q*n),nrow = n))$v[,1:R]
#  E_y <- matrix(rnorm(q*n,sd = sd_error),nrow = n)
#  Y <- tcrossprod(L%*%Omegas_y,V)
#  Y <- scale(E_y + Y)

## ----message=FALSE,fig.width=7, fig.height=10,eval=F---------------------
#  cross_valid <- perf_mddsPLS(Xs,Y,n_lambda = n_lambda,
#                              R = 3,kfolds = "loo",NCORES = NCORES)
#  plot(cross_valid,plot_mean = T)

