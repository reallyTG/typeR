library(fsthet)


### Name: var.fst
### Title: This calculates Cockerham & Weir's Beta.
### Aliases: var.fst

### ** Examples

  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20),
                  loc0=sample(c("0101","0102","0202"),40,replace=TRUE),
                  loc1=sample(c("0101","0102","0202"),40,replace=TRUE))
  var1<-var.fst(gpop,3) 
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.gpop(gfile)
##D     var1<-var.fst(gpop,3) #calculate variance-based for the first SNP
##D   
## End(Not run)



