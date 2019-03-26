library(MM4LMM)


### Name: AnovaTest
### Title: Type I and Type III Tests for mixed models.
### Aliases: AnovaTest
### Keywords: ~kwd1 ~kwd2

### ** Examples

  require('MM4LMM')
  data(QTLDetectionExample)
  Pheno <- QTLDetectionExample$Phenotype
  Geno <- QTLDetectionExample$Genotype
  Kinship <- QTLDetectionExample$Kinship

  ##Build the VarList object
  VL <- list(Additive = Kinship , Error = diag(1,length(Pheno)))
  
  ##Perform inference
  Result <- MMEst(Y=Pheno , X = Geno , VarList = VL)

  ##Compute tests
  AOV <- AnovaTest(Result,Type="TypeI")
  
  ##Test specific contrast matrix
  TC = matrix(c(0,1),nrow=1)
  AOV2 <- AnovaTest(Result, TestedCombination = TC)



