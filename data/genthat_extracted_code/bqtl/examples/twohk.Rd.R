library(bqtl)


### Name: twohk
### Title: One and Two Gene Models Using Linearized Posterior
### Aliases: twohk
### Keywords: models

### ** Examples

data(little.ana.bc)
little.vc<-make.varcov(little.ana.bc$data[,little.ana.bc$reg.names],
  little.ana.bc$data$bc.phenotype)
little.2<- twohk(little.vc,little.ana.bc,rparm=1)
print( c(odds.1=sum(little.2$loc.1),odds.2=sum(little.2$loc.2)) )
par(mfrow=c(3,2))
little.pe <- 2 * little.2$loc.2 / sum(little.2$loc.2)   #locus-wise posterior expectation
plot(little.ana.bc,little.pe,type="h",ylab="E(genes")
rm(little.2,little.vc,little.pe,little.ana.bc)



