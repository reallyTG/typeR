library(DTRlearn)


### Name: predict.rbfcl
### Title: Predict
### Aliases: predict.rbfcl

### ** Examples

n_cluster=5
pinfo=10
pnoise=10
n=50
m=20
example1=make_classification(n_cluster,pinfo,pnoise,n)
test=make_classification(n_cluster,pinfo,pnoise,m,example1$centroids)
model1=Olearning_Single(example1$X,example1$A,example1$R)
Atp=predict(model1,test$X)
V1=mean(test$R[Atp==test$A])

model2=wsvm(example1$X,example1$A,example1$R,'rbf',0.05)
model2=Olearning_Single(example1$X,example1$A,example1$R,kernel='rbf',m=3)
Atp=predict(model2,test$X)



