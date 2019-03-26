library(gtx)


### Name: combine.moments2
### Title: Builds a matrix of second moments for a set of individuals, from
###   the matrices of second moments for all constituent subsets of
###   individuals.
### Aliases: combine.moments2

### ** Examples

data(mthfrex)
## artifical example with two datasets obtained by
## splitting mthfrex by the HTN variable

xtx.hi <- make.moments2(mthfr.params, c("SBP", "SexC", "Age"),
                        as.snpdata(list(snpinfo = mthfrex$snpinfo,
                                   data = subset(mthfrex$data, HTN == 1))))

xtx.lo <- make.moments2(mthfr.params, c("SBP", "SexC", "Age"),
                        as.snpdata(list(snpinfo = mthfrex$snpinfo,
                                   data = subset(mthfrex$data, HTN == 0))))

## make list of X'X matrices
xtx.list <- list(hi = xtx.hi, lo = xtx.lo)

## combine for outcome SBP and fixed effects for all SNPs
## other variables SexC and Age will be treated as study-specific
fixed <- paste(mthfr.params$snp, mthfr.params$coded.allele, sep = "_")
xtx.comb <- combine.moments2(xtx.list, c("SBP", fixed))

## fit regression model
n.comb <- sum(diag(xtx.comb)[1:length(xtx.list)])
lm.moments2(xtx.comb, "SBP", c("hi_ONE", "lo_ONE", "rs4846052_T"), n = n.comb)

## equivalent regression directly using subject-specific data
coeff.extract(lm(SBP ~ HTN + rs4846052_C, data = mthfrex$data))



