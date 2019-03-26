library(fsthet)


### Name: calc.betahat
### Title: This calculates beta-hat, the Fst value used in Lositan.
### Aliases: calc.betahat

### ** Examples

   gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20))
     for(i in 1:40){
      gpop[1:20,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
      gpop[21:40,(i+2)]<-sample(c("0101","0102","0202"),20,replace=TRUE)
     }
  bh<-calc.betahat(gpop, 3) #calculate betahat for the SNP
  ## No test: 
    gfile<-system.file("extdata", "example.genepop.txt",package = 'fsthet')
    gpop<-my.read.genepop(gfile)
    beta1<-calc.betahat(gpop,3) #calculate betahat for the first SNP
  
## End(No test)



