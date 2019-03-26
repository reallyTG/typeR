library(fsthet)


### Name: calc.actual.fst
### Title: This calcualtes global Fsts from a genepop dataframe.
### Aliases: calc.actual.fst

### ** Examples

  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20),
    loc0=sample(c("0101","0102","0202"),40,replace=TRUE))
  fsts<-calc.actual.fst(gpop)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.genepop(gfile)
##D     fsts<-calc.actual.fst(gpop)
##D   
## End(Not run)



