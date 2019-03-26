library(fsthet)


### Name: calc.theta
### Title: This calculates theta.
### Aliases: calc.theta

### ** Examples

  gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20),
    loc0=sample(c("0101","0102","0202"),40,replace=TRUE))
  theta1<-calc.theta(gpop, 3)
  ## Not run: 
##D     gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
##D     gpop<-my.read.gpop(gfile)
##D     theta1<-calc.theta(gpop,3) #calculate theta for the first SNP
##D   
## End(Not run)



