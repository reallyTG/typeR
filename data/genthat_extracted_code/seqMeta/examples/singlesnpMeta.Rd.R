library(seqMeta)


### Name: singlesnpMeta
### Title: Meta analyze single snp effects from multiple studies
### Aliases: singlesnpMeta

### ** Examples

###load example data for two studies:
### see ?seqMetaExample
data(seqMetaExample)

####run on each study:
cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo = SNPInfo, data =pheno1)
cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo = SNPInfo, data =pheno2)

#### combine results:
out <- singlesnpMeta(cohort1, cohort2, SNPInfo = SNPInfo)
head(out)

## Not run: 
##D ##compare
##D bigZ <- matrix(NA,2*n,nrow(SNPInfo))
##D colnames(bigZ) <- SNPInfo$Name
##D for(gene in unique(SNPInfo$gene)) {
##D    snp.names <- SNPInfo$Name[SNPInfo$gene == gene]
##D      bigZ[1:n,SNPInfo$gene == gene][, snp.names %in% colnames(Z1)] <- 
##D              Z1[, na.omit(match(snp.names,colnames(Z1)))]
##D      bigZ[(n+1):(2*n),SNPInfo$gene == gene][, snp.names %in% colnames(Z2)] <- 
##D              Z2[, na.omit(match(snp.names,colnames(Z2)))]
##D }
##D 
##D pheno <- rbind(pheno1[ ,c("y","sex","bmi")], pheno2[ , c("y","sex","bmi")])
##D out3 <- apply(bigZ, 2, function(z) {
##D          if(any(!is.na(z))) {
##D            z[is.na(z)] <- mean(z,na.rm=TRUE)
##D            mod <- lm(y ~ sex+bmi+c(rep(1,n),rep(0,n))+z, data=pheno)
##D            beta <- mod$coef["z"]
##D            se <- sqrt(vcov(mod)["z", "z"])
##D            p <- pchisq( (beta/se)^2,df=1,lower=F)
##D            return(c(beta,se,p))
##D          } else {
##D            return(c(0,Inf,1))
##D          }
##D  }) 
##D  out3 <- t(out3[,match(out$Name,colnames(out3))])
##D  
##D  ##plot
##D  par(mfrow=c(2,2))
##D  plot(x=out3[,1],y=out$beta, xlab="complete data (Wald)", 
##D       ylab="meta-analysis (Score)", main="coefficients"); abline(0,1)
##D  plot(x=out3[,2],y=out$se, xlab="complete data (Wald)", 
##D       ylab="meta-analysis (Score)", main="standard errors"); abline(0,1)
##D  plot(x=out3[,3],y=out$p, xlab="complete data (Wald)", 
##D       ylab="meta-analysis (Score)", main="p-values"); abline(0,1)
##D  
## End(Not run)



