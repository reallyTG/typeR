library(AssocAFC)


### Name: afcSKAT
### Title: Allele Frequency Comparison Sequence Kernel Association Test
### Aliases: afcSKAT
### Keywords: ~methods ~htest

### ** Examples


P_afcSKAT_Satterwaite <- vector("numeric")
P_afcSKAT_Davies <- vector("numeric")
#This data corresponds to what is used in the 1st iteration with the raw data
data("maf.afc")
data("phenotype.afc")
data("kin.afc")
data("cor.afc")
data("weights.afc")
SKAT <- afcSKAT(MAF = maf.afc , Pheno = phenotype.afc, Kin = kin.afc , Correlation=cor.afc,
                Weights = weights.afc)
P_afcSKAT_Satterwaite <- c(P_afcSKAT_Satterwaite, SKAT[1])
P_afcSKAT_Davies <- c(P_afcSKAT_Davies, SKAT[2])
print(P_afcSKAT_Satterwaite)
print(P_afcSKAT_Davies)

## Not run: 
##D #This example shows processing the raw data and uses kinship2,
##D #which AFC does not depend on
##D 
##D library(kinship2)
##D library(CompQuadForm)
##D 
##D P_afcSKAT_Satterwaite <- vector("numeric")
##D P_afcSKAT_Davies <- vector("numeric")
##D 
##D for (j in 1:10)
##D {
##D   geno.afc <- read.table(system.file("extdata", "Additive_Genotyped_Truncated.txt",
##D                          package = "AFC"), header = TRUE)
##D   geno.afc[ , "IID"] <- paste(geno.afc[ , "FID"]  , geno.afc[ , "IID"]  ,sep=".")
##D   geno.afc[geno.afc[,"FA"]!=0 , "FA"] <- paste(geno.afc[geno.afc[,"FA"]!=0 , "FID"],
##D                                                 geno.afc[geno.afc[,"FA"]!=0 , "FA"]  ,sep=".")
##D   geno.afc[geno.afc[,"FA"]!=0 , "MO"] <- paste(geno.afc[geno.afc[,"FA"]!=0 , "FID"],
##D                                                 geno.afc[geno.afc[,"FA"]!=0 , "MO"]  ,sep=".")
##D   Kinship <- makekinship(geno.afc$FID , geno.afc$IID , geno.afc$FA, geno.afc$MO)
##D   kin.afc <- as.matrix(Kinship)
##D   pheno.afc <- read.table(system.file("extdata", "Phenotype", package = "AFC"))
##D   phenotype.afc <- matrix(pheno.afc[,j],nc=1,nr=nrow(pheno.afc))
##D   geno.afc <- geno.afc[,7:ncol(geno.afc)]
##D   Na <- nrow(pheno.afc[pheno.afc[,j]==1,])
##D   Nu <- nrow(pheno.afc[pheno.afc[,j]==0,])
##D   N <- Nu + Na
##D   maf.afc <- matrix(NA , nr=ncol(geno.afc) , nc=2)
##D   maf.afc[,1] <- colMeans(geno.afc[phenotype.afc==1,])/2;
##D   maf.afc[,2] <- colMeans(geno.afc[phenotype.afc==0,])/2;
##D   P  <- (maf.afc[,1]*Na + maf.afc[,2]*Nu)/N
##D   Set <- which(P<0.05)
##D   maf.afc <- maf.afc[c(Set),]
##D   cor.afc <- cor(geno.afc[,c(Set)])
##D   cor.afc[is.na(cor.afc)] <- 0
##D   geno.afc <- as.matrix(geno.afc[,Set])
##D 
##D   weights.afc <- matrix(1/(maf.afc[,2]+1),nc=1,nr=length(Set))
##D   SKAT <- afcSKAT(MAF = maf.afc , Pheno = phenotype.afc, Kin = kin.afc , Correlation=cor.afc,
##D                   Weights = weights.afc)
##D   P_afcSKAT_Satterwaite <- c(P_afcSKAT_Satterwaite, SKAT[1])
##D   P_afcSKAT_Davies <- c(P_afcSKAT_Davies, SKAT[2])
##D }
##D print(P_afcSKAT_Satterwaite)
##D print(P_afcSKAT_Davies)
## End(Not run)

## The function is currently defined as
function(MAF, Pheno, Kin, Correlation, Weights)
{
  Na     <- length(Pheno[Pheno[,1]==1,])
  Nu     <- length(Pheno[Pheno[,1]==0,])
  N      <- Na + Nu

  # The three following lines: prepare the phenotype variables
  OneN  <- matrix(1, ncol=1, nrow = N)
  Y  <- Pheno
  OneHat <- matrix( Na/N, ncol=1 , nrow=N)

  # Estimate MAF in all subjects
  P  <- (MAF[,1]*Na + MAF[,2]*Nu)/N
  if (is.null(Weights))
  {
    # Variance of SNPs (2p(1-p))
    VarSnps <- sqrt(P*(1-P))
  } else
  {
    # Variance of SNPs (2p(1-p)) accounting for the prespecified Snp weights
    VarSnps <- Weights*sqrt(P*(1-P))
  }
  VarSnps <- matrix(VarSnps,ncol=1)
  cz <- 2* sum((Y - OneHat) %*% t(Y - OneHat) * Kin )
  Vz <- cz * VarSnps %*% t(VarSnps)*Correlation
  if (is.null(Weights))
  {
  	# Quadratic form without Weights
    Q <-  4*Na^2*(sum ( (MAF[,1] - P)^2 ))
  } else
  {
  	# Quadratic form with Weights
    Q <-  4*Na^2*(sum ( Weights*(MAF[,1] - P)^2 ))
  }
  # Satterwaite approximation (1)
  E_Q <- sum(diag(Vz))
  # Satterwaite approximation (2)
  V_Q <- 2* sum( diag (Vz %*% Vz))
  # Satterwaite approximation (3)
  Delta <- V_Q/(2*E_Q)
  # Satterwaite approximation (4)
  df<- 2*E_Q^2/V_Q
  # Satterwaite approximation (5)
  Qscaled <- Q / Delta
  # Satterwaite approximation (6)
  Pvalue_Sat <- 1-pchisq(Qscaled, df)

	# Davies approximation (1)
  eig <- eigen(Vz, symmetric = T, only.values = T)
  # Davies approximation (2)
  evals <- eig$values[eig$values > 1e-06 * eig$values[1]]
  # Davies approximation (3)
  Pvalue_Dav <-davies(Q, evals, acc = 1e-5)$Qq
  out <- t(data.frame(c(Pvalue_Sat,Pvalue_Dav)))
  colnames(out)<- c("Satterwaite","Davies")
  rownames(out) <- "Pvalue"
  return(out)
}



