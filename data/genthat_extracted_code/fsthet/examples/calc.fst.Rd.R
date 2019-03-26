library(fsthet)


### Name: calc.fst
### Title: This calculates Fst.
### Aliases: calc.fst

### ** Examples

  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20),
    loc0=sample(c("0101","0102","0202"),40,replace=TRUE))
  fst1<-calc.fst(gpop,3)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.gpop(gfile)
##D     fst1<-calc.fst(gpop,3) #calculate fst for the first SNP
##D   
## End(Not run)



