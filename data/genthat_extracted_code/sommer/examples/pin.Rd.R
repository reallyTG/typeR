library(sommer)


### Name: pin
### Title: pin functionality
### Aliases: pin

### ** Examples


####=========================================####
####=========================================####
#### EXAMPLE 1
#### simple example with univariate models
####=========================================####
####=========================================####
# data(CPdata)
# #### create the variance-covariance matrix 
# A <- A.mat(CPgeno)
# #### look at the data and fit the model
# head(CPpheno)
# mix1 <- mmer2(Yield~1,
#               random=~g(id), 
#               G=list(id=A), data=CPpheno)
# summary(mix1)
# #### run the pin function
# pin(mix1, h2 ~ V1 / ( V1 + V2 ) )

# ####=========================================####
# ####=========================================####
# #### EXAMPLE 2
# #### simple example with multivariate models
# ####=========================================####
# ####=========================================####
# data(CPdata)
# CPpheno <- CPdata$pheno
# CPgeno <- CPdata$geno
# #### create the variance-covariance matrix 
# A <- A.mat(CPgeno)
# #### look at the data and fit the model
# head(CPpheno)
# mix2 <- mmer2(cbind(Yield,color)~1,
#                random=~us(trait):g(id), 
#                rcov=~us(trait):units,
#                G=list(id=A), 
#               data=CPpheno, MVM=TRUE)
# summary(mix2)
# ## genetic correlation
# pin(mix2, gen.cor ~ V2 / sqrt(V1*V3))
# 
# ####=========================================####
# ####=========================================####
# #### EXAMPLE 3
# #### more complex multivariate model
# ####=========================================####
# ####=========================================####
# data(BTdata)
# mix3 <- mmer2(cbind(tarsus, back) ~ sex,
#                random = ~ us(trait):dam + diag(trait):fosternest,
#                rcov=~us(trait):units,
#                data = BTdata)
# summary(mix3)
# #### calculate the genetic correlation
# pin(mix3, gen.cor ~ V2 / sqrt(V1*V3))
# 
# ####=========================================####
# ####=========================================####
# #### EXAMPLE 4
# #### going back to simple examples
# ####=========================================####
# ####=========================================####
# data(BTdata)
# mix4 <- mmer2(tarsus ~ sex, random = ~ dam + fosternest,
#                data = BTdata) 
# summary(mix4)
# #### calculate the ratio and its SE
# pin(mix4, dam.prop ~ V1 / ( V1 + V2 + V3 ) )




