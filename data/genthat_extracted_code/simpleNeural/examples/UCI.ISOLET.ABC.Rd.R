library(simpleNeural)


### Name: UCI.ISOLET.ABC
### Title: ISOLET Data Set (ABC)
### Aliases: UCI.ISOLET.ABC
### Keywords: datasets

### ** Examples

# NB: 50 iterations isn't enough in this case,
# it was chosen so that the example runs fast enough on CRAN check farm
data(UCI.ISOLET.ABC);
X=as.matrix(sN.normalizeDF(as.data.frame(UCI.ISOLET.ABC[,1:617])));
y=as.matrix(UCI.ISOLET.ABC[,618]-1);
myMLP=sN.MLPtrain(X=X,y=y,hidden_layer_size=20,it=50,lambda=0.5,alpha=0.5);
myPrediction=sN.MLPpredict(nnModel=myMLP,X=X,raw=FALSE);
table(y,myPrediction);



