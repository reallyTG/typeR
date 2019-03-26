library(MultivariateRandomForest)


### Name: variable_importance_measure
### Title: Calculates variable Importance of a Regression Tree Model
### Aliases: variable_importance_measure

### ** Examples

library(MultivariateRandomForest)
trainX=matrix(runif(50*100),50,100)
trainY=matrix(runif(50*5),50,5) 
n_tree=2
m_feature=5
min_leaf=5
testX=matrix(runif(10*100),10,100) 

theta <- function(trainX){trainX}
results <- bootstrap::bootstrap(1:nrow(trainX),n_tree,theta) 
b=results$thetastar

Variable_number=ncol(trainY)
if (Variable_number>1){
  Command=2
}else if(Variable_number==1){
  Command=1
} 
NumVariable=ncol(trainX)
NumRepeatation=matrix(rep(0,n_tree*NumVariable),nrow=n_tree)

for (i in 1:n_tree){
  Single_Model=NULL
  X=trainX[ b[ ,i],  ]
  Y=matrix(trainY[ b[ ,i],  ],ncol=Variable_number)
  Inv_Cov_Y = solve(cov(Y)) # calculate the V inverse
  if (Command==1){
    Inv_Cov_Y=matrix(rep(0,4),ncol=2)
  }
  Single_Model=build_single_tree(X, Y, m_feature, min_leaf,Inv_Cov_Y,Command)
  NumRepeatation[i,]=variable_importance_measure(Single_Model,NumVariable)
}



