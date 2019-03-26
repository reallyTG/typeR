library(pedigree)


### Name: gblup
### Title: Function to calculate breeding values using an animal model and
###   a relationship matrix calculated from the markers (G matrix)
### Aliases: gblup
### Keywords: utilities

### ** Examples

h2 <- 0.5
example(SamplePedigree)
ped <- phList$ped
hList <- phList$hList
qtlList <- ListQTL(hList = hList,frqtl = 0.1,sigma2qtl = 1)
qtl <- tapply(unlist(qtlList),list(rep(names(qtlList),times = unlist(lapply(qtlList,length))),
                   unlist(lapply(qtlList,function(x)seq(1,length(x))))),mean,na.rm = TRUE)
qtl <- melt(qtl)
names(qtl) <- c("POS","TRAIT","a")
HH <- getAll(hList,translatePos = FALSE)
rownames(HH) <- sapply(hList,function(x)x@hID)
QQ <- HH[,match(qtl$POS,colnames(HH))]
g <- QQ
ped$G <- with(ped,g[match(hID0,rownames(g))]+g[match(hID1,rownames(g))])
sigmae <- sqrt(var(ped$G)/h2 - var(ped$G))
ped$P <- ped$G + rnorm(nrow(ped),0,sigmae)
M <- with(ped,HH[match(hID0,rownames(HH)),] + HH[match(hID1,rownames(HH)),]) 
rownames(M) <- ped$ID
sol <- gblup(P~1,data = ped[,c('ID','P')],M = M,lambda = 1/h2 - 1)



