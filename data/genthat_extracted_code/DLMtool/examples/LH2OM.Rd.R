library(DLMtool)


### Name: LH2OM
### Title: Predict missing life-history parameters
### Aliases: LH2OM predictLH

### ** Examples

myOM<-LH2OM(DLMtool::testOM)

# drawing known parameters from normal distribution
myOM <- LH2OM(DLMtool::testOM, dist='norm')

# predict life-history parameters and return a data frame

# predict all life-history parameters 
Predicts <- predictLH(list(), "Katsuwonus", "pelamis")
head(Predicts)

# predict L50 from Linf, and M and K
Predicts <- predictLH(list(Linf=c(90, 95)), "Katsuwonus", "pelamis")

# predict L50 and K 
Predicts <- predictLH(list(Linf=c(90, 95), M=c(0.8, 0.9)), "Katsuwonus", "pelamis")

# predict L50 and K sampling Linf and M from normal distribution 
Predicts <- predictLH(list(Linf=c(90, 95), M=c(0.8, 0.9)), "Katsuwonus", "pelamis", dist='norm')




