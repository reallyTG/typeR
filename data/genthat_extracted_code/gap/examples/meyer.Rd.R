library(gap)


### Name: meyer
### Title: A pedigree data on 282 animals deriving from two generations
### Aliases: meyer
### Keywords: datasets

### ** Examples

## Not run: 
##D library(gap)
##D meyer <- within(meyer,{
##D    g1 <- ifelse(generation==1,1,0)
##D    g2 <- ifelse(generation==2,1,0)
##D })
##D lm(y~-1+g1+g2,data=meyer)
##D library(MCMCglmm)
##D m <-MCMCglmm(y~-1+g1+g2,random=animal~1,pedigree=meyer[,1:3],data=meyer,verbose=FALSE)
##D summary(m)
##D plot(m)   
##D 
##D meyer <- within(meyer,{
##D    id <- animal
##D    animal <- ifelse(!is.na(animal),animal,0)
##D    dam <- ifelse(!is.na(dam),dam,0)
##D    sire <- ifelse(!is.na(sire),sire,0)
##D })
##D # library(kinship)
##D # A <- with(meyer,kinship(animal,sire,dam))*2
##D 
##D A <- kin.morgan(meyer)$kin.matrix*2
##D 
##D library(regress)
##D regress(y~-1+g1+g2,~A,data=meyer)
##D prior <- list(R=list(V=1, nu=0.002), G=list(G1=list(V=1, nu=0.002)))
##D m2 <- MCMCgrm(y~-1+g1+g2,prior,meyer,A,singular.ok=TRUE,verbose=FALSE)
##D summary(m2)
##D plot(m2)   
## End(Not run)



