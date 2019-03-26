library(seqMeta)


### Name: skatMeta
### Title: Combine SKAT analyses from one or more studies
### Aliases: skatMeta

### ** Examples

###load example data for two studies:
### see ?seqMetaExample	
data(seqMetaExample)

####run on each study:
cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo=SNPInfo, data=pheno1)
cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo=SNPInfo, kins=kins, data=pheno2)

#### combine results:
##skat
out <- skatMeta(cohort1, cohort2, SNPInfo = SNPInfo)
head(out)

## Not run: 
##D ##T1 test
##D out.t1 <- burdenMeta(cohort1,cohort2, SNPInfo = SNPInfo, mafRange = c(0,0.01))
##D head(out.t1)
##D 
##D ##single snp tests:
##D out.ss <- singlesnpMeta(cohort1,cohort2, SNPInfo = SNPInfo)
##D head(out.ss)
##D 
##D ########################
##D ####binary data
##D 
##D cohort1 <- prepScores(Z=Z1, ybin~1, family=binomial(), SNPInfo=SNPInfo, data=pheno1)
##D out.bin <- skatMeta(cohort1, SNPInfo=SNPInfo)
##D head(out.bin)
##D 
##D ####################
##D ####survival data
##D cohort1 <- prepCox(Z=Z1, Surv(time,status)~strata(sex)+bmi, SNPInfo=SNPInfo, data=pheno1)
##D out.surv <- skatMeta(cohort1, SNPInfo=SNPInfo)
##D head(out.surv)
##D 
##D ##### Compare with SKAT on full data set
##D require(SKAT)
##D n <- nrow(pheno1)
##D bigZ <- matrix(NA,2*n,nrow(SNPInfo))
##D colnames(bigZ) <- SNPInfo$Name
##D 
##D for(gene in unique(SNPInfo$gene)) {
##D  snp.names <- SNPInfo$Name[SNPInfo$gene == gene]
##D    bigZ[1:n,SNPInfo$gene == gene][ , snp.names %in% colnames(Z1)] <- 
##D                    Z1[ , na.omit(match(snp.names,colnames(Z1)))]
##D    bigZ[(n+1):(2*n),SNPInfo$gene == gene][ , snp.names %in% colnames(Z2)] <- 
##D                    Z2[ , na.omit(match(snp.names,colnames(Z2)))]
##D }
##D 
##D pheno <- rbind(pheno1[,c("y","sex","bmi")], pheno2[,c("y","sex","bmi")])
##D 
##D obj <- SKAT_Null_Model(y~sex+bmi+gl(2,nrow(pheno1)), data=pheno)
##D skat.pkg.p <- c(by(SNPInfo$Name, SNPInfo$gene, function(snp.names) {
##D            inds <- match(snp.names,colnames(bigZ))
##D            if(sum(!is.na(inds)) ==0 ) return(1)
##D            SKAT(bigZ[,na.omit(inds)],obj, is_check=TRUE, missing=1)$p.value
##D            }))
##D 
##D head(cbind(out$p,skat.pkg.p))
##D 
##D #Note: SKAT ignores family strucutre, resulting in p-values that are systematically too small: 
##D plot(y=out$p,x=skat.pkg.p, ylab = "SKAT meta p-values", xlab = "SKAT p-values")
##D abline(0,1)
##D 
##D ignore family structure:
##D cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo=SNPInfo, data=pheno1)
##D cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo=SNPInfo, data=pheno2)
##D 
##D out.nofam <- skatMeta(cohort1,cohort2,SNPInfo=SNPInfo)
##D plot(y=out.nofam$p,x=skat.pkg.p, ylab = "SKAT meta p-values", xlab = "SKAT p-values")
##D abline(0,1)
## End(Not run)




