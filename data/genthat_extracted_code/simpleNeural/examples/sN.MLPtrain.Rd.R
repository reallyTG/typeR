library(simpleNeural)


### Name: sN.MLPtrain
### Title: Trains a multilayer perceptron with 1 hidden layer
### Aliases: sN.MLPtrain

### ** Examples

# NB: the provided examples are just here to help use the package's functions.
# In real use cases you should perform a proper validation (cross-validation,
# external validation data...)
data(UCI.BCD.Wisconsin);
X=as.matrix(sN.normalizeDF(as.data.frame(UCI.BCD.Wisconsin[,3:32])));
y=as.matrix(UCI.BCD.Wisconsin[,2]);
myMLP=sN.MLPtrain(X=X,y=y,hidden_layer_size=20,it=50,lambda=0.5,alpha=0.5);
myPrediction=sN.MLPpredict(nnModel=myMLP,X=X,raw=TRUE);
#library('verification');
#roc.area(y,myPrediction[,2]);



