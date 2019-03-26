library(pamctdp)


### Name: wibca2mfa
### Title: MFA aids to interpretation of Weighted Intra Blocks
###   Correspondence Analysis Lg function computes the COVV between two
###   operators
### Aliases: wibca2mfa Lg
### Keywords: multivariate

### ** Examples

data(mores5)
coa <- dudi.coa(mores5$tab, scann = FALSE, nf = 4)
wibca <- witwit.model(coa, mores5$rbl5, mores5$cbl5, model="B",weight="mfa",scann = FALSE,nf=4)
mfa <- wibca2mfa(wibca)
mfa 



