library(heritability)


### Name: marker_h2_means
### Title: Compute a marker-based estimate of heritability, given genotypic
###   means.
### Aliases: marker_h2_means
### Keywords: heritability narrow-sense marker-based

### ** Examples

data(means_LDV)
data(R_matrix_LDV)
data(K_atwell)
out <- marker_h2_means(data.vector=means_LDV$LDV,geno.vector=means_LDV$genotype,
                       K=K_atwell,Dm=R_matrix_LDV)
# Takes about a minute:
#data(means_LD)
#data(R_matrix_LD)
#out <- marker_h2_means(data.vector=means_LD$LD,geno.vector=means_LD$genotype,
#                       K=K_atwell,Dm=R_matrix_LD)
# The likelihood is monotone increasing:
#plot(x=(1:99)/100,y=out$loglik.vector,type="l",ylab="log-likelihood",lwd=2,
#     main='',xlab='h2',cex.lab=2,cex.axis=2.5)



