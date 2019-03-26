library(seqMeta)


### Name: skatOMeta
### Title: Combine SKAT-O analyses from one or more studies.
### Aliases: skatOMeta

### ** Examples

## Not run: 
##D ### load example data for 2 studies
##D data(seqMetaExample)
##D 
##D ####run on each study:
##D cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo = SNPInfo, data =pheno1)
##D cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo = SNPInfo, kins=kins, data=pheno2)
##D 
##D #### combine results:
##D ##skat-O with default settings:
##D out1 <- skatOMeta(cohort1, cohort2, SNPInfo = SNPInfo, method = "int")
##D head(out1)
##D 
##D ##skat-O, using a large number of combinations between SKAT and T1 tests:
##D out2 <- skatOMeta(cohort1, cohort2, rho=seq(0,1,length=11), SNPInfo=SNPInfo, method="int")
##D head(out2)
##D 
##D #rho = 0 indicates SKAT gave the smaller p-value (or the T1 is undefined) 
##D #rho=1 indicates the burden test was chosen
##D # 0 < rho < 1 indicates some other value was chosen
##D #notice that most of the time either the SKAT or T1 is chosen
##D table(out2$rho)
##D 
##D ##skat-O with beta-weights used in the burden test:
##D out3 <- skatOMeta(cohort1,cohort2, burden.wts = function(maf){dbeta(maf,1,25) }, 
##D                   rho=seq(0,1,length=11),SNPInfo = SNPInfo, method="int")
##D head(out3)
##D table(out3$rho)
##D 
##D ########################
##D ####binary data
##D cohort1 <- prepScores(Z=Z1, ybin~1, family=binomial(), SNPInfo=SNPInfo, data=pheno1)
##D out.bin <- skatOMeta(cohort1, SNPInfo = SNPInfo, method="int")
##D head(out.bin)
##D 
##D ####################
##D ####survival data
##D cohort1 <- prepCox(Z=Z1, Surv(time,status)~strata(sex)+bmi, SNPInfo=SNPInfo, 
##D                    data=pheno1)
##D out.surv <- skatOMeta(cohort1, SNPInfo = SNPInfo, method="int")
##D head(out.surv)
##D 
##D ##########################################
##D ###Compare with SKAT and T1 tests on their own:
##D cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo=SNPInfo, data=pheno1)
##D cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo=SNPInfo, kins=kins, data=pheno2)
##D 
##D out.skat <- skatMeta(cohort1,cohort2,SNPInfo=SNPInfo)
##D out.t1 <- burdenMeta(cohort1,cohort2, wts= function(maf){as.numeric(maf <= 0.01)}, 
##D                      SNPInfo=SNPInfo)
##D            
##D #plot results 
##D #We compare the minimum p-value of SKAT and T1, adjusting for multiple tests 
##D #using the Sidak correction, to that of SKAT-O.
##D 
##D par(mfrow=c(1,3))
##D pseq <- seq(0,1,length=100)
##D plot(y=out.skat$p, x=out1$p,xlab="SKAT-O p-value", ylab="SKAT p-value", main ="SKAT-O vs SKAT")
##D lines(y=pseq,x=1-(1-pseq)^2,col=2,lty=2, lwd=2)
##D abline(0,1)
##D 
##D plot(y=out.t1$p, x=out1$p,xlab="SKAT-O p-value", ylab="T1 p-value", main ="SKAT-O vs T1")
##D lines(y=pseq,x=1-(1-pseq)^2,col=2,lty=2, lwd=2)
##D abline(0,1)
##D 
##D plot(y=pmin(out.t1$p, out.skat$p,na.rm=T), x=out1$p,xlab="SKAT-O p-value", 
##D      ylab="min(T1,SKAT) p-value", main ="min(T1,SKAT) vs SKAT-O")	
##D lines(y=pseq,x=1-(1-pseq)^2,col=2,lty=2, lwd=2)
##D abline(0,1)
##D legend("bottomright", lwd=2,lty=2,col=2,legend="Bonferroni correction")	
## End(Not run)




