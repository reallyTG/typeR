library(fsthet)


### Name: fst.boot
### Title: This is the major bootstrapping function to calculate confidence
###   intervals.
### Aliases: fst.boot

### ** Examples

  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
   for(i in 1:40){
    gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
    gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
   }
  fsts<-calc.actual.fst(gpop)
  quant.out<-as.data.frame(t(replicate(1, fst.boot(gpop,bootstrap=FALSE))))
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.genepop(gfile)
##D     fsts<-calc.actual.fst(gpop)
##D     quant.out<-as.data.frame(t(replicate(1, fst.boot(gpop,bootstrap=FALSE))))
##D   
## End(Not run)



