library(seqMeta)


### Name: burdenMeta
### Title: Meta analyze burden tests from multiple studies
### Aliases: burdenMeta

### ** Examples

###load example data for two studies:
### see ?seqMetaExample	
data(seqMetaExample)

####run on each cohort:
cohort1 <- prepScores(Z=Z1, y~1, SNPInfo=SNPInfo, data=pheno1)
cohort2 <- prepScores(Z=Z2, y~1, SNPInfo=SNPInfo, data=pheno2)

#### combine results:
out <- burdenMeta(cohort1, cohort2, SNPInfo = SNPInfo, mafRange=c(0,.01))
head(out)

## Not run: 
##D ##### Compare with analysis on full data set:
##D bigZ <- matrix(NA,2*n,nrow(SNPInfo))
##D colnames(bigZ) <- SNPInfo$Name
##D 
##D for(gene in unique(SNPInfo$gene)) {
##D    snp.names <- SNPInfo$Name[SNPInfo$gene == gene]
##D      bigZ[1:n,SNPInfo$gene == gene][ , snp.names %in% colnames(Z1)] <- 
##D                    Z1[ , na.omit(match(snp.names,colnames(Z1)))]
##D      bigZ[(n+1):(2*n),SNPInfo$gene == gene][ , snp.names %in% colnames(Z2)] <- 
##D                    Z2[ , na.omit(match(snp.names,colnames(Z2)))]
##D }
##D 
##D pheno <- rbind(pheno1[, c("y","sex","bmi")],pheno2[,c("y","sex","bmi")])
##D burden.p <- c(by(SNPInfo$Name, SNPInfo$gene, function(snp.names) {
##D    inds <- match(snp.names,colnames(bigZ)) burden <- rowSums(bigZ[,na.omit(inds)],na.rm=TRUE)
##D    mod <- lm(y~burden + gl(2,nrow(pheno1)),data=pheno)
##D    summary(mod)$coef[2,4]
##D }))
##D 
##D head(cbind(out$p,burden.p))
##D 
##D #will be slightly different:
##D plot(y=out$p,x=burden.p, ylab = "burden meta p-values", xlab = "complete data p-values")
## End(Not run)




