library(fsthet)


### Name: fsthet
### Title: This is a wrapper to generate and plot the smoothed quantiles
###   and identify outliers.
### Aliases: fsthet

### ** Examples

  ## Don't show: 
  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
   for(i in 1:40){
    gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
    gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
   }
  out.dat<-fsthet(gpop)
  
## End(Don't show)
## Not run: 
##D   gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D   gpop<-my.read.gpop(gfile)
##D   out.dat<-fsthet(gpop)
## End(Not run)



