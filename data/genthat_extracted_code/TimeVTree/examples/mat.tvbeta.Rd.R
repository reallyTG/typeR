library(TimeVTree)


### Name: mat.tvbeta
### Title: Beta coefficient estimate at each time point
### Aliases: mat.tvbeta

### ** Examples

#This function requires output from output.coxphout, prune, and the original data set.
data('alcohol')
require(survival)

coxtree <- coxph.tree(alcohol[,'time'], alcohol[,'event'], 
                      x = alcohol[,'alc', drop = FALSE], D = 4)
nodetree <- output.coxphout(coxtree)

subtrees <- prune(nodetree)

#creating matrix of beta coefficients at each event time point for all subtrees
k <- nrow(subtrees)
for (l in 1:k) {
    print(paste("Tree #",l))
    coeftmp <- mat.tvbeta(l,nodetree,subtrees,alcohol[,'time'], alcohol[,'event'],
                           x = data.frame(model.matrix(~alc, data=alcohol)[,-c(1), drop = FALSE]))
    if (l == 1) coef <- coeftmp
    if (l > 1) coef <- cbind(coef,coeftmp) 
  }


##Creating plot of all subtrees for each predictor:

p <- ncol(coef)/k #Number of variables
x = data.frame(model.matrix(~alc, data=alcohol)[,-c(1), drop = FALSE])
xnames <- xname(x)
xnames <- c('Alcohol 1', 'Alcohol 4')
#Subsetting data
coefnew <- data.frame(coef)
survtime <- alcohol[,'time']
#Setting desired depth (All the subtrees)
kk <- nrow(subtrees)
for (j in 1:p) {
  matplot(survtime,coefnew[,seq(from=j,to=kk*p,by=p)],type="l",lty=1:kk,col= (1:kk)+1
          ,xlab="Survival Time",ylab=" ")
  title(main=paste('all:', xnames[j]))
  legend('bottomleft', legend = paste('tree number', 1:kk), lty=1:kk,col= (1:kk)+1)
  }
  
##Creating a plot showing changes in coefficient of two predictors in full tree
#creating matrix of beta coefficients at each event time point for full tree
coeftmp <- mat.tvbeta(1,nodetree,subtrees,alcohol[,'time'], alcohol[,'event'],
                       x = data.frame(model.matrix(~alc, data=alcohol)[,-c(1), drop = FALSE]))
coefnew <- coeftmp
matplot(survtime,coefnew,type="l",lty=1:2,col= (1:2)+1,xlab="Survival Time",ylab=" ")
legend('bottomleft', legend = c("Alcohol 1", "Alcohol 4"), lty=1:2,col= (1:2)+1)  



