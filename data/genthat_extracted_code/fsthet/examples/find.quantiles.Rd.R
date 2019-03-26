library(fsthet)


### Name: find.quantiles
### Title: Generates quantiles from binned Fst values
### Aliases: find.quantiles

### ** Examples

gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
     for(i in 1:40){
      gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
      gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
     }
  fsts<-calc.actual.fst(gpop)
  nloci<-(ncol(gpop)-2)
  boot.out<-as.data.frame(t(replicate(nloci, fst.boot.onecol(gpop,"fst"))))
  bins<-make.bins(boot.out,25,Ht.name="V1",Fst.name="V2")
  fst.CI<-find.quantiles(bins$bins,bins$bin.fst)




