library(DTRlearn)


### Name: make_classification
### Title: Data Simulation for single stage
### Aliases: make_classification

### ** Examples

n_cluster=10
pinfo=10
pnoise=20
example1=make_classification(n_cluster,pinfo,pnoise,100)
test=make_classification(n_cluster,pinfo,pnoise,100,example1$centroids)
model1=Olearning_Single(example1$X,example1$A,example1$R)
Atp=predict(model1,test$X)
V1=mean(test$R[Atp==test$A])

model2=wsvm(example1$X,example1$A,example1$R,'rbf',0.05)
Atp=predict(model2,test$X)
V2=mean(test$R[Atp==test$A])
#in this very non-linear case, one can compare V1 with V2 (the empirical value on testing set),
#and can see the better of model2 using rbf kernel
#to model1 using linear kernel. 
#the true optimal value here is 1.5



