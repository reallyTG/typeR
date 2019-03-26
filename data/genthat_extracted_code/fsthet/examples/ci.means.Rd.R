library(fsthet)


### Name: ci.means
### Title: This calculates the average confidence intervals from multiple
###   bootstrap outputs.
### Aliases: ci.means

### ** Examples

  ## Don't show: 
    gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
     for(i in 1:40){
      gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
      gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
     }
    quant.out<-fst.boot(gpop, bootstrap = FALSE)
    quant.list<-ci.means(quant.out[[3]])
  
## End(Don't show)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.genepop(gfile)
##D     quant.out<-fst.boot(gpop, bootstrap = FALSE)
##D     quant.list<-ci.means(quant.out[[3]])
##D   
## End(Not run)



