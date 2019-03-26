library(qgraph)


### Name: qgraph.cfa
### Title: CFA using Structural Equation Modelling
### Aliases: qgraph.cfa
### Keywords: qgraph sem cfa

### ** Examples

## Not run: 
##D # Simulate dataset:
##D set.seed(2)
##D eta<-matrix(rnorm(200*5),ncol=5)
##D lam<-matrix(rnorm(50*5,0,0.15),50,5)
##D lam[apply(diag(5)==1,1,rep,each=10)]<-rnorm(50,0.7,0.3)
##D th<-matrix(rnorm(200*50),ncol=50)
##D Y<-eta%*%t(lam)+th
##D 
##D # Create groupslist
##D gr<-list(1:10,11:20,21:30,31:40,41:50)
##D 
##D # Using "lavaan" package:
##D res <- qgraph.cfa(cov(Y),N=200,groups=gr,pkg="lavaan",vsize.man=2,vsize.lat=10)
##D 
##D qgraph.lavaan(res,filename="lavaan",legend=FALSE,groups=gr,edge.label.cex=0.6)
##D 
##D # Using "sem" package:
##D res <- qgraph.cfa(cov(Y),N=200,groups=gr,pkg="sem",vsize.man=2,vsize.lat=10,fun=qgraph.loadings)
##D 
##D qgraph.semModel(res,edge.label.cex=0.6)
##D 
##D qgraph(res,edge.label.cex=0.6)
##D 
##D qgraph.sem(res,filename="sem",legend=FALSE,groups=gr,edge.label.cex=0.6)
##D 
##D ### Big 5 dataset ###
##D data(big5)
##D data(big5groups)
##D 
##D fit <- qgraph.cfa(cov(big5),nrow(big5),big5groups,pkg="lavaan",opts=list(se="none"),
##D 	vsize.man=1,vsize.lat=6,edge.label.cex=0.5)
##D print(fit)
## End(Not run)



