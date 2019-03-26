library(QRank)


### Name: heter.QRank
### Title: Heterogeneity index for "QRank"
### Aliases: heter.QRank

### ** Examples

# continuted from "QRank"
## No test: 
taus=c( 0.25, 0.5, 0.75)
q = QRank(gene=y, snp=x, cov=z, tau=taus)  
heter.QRank(q) # default uses taus inherited from "QRank"
# - output
#Heterogeneity index:
#[1] 2.474184
heter.QRank(q,newtaus = 1:9/10) # calculate based on new taus values
# - output
#Heterogeneity index:
#[1] 2.69242
## End(No test)



