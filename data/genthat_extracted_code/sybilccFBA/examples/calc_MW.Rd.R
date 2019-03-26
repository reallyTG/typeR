library(sybilccFBA)


### Name: calc_MW
### Title: Calculate molecular weights
### Aliases: calc_MW
### Keywords: Molecular weights

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## Not run: 
##D aa_fname <- system.file("extdata", "aa.txt", package="sybilccFBA")
##D ptt_fname <- system.file("extdata", "test2.ptt", package="sybilccFBA")
##D faa_fname <- system.file("extdata", "NC_000913.faa", package="sybilccFBA")
##D 
##D geneCnt <- calc_MW(aa_fname,ptt_fname,faa_fname)
##D write.csv(file="geneCnt.csv",geneCnt) 
##D 
##D ## The function is currently defined as
##D "calc_MW"
## End(Not run)



