## ------------------------------------------------------------------------
library(fsthet)
gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
gpop<-my.read.genepop(gfile)

## ------------------------------------------------------------------------
fsts<-calc.actual.fst(gpop)
head(fsts)

#Plot the actual values to see what your distribution looks like
par(mar=c(4,4,1,1))
plot(fsts$Ht, fsts$Fst,xlab="Ht",ylab="Fst",pch=19)

## ------------------------------------------------------------------------
quant.out<-fst.boot(gpop, bootstrap = FALSE)
str(quant.out)
head(quant.out[[3]][[1]])


## ------------------------------------------------------------------------
head(fsts)
bins<-make.bins(fsts)
cis<-find.quantiles(bins = bins$bins,bin.fst = bins$bin.fst)
str(cis)


## ------------------------------------------------------------------------
cis.list<-find.quantiles(bins = bins$bins,bin.fst = bins$bin.fst,ci=c(0.01,0.05))
str(cis.list)


## ------------------------------------------------------------------------
#extract the confidence interavls
quant.list<-ci.means(quant.out[[3]])
head(quant.list)
#Alternatively
quant.list<-cis$CI0.95
head(quant.list)
#plot the results
par(mar=c(4,4,1,1))
plotting.cis(df=fsts,ci.df=quant.list,make.file=F)


## ------------------------------------------------------------------------
outliers<-find.outliers(fsts,boot.out=quant.out)
head(outliers)


## ------------------------------------------------------------------------
out.dat<-fsthet(gpop)
head(out.dat)

## ----eval=F--------------------------------------------------------------
#  plotting.cis(df=fsts,boot.out=boot.out,make.file=T,file.name="ExampleOutliers.png")

## ------------------------------------------------------------------------
fst.options.print()

## ------------------------------------------------------------------------
fsts<-calc.actual.fst(gpop,"fst")

## ------------------------------------------------------------------------
fsts.theta<-calc.actual.fst(gpop,"theta")

## ------------------------------------------------------------------------
fsts.beta<-calc.actual.fst(gpop,"var")

## ------------------------------------------------------------------------
fsts.betahat<-calc.actual.fst(gpop,"betahat")

## ------------------------------------------------------------------------
#get the quantiles
quant.list<-ci.means(quant.out[[3]])

#create a data.frame of confidence intervals
qs<-as.data.frame(do.call(cbind,quant.list))
colnames(qs)<-c("low","upp")
qs$Ht<-as.numeric(rownames(qs))

#plot
par(mar=c(4,4,1,1))
plot(fsts$Ht, fsts$Fst,pch=19,xlab="Ht",ylab="Fst")
points(qs$Ht,qs$low,type="l",col="red")
points(qs$Ht,qs$upp,type="l",col="red")


## ------------------------------------------------------------------------
af.actual<-apply(gpop[,3:ncol(gpop)],2,calc.allele.freq)

#extract the minimum allele frequency for each locus
min.af<-unlist(lapply(af.actual,min))
par(mar=c(2,2,2,2))
hist(min.af)

