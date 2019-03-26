library(sommer)


### Name: DT_technow
### Title: Genotypic and Phenotypic data from single cross hybrids (Technow
###   et al. (2014))
### Aliases: DT_technow
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####
data(DT_technow)
####=========================================####
####=========================================####
# ans2 <- mmer(GY~1, 
#              random=~vs(dent,Gu=Ad) + vs(flint,Gu=Af),
#              rcov=~units,
#              data=DT)
# summary(ans2)

####=========================================####
#### multivariate overlayed model
####=========================================####
# M <- rbind(Md,Mf)
# A <- A.mat(M)
# ans3 <- mmer(cbind(GY,GM)~1, 
#              random=~vs(overlay(dent,flint),Gu=A),
#              rcov=~vs(units,Gtc=diag(2)),
#              data=DT)
# summary(ans2)
# cov2cor(ans3$sigma[[1]])
# ####=========================================####
# #### Hybrid GWAS
# ####=========================================####
# M <- (rbind(Md,Mf) *2 )-1
# inds <- colnames(overlay(DT$dent,DT$flint)[[1]])
# Minds <- M[inds,]
# 
# A <- A.mat(Minds)
# A[1:4,1:4]
# ans3 <- GWAS(GM~1, iters = 20,
#              random=~vs(overlay(dent,flint),Gu=A),
#              rcov=~vs(units),na.method.Y = "include",
#              M=Minds, gTerm="dent",
#              data=DT)
# plot(ans3$scores[1,])



