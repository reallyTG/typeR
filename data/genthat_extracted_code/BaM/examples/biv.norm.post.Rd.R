library(BaM)


### Name: biv.norm.post
### Title: biv.norm.post
### Aliases: biv.norm.post

### ** Examples


 rwishart <- function(df, p = nrow(SqrtSigma), SqrtSigma = diag(p))  { 
 if((Ident <- missing(SqrtSigma)) && missing(p)) stop("either p or SqrtSigma must be specified") 
 Z <- matrix(0, p, p) 
 diag(Z) <- sqrt(rchisq(p, df:(df-p+1))) 
 if(p > 1) { 
   pseq <- 1:(p-1) 
   Z[rep(p*pseq, pseq) + unlist(lapply(pseq, seq))] <- rnorm(p*(p-1)/2) 
 } 
 if(Ident) crossprod(Z) 
 else crossprod(Z %*% SqrtSigma)
 }
  
  data.n10 <- rmultinorm(10, c(1,3), matrix(c(1.0,0.7,0.7,3.0),2,2))
  rep.mat <- NULL; reps <- 1000
  for (i in 1:reps){
    rep.mat <- rbind(rep.mat, biv.norm.post(data.n10,3, matrix(c(10,5,5,10),2,2),c(2,2)))
  }
  round(normal.posterior.summary(rep.mat),3)
    



