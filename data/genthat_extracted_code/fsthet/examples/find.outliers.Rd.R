library(fsthet)


### Name: find.outliers
### Title: This identifies all of the SNPs outside of the smoothed
###   quantiles in the dataset.
### Aliases: find.outliers

### ** Examples

  ## Don't show: 
    gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
     for(i in 1:40){
      gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
      gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
     }
     fsts<-calc.actual.fst(gpop)
      boot.out<-as.data.frame(t(replicate(1, fst.boot(gpop))))
      outliers<-find.outliers(fsts,boot.out)
  
## End(Don't show)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.gpop(gfile)
##D     fsts<-calc.actual.fst(gpop)
##D     boot.out<-as.data.frame(t(replicate(10, fst.boot(gpop))))
##D     outliers<-find.outliers(fsts,boot.out)
##D   
## End(Not run)



