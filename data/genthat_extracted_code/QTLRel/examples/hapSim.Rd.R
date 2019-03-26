library(QTLRel)


### Name: hapSim
### Title: Generate Genotypic Data
### Aliases: hapSim

### ** Examples

data(miscEx)

## Not run: 
##D # prepare pedigree in desired format
##D pedR<- pedRecode(pedF8)
##D pedR[1:5,] # check to find out three founders
##D # fake founder haplotypes
##D hapDat<- rbind(rep(1:2,nrow(gmapF8)),rep(3:4,nrow(gmapF8)),rep(5:6,nrow(gmapF8)))
##D rownames(hapDat)<- c("32089","1","2")
##D # simulate hyplotypes for F8 individuals
##D hd<- hapSim(pedF8, gmapF8, ids=pedF8$id[pedF8$gen=="F8"], hap=hapDat)
##D dim(hd)
##D hd[1:5,1:10]
## End(Not run)



