library(fda.usc)


### Name: classif.DD
### Title: DD-Classifier Based on DD-plot
### Aliases: classif.DD
### Keywords: classif

### ** Examples


## Not run: 
##D 
##D # DD-classif for functional data
##D data(tecator)
##D ab=tecator$absorp.fdata
##D ab1=fdata.deriv(ab,nderiv=1)
##D ab2=fdata.deriv(ab,nderiv=2)
##D gfat=factor(as.numeric(tecator$y$Fat>=15))
##D 
##D # DD-classif for p=1 functional  data set
##D out01=classif.DD(gfat,ab,depth="mode",classif="np")
##D out02=classif.DD(gfat,ab2,depth="mode",classif="np")
##D # DD-plot in gray scale
##D ctrl<-list(draw=T,col=gray(c(0,.5)),alpha=.2)
##D out02bis=classif.DD(gfat,ab2,depth="mode",classif="np",control=ctrl)
##D 
##D # 2 depth functions (same curves) 
##D out03=classif.DD(gfat,list(ab2,ab2),depth=c("RP","mode"),classif="np")
##D # DD-classif for p=2 functional data set
##D ldata<-list("ab"=ab2,"ab2"=ab2)
##D # Weighted version 
##D out04=classif.DD(gfat,ldata,depth="mode",classif="np",w=c(0.5,0.5))
##D # Model version
##D out05=classif.DD(gfat,ldata,depth="mode",classif="np")
##D # Integrated version (for multivariate functional data)
##D out06=classif.DD(gfat,ldata,depth="modep",classif="np")
##D 
##D # DD-classif for multivariate data
##D data(iris)
##D group<-iris[,5]
##D x<-iris[,1:4]
##D out10=classif.DD(group,x,depth="RP",classif="lda")
##D summary.classif(out10)
##D out11=classif.DD(group,list(x,x),depth=c("MhD","RP"),classif="lda")
##D summary.classif(out11)
##D 
##D # DD-classif for functional data: g levels 
##D data(phoneme)
##D mlearn<-phoneme[["learn"]]
##D glearn<-as.numeric(phoneme[["classlearn"]])-1
##D out20=classif.DD(glearn,mlearn,depth="FM",classif="glm")
##D out21=classif.DD(glearn,list(mlearn,mlearn),depth=c("FM","RP"),classif="glm")
##D summary.classif(out20)
##D summary.classif(out21)
## End(Not run)




