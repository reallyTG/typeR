library(fsthet)


### Name: plotting.cis
### Title: This plots a dataframe of fsts with bootstrapped confidence
###   intervals.
### Aliases: plotting.cis

### ** Examples

 gpop<-data.frame(popinfo=c(rep("POP 1", 20),rep("POP 2", 20)),ind.names=c(1:20,1:20),
                  loc0=sample(c("0101","0102","0202"),40,replace=TRUE),
                  loc1=sample(c("0101","0102","0202"),40,replace=TRUE))
  fsts<-calc.actual.fst(gpop)
  bins<-make.bins(fsts)
  cis<-find.quantiles(bins = bins$bins,bin.fst = bins$bin.fst)
  quant.list<-cis$CI0.95
  plotting.cis(df=fsts,ci.df=quant.list,make.file=FALSE)
  ## Not run: 
##D   load(fsts)
##D   bins<-make.bins(fsts)
##D   cis<-find.quantiles(bins = bins$bins,bin.fst = bins$bin.fst)
##D   quant.list<-cis$CI0.95
##D   plotting.cis(df=fsts,ci.df=quant.list,make.file=FALSE)
##D   
## End(Not run)



