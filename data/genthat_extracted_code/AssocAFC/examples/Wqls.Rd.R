library(AssocAFC)


### Name: Wqls
### Title: W Quasi-Likelihood Score
### Aliases: Wqls
### Keywords: ~kwd1 ~kwd2

### ** Examples


P_WQLS <- vector("numeric")
#This data corresponds to what is used in the 1st iteration with the raw data
data("geno.afc")
data("maf.afc")
data("phenotype.afc")
data("kin.afc")
data("cor.afc")
data("weights.afc")
QLS <- Wqls(Genotypes = geno.afc, MAF = maf.afc, Pheno = phenotype.afc, Kin = kin.afc,
                                        Correlation = cor.afc, Weights = weights.afc)
P_WQLS <- c(P_WQLS, QLS[7])
print(P_WQLS)

## Not run: 
##D #This example shows processing the raw data and uses kinship2,
##D #which AFC does not depend on
##D 
##D library(kinship2)
##D library(CompQuadForm)
##D 
##D P_WQLS <- vector("numeric")
##D 
##D for (j in 1:10)
##D {
##D   geno.afc <- read.table(system.file("extdata", "Additive_Genotyped_Truncated.txt",
##D                          package = "AFC"), header = TRUE)
##D   geno.afc[ , "IID"] <- paste(geno.afc[ , "FID"]  , geno.afc[ , "IID"]  ,sep=".")
##D   geno.afc[geno.afc[,"FA"]!=0 , "FA"] <- paste(geno.afc[geno.afc[,"FA"]!=0 , "FID"],
##D                                       geno.afc[geno.afc[,"FA"]!=0 , "FA"]  ,sep=".")
##D   geno.afc[geno.afc[,"FA"]!=0 , "MO"] <- paste(geno.afc[geno.afc[,"FA"]!=0 , "FID"],
##D                                       geno.afc[geno.afc[,"FA"]!=0 , "MO"]  ,sep=".")
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
##D   weights.afc <- matrix(1/(maf.afc[,2]+1),nc=1,nr=length(Set))
##D   QLS <- Wqls(Genotypes = geno.afc, MAF = maf.afc, Pheno = phenotype.afc, Kin = kin.afc,
##D                                         Correlation = cor.afc, Weights = weights.afc)
##D   P_WQLS <- c(P_WQLS, QLS[7])
##D }
##D print(P_WQLS)
## End(Not run)

## The function is currently defined as
function(Genotypes, MAF, Pheno, Kin, Correlation, Weights)
{
  Na     <- length(Pheno[Pheno[,1]==1,])
  Nu     <- length(Pheno[Pheno[,1]==0,])
  N      <- Na + Nu

  # The three following lines: prepare the Phenotype variables
  OneN  <- matrix(1, ncol=1, nrow = N)
  Y  <- Pheno
  OneHat <- matrix( Na/N, ncol=1 , nrow=N)
  temp <- Y - OneHat

  # Estimate MAF in all subjects
  P  <- (MAF[,1]*Na + MAF[,2]*Nu)/N
  # Number of Snps
  Nsnps   <- nrow(MAF)
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
  # This value will account for the correlation between Snps.
  cs      <- 2*t(VarSnps) %*% Correlation %*% VarSnps

  if (Nsnps==1)
  {
    S<-Genotypes
  }else
  {
    if (is.null(Weights))
    {
      # Rare variant score: sum of minor alleles accross all Snps.
      S <- apply(Genotypes , 1 , sum)
    }else
    {
      # Rare variant score: sum of minor alleles accross all Snps.
      S <- Genotypes %*% Weights
    }
  }
  S <- matrix(S,ncol=1,nrow=length(S))
  Kin <- 2*Kin
  KinInv <- solve(Kin)
  A <- as.numeric(t(Y) %*% KinInv %*% OneN %*% solve(t(OneN) %*% KinInv %*% OneN))
  V <- KinInv %*% Y - A * KinInv %*% OneN
  if (is.null(Weights))
  {
    num <- (sum((S[Y==1]) * rowSums(KinInv[Y==1,Y==1]))*(1-A) -2*sum(MAF[,2])*(A)*Nu)^2;
  }else
  {
    num <- (sum((S[Y==1]) * rowSums(KinInv[Y==1,Y==1]))*(1-A) -2*sum(Weights*MAF[,2])*(A)*Nu)^2;
  }
  denom <- as.numeric(cs) * (t(V)%*% Kin %*% V) ;
  W <- num/denom ;
  Pvalue <- 1-pchisq(W,1) ;
  out <- t(data.frame(c(sum(MAF[,1]), sum(MAF[,2]), sum(P), num, denom, W, Pvalue)))
  colnames(out) <- c("Sum MAF Cases", "Sum MAF Controls", "Sum MAF All Weighted", "Numerator",
                     "Denominator", "Wqls", "Pvalue")
  rownames(out) <- "Statistics"
  return(out)
}



