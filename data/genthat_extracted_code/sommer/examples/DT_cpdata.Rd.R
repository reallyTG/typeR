library(sommer)


### Name: DT_cpdata
### Title: Genotypic and Phenotypic data for a CP population
### Aliases: DT_cpdata
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####
# 
# data(DT_cpdata)
# #### create the variance-covariance matrix
# A <- A.mat(GT) # additive relationship matrix
# #### look at the data and fit the model
# head(DT)
# mix1 <- mmer(Yield~1,
#               random=~vs(id,Gu=A)
#                       + Rowf + Colf,
#               rcov=~units,
#               data=DT)
# summary(mix1)
# 
# ####=========================================####
# #### adding dominance and forcing the other VC's
# ####=========================================####
# 
# DT$idd <- DT$id;
# A <- A.mat(GT) # additive relationship matrix
# D <- D.mat(GT) # dominance relationship matrix
# mm <- matrix(3,1,1);mm ## matrix to fix the var comp
# mix2 <- mmer(Yield~1,
#               random=~vs(id, Gu=A, Gt=mix1$sigma_scaled$id, Gtc=mm)
#                       + vs(Rowf,Gt=mix1$sigma_scaled$Rowf, Gtc=mm)
#                       + vs(Colf,Gt=mix1$sigma_scaled$Colf, Gtc=mm)
#                       + vs(idd, Gu=D, Gtc=unsm(1)),
#               rcov=~vs(units,Gt=mix1$sigma_scaled$units, Gtc=mm),
#               data=DT)
# summary(mix2)
# 
# ####====================####
# #### multivariate model ####
# ####     2 traits       ####
# ####====================####
# #### be patient take some time
# ans.m <- mmer(cbind(Yield,color)~1,
#                random=~ vs(id, Gu=A)
#                + vs(Rowf,Gtc=diag(2))
#                + vs(Colf,Gtc=diag(2)),
#                rcov=~ vs(units),
#                data=DT)
# cov2cor(ans.m$sigma$`u:id`)
# 



