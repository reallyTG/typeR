## ---- eval=FALSE---------------------------------------------------------
#  library(CISE)
#  data(A)
#  data(VSPLOT)

## ---- eval = FALSE-------------------------------------------------------
#  
#  n = length(VSPLOT)
#  y = numeric(n)
#  y[VSPLOT=="high"] = 1
#  zero_id = which(y==0)
#  one_id = which(y==1)
#  
#  max_K = 7
#  acc_MGRAF2 = matrix(0,nr=max_K,nc=2) # store mean and sd of CV accuracies
#  
#  for(K in 1:max_K){
#    #print(paste("K=",K))
#    res = MGRAF2(A = A, K=K, tol=0.01, maxit=5)
#    Q_best = res$Q
#    Lambda_best = res$Lambda
#  
#    ## do 10-fold cross validation and repeat 10 times
#    nfd = 10 # number of folds
#    rep = 30
#  
#    acc = numeric(nfd*rep) # store accuracy
#  
#    set.seed(22)
#  
#    for(t in 1:rep){
#      foldid = sample(1:nfd, size=n, replace=T)
#  
#      for(fd in 1:nfd){
#        test_id = which(foldid==fd)
#        train_zero_id = setdiff(zero_id, test_id)
#        train_one_id = setdiff(one_id, test_id)
#  
#        pred = sapply(test_id, function(i){
#  
#          ave_dist_zero = mean( sapply(train_zero_id, function(j){
#            M = crossprod(Q_best[,,j], Q_best[,,i]) # KxK
#            temp = 0
#            for(k in 1:K){
#              temp = temp + Lambda_best[k] * sum(M[k,] * Lambda_best * M[k,])
#            }
#            dist =  sqrt( 2 * sum(Lambda_best^2) - 2 * temp )
#          }) )
#  
#          ave_dist_one = mean( sapply(train_one_id, function(j){
#            M = crossprod(Q_best[,,j], Q_best[,,i]) # KxK
#            temp = 0
#            for(k in 1:K){
#              temp = temp + Lambda_best[k] * sum(M[k,] * Lambda_best * M[k,])
#            }
#            dist = sqrt( 2 * sum(Lambda_best^2) - 2 * temp )
#          }) )
#  
#          if (ave_dist_zero < ave_dist_one){
#            return(0)
#          }else{
#            return(1)
#          }
#        })
#  
#        acc[nfd*(t-1)+fd] = sum(pred == y[test_id])/length(pred)
#        #print(fd)
#      }
#      #print(t)
#    }
#    acc_MGRAF2[K,1] = mean(acc)
#    acc_MGRAF2[K,2] = sd(acc)
#  }

## ---- echo=FALSE---------------------------------------------------------
load("ExmData.RData")

## ---- results='asis'-----------------------------------------------------
library(knitr)
acc_data = data.frame(K=1:max_K, mean = acc_MGRAF2[ ,1], sd = acc_MGRAF2[ ,2])
kable(acc_data, digits = 3)

