library(fsthet)


### Name: fst.boot.onecol
### Title: This bootstraps across all individuals to calculate a
###   bootstrapped Fst for a randomly-sampled locus.
### Aliases: fst.boot.onecol

### ** Examples

gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
   for(i in 1:40){
    gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
    gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
   }
   fsts<-calc.actual.fst(gpop)
  nloci<-(ncol(gpop)-2)
  boot.out<-as.data.frame(t(replicate(nloci, fst.boot.onecol(gpop,"fst"))))
## Not run: 
##D   gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D   gpop<-my.read.genepop(gfile)
##D   fsts<-calc.actual.fst(gpop)
##D   nloci<-(ncol(gpop)-2)
##D   boot.out<-as.data.frame(t(replicate(nloci, fst.boot.onecol(gpop,"fst"))))
##D   outliers<-find.outliers(fsts,boot.out)
## End(Not run)



