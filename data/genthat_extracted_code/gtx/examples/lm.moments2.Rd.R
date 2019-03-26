library(gtx)


### Name: lm.moments2
### Title: Fit normal linear model using pre-built matrix of second
###   moments.
### Aliases: lm.moments2

### ** Examples

data(mthfrex)
xtx <- make.moments2(mthfr.params, c("SBP", "DBP", "SexC", "Age"), mthfrex)
lm.moments2(xtx, "SBP", c("ONE", "rs6668659_T", "rs4846049_T",
                                "rs1801133_G", "SexC", "Age"))
## Compare against results from lm
## Note have to use coded alleles in original data
lm(SBP ~ rs6668659_G+rs4846049_G+rs1801133_A+Sex+Age, data = mthfrex$data)
## Note in results Sex factor coded differently than SexC



