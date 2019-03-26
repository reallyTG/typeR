library(vcdExtra)


### Name: CMHtest
### Title: Generalized Cochran-Mantel-Haenszel Tests
### Aliases: CMHtest CMHtest.formula CMHtest.default 'Cochran Mantel
###   Haenszel test' print.CMHtest
### Keywords: htest

### ** Examples

data(JobSat, package="vcdExtra")
CMHtest(JobSat)
CMHtest(JobSat, rscores="midrank", cscores="midrank")

# formula interface
CMHtest(~ ., data=JobSat)

# A 3-way table (both factors ordinal)
data(MSPatients, package="vcd")
CMHtest(MSPatients)


# also calculate overall tests, controlling for Patient
CMHtest(MSPatients, overall=TRUE)
# compare with mantelhaen.test
mantelhaen.test(MSPatients)

# formula interface
CMHtest(~ ., data=MSPatients, overall=TRUE)

# using a frequency data.frame
CMHtest(xtabs(Freq~ses+mental, data=Mental))
# or, more simply
CMHtest(Freq~ses+mental, data=Mental)

# conditioning formulae
CMHtest(Freq~right+left|gender, data=VisualAcuity)
 
CMHtest(Freq ~ attitude+memory|education+age, data=Punishment)


# Stokes etal, Table 5.1, p 92: two unordered factors
parties <- matrix(
	c(221, 160, 360, 140,
	  200, 291, 160, 311,
	  208, 106, 316, 97), nrow=3, ncol=4, byrow=TRUE)
dimnames(parties) <- list(party=c("Dem", "Indep", "Rep"),
             neighborhood=c("Bayside", "Highland", "Longview", "Sheffield"))
CMHtest(parties, rscores=NULL, cscores=NULL)
# compare with Pearson chisquare
chisq.test(parties)



