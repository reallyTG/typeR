library(simpleNeural)


### Name: sN.MLPpredict
### Title: Runs a multilayer perceptron
### Aliases: sN.MLPpredict

### ** Examples

data(UCI.transfusion);
X=as.matrix(sN.normalizeDF(as.data.frame(UCI.transfusion[,1:4])));
y=as.matrix(UCI.transfusion[,5]);
myMLP=sN.MLPtrain(X=X,y=y,hidden_layer_size=4,it=50,lambda=0.5,alpha=0.5);
myPrediction=sN.MLPpredict(nnModel=myMLP,X=X,raw=TRUE);
#library('verification');
#roc.area(y,myPrediction[,2]);



