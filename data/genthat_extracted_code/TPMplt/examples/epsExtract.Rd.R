library(TPMplt)


### Name: epsExtract
### Title: Auto output for strain rate vs. temperature table
### Aliases: epsExtract
### Keywords: SR-T.table epsExtract lyIDdetector

### ** Examples

require(VBTree)
# Find locations for temperature and strain rate:
dl2vbt(chrvec2dl(colnames(TPMdata)))
epsExtract(TPMdata, eps = 0.7, lyT = 2, lySR = 3)



