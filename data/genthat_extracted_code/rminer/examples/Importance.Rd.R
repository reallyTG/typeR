library(rminer)


### Name: Importance
### Title: Measure input importance (including sensitivity analysis) given
###   a supervised data mining model.
### Aliases: Importance
### Keywords: classif neural

### ** Examples
 
### dontrun is used when the execution of the example requires some computational effort.

### 1st example, regression, 1-D sensitivity analysis
## Not run: 
##D data(sa_ssin) # x1 should account for 55##D 
##D M=fit(y~.,sa_ssin,model="ksvm")
##D I=Importance(M,sa_ssin,method="1D-SA") # 1-D SA, AAD
##D print(round(I$imp,digits=2))
##D 
##D L=list(runs=1,sen=t(I$imp),sresponses=I$sresponses)
##D mgraph(L,graph="IMP",leg=names(sa_ssin),col="gray",Grid=10)
##D mgraph(L,graph="VEC",xval=1,Grid=10,data=sa_ssin,
##D    main="VEC curve for x1 influence on y") # or:
##D vecplot(I,xval=1,Grid=10,data=sa_ssin,datacol="gray",
##D    main="VEC curve for x1 influence on y") # same graph
##D vecplot(I,xval=c(1,2,3),pch=c(1,2,3),Grid=10,
##D leg=list(pos="bottomright",leg=c("x1","x2","x3"))) # all x1, x2 and x3 VEC curves
## End(Not run)

### 2nd example, regression, DSA sensitivity analysis:
## Not run: 
##D I2=Importance(M,sa_ssin,method="DSA")
##D print(I2)
##D # influence of x1 and x2 over y
##D vecplot(I2,graph="VEC",xval=1) # VEC curve
##D vecplot(I2,graph="VECB",xval=1) # VEC curve with boxplots
##D vecplot(I2,graph="VEC3",xval=c(1,2)) # VEC surface
##D vecplot(I2,graph="VECC",xval=c(1,2)) # VEC contour
## End(Not run)

### 3th example, classification (pure class labels, task="cla"), DSA:
## Not run: 
##D data(sa_int2_3c) # pair (x1,x2) is more relevant than x3, all x1,x2,x3 affect y, 
##D                  # x4 has a null effect.
##D M2=fit(y~.,sa_int2_3c,model="mlpe",task="class")
##D I4=Importance(M2,sa_int2_3c,method="DSA")
##D # VEC curve (should present a kind of "saw" shape curve) for class B (TC=2):
##D vecplot(I4,graph="VEC",xval=2,cex=1.2,TC=2,
##D  main="VEC curve for x2 influence on y (class B)",xlab="x2")
##D # same VEC curve but with boxplots:
##D vecplot(I4,graph="VECB",xval=2,cex=1.2,TC=2,
##D  main="VEC curve with box plots for x2 influence on y (class B)",xlab="x2")
## End(Not run)

### 4th example, regression, DSA:
## Not run: 
##D data(sa_psin)
##D # same model from Table 1 of the reference:
##D M3=fit(y~.,sa_psin,model="ksvm",search=2^-2,C=2^6.87,epsilon=2^-8)
##D # in this case: Aggregation is the same as NY
##D I5=Importance(M3,sa_psin,method="DSA",Aggregation=3)
##D # 2D analysis (check reference for more details), RealL=L=7:
##D # need to aggregate results into a matrix of SA measure
##D cm=agg_matrix_imp(I5)
##D print("show Table 8 DSA results (from the reference):")
##D print(round(cm$m1,digits=2))
##D print(round(cm$m2,digits=2))
##D # show most relevant (darker) input pairs, in this case (x1,x2) > (x1,x3) > (x2,x3)
##D # to build a nice plot, a fixed threshold=c(0.05,0.05) is used. note that
##D # in the paper and for real data, we use threshold=0.1, 
##D # which means threshold=rep(max(cm$m1,cm$m2)*threshold,2)
##D fcm=cmatrixplot(cm,threshold=c(0.05,0.05)) 
##D # 2D analysis using pair AT=c(x1,x2') (check reference for more details), RealL=7:
##D # nice 3D VEC surface plot:
##D vecplot(I5,xval=c(1,2),graph="VEC3",xlab="x1",ylab="x2",zoom=1.1,
##D  main="VEC surface of (x1,x2') influence on y")
##D # same influence but know shown using VEC contour:
##D par(mar=c(4.0,4.0,1.0,0.3)) # change the graph window space size
##D vecplot(I5,xval=c(1,2),graph="VECC",xlab="x1",ylab="x2",
##D  main="VEC surface of (x1,x2') influence on y")
##D # slower GSA:
##D I6=Importance(M3,sa_psin,method="GSA",interactions=1:4)
##D cm2=agg_matrix_imp(I6)
##D # compare cm2 with cm1, almost identical:
##D print(round(cm2$m1,digits=2))
##D print(round(cm2$m2,digits=2))
##D fcm2=cmatrixplot(cm2,threshold=0.1) 
## End(Not run)

### If you want to use Importance over your own model (different than rminer ones):
# 1st example, regression, uses the theoretical sin1reg function: x1=70% and x2=30%
data(sin1reg)
mypred=function(M,data)
{ return (M[1]*sin(pi*data[,1]/M[3])+M[2]*sin(pi*data[,2]/M[3])) }
M=c(0.7,0.3,2000)
# 4 is the column index of y
I=Importance(M,sin1reg,method="sens",measure="AAD",PRED=mypred,outindex=4) 
print(I$imp) # x1=72.3% and x2=27.7%
L=list(runs=1,sen=t(I$imp),sresponses=I$sresponses)
mgraph(L,graph="IMP",leg=names(sin1reg),col="gray",Grid=10)
mgraph(L,graph="VEC",xval=1,Grid=10) # equal to:
par(mar=c(2.0,2.0,1.0,0.3)) # change the graph window space size
vecplot(I,graph="VEC",xval=1,Grid=10,main="VEC curve for x1 influence on y:")

### 2nd example, 3-class classification for iris and lda model:
## Not run: 
##D data(iris)
##D library(MASS)
##D predlda=function(M,data) # the PRED function
##D { return (predict(M,data)$posterior) }
##D LDA=lda(Species ~ .,iris, prior = c(1,1,1)/3)
##D # 4 is the column index of Species
##D I=Importance(LDA,iris,method="1D-SA",PRED=predlda,outindex=4)
##D vecplot(I,graph="VEC",xval=1,Grid=10,TC=1,
##D main="1-D VEC for Sepal.Lenght (x-axis) influence in setosa (prob.)")
## End(Not run)

### 3rd example, binary classification for setosa iris and lda model:
## Not run: 
##D iris2=iris;iris2$Species=factor(iris$Species=="setosa")
##D predlda2=function(M,data) # the PRED function
##D { return (predict(M,data)$class) }
##D LDA2=lda(Species ~ .,iris2)
##D I=Importance(LDA2,iris2,method="1D-SA",PRED=predlda2,outindex=4)
##D vecplot(I,graph="VEC",xval=1,
##D main="1-D VEC for Sepal.Lenght (x-axis) influence in setosa (class)",Grid=10)
## End(Not run)




