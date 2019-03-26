library(seqMeta)


### Name: prepCox
### Title: Prepare scores for region based (meta) analysis
### Aliases: prepCox prepScores prepScoresX

### ** Examples

###load example data for two studies:
### see ?seqMetaExample
data(seqMetaExample)

####run on each cohort:
cohort1 <- prepScores(Z=Z1, y~sex+bmi, SNPInfo = SNPInfo, data =pheno1)
cohort2 <- prepScores(Z=Z2, y~sex+bmi, SNPInfo = SNPInfo, kins=kins, data=pheno2)

#### combine results:
##skat
out <- skatMeta(cohort1, cohort2, SNPInfo = SNPInfo)
head(out)

##T1 test
out.t1 <- burdenMeta(cohort1,cohort2, SNPInfo = SNPInfo, mafRange = c(0,0.01))
head(out.t1)

##single snp tests:
out.ss <- singlesnpMeta(cohort1,cohort2, SNPInfo = SNPInfo)
head(out.ss)
## Not run: 
##D ########################
##D ####binary data
##D cohort1 <- prepScores(Z=Z1, ybin~1, family=binomial(), SNPInfo = SNPInfo, data =pheno1)
##D out <- skatMeta(cohort1, SNPInfo = SNPInfo)
##D head(out)
##D 
##D ####################
##D ####survival data
##D cohort1 <- prepCox(Z=Z1, Surv(time,status)~strata(sex)+bmi, SNPInfo = SNPInfo, data =pheno1)
##D out <- skatMeta(cohort1, SNPInfo = SNPInfo)
##D head(out)
## End(Not run)



