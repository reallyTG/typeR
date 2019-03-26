library(fsthet)


### Name: fhetboot
### Title: This is a wrapper to run the bootstrapping and plot the
###   confidence intervals and significant loci.
### Aliases: fhetboot

### ** Examples

  ## Don't show: 
   gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
   for(i in 1:40){
    gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
    gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
   }
   out.dat<-fhetboot(gpop, fst.choice="fst", alpha=0.05,nreps=1)
  
## End(Don't show)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.genepop(gfile)
##D     out.dat<-fhetboot(gpop, fst.choice="fst", alpha=0.05,nreps=10)
##D   
## End(Not run)



