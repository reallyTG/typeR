library(sommer)


### Name: mmer
### Title: *m*ixed *m*odel *e*quations in *R*
### Aliases: mmer

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####

####=========================================####
#### EXAMPLES
#### Different models with sommer
####=========================================####

data(DT_example)
head(DT)

####=========================================####
#### Univariate homogeneous variance models  ####
####=========================================####

## Compound simmetry (CS) model
ans1 <- mmer(Yield~Env,
             random= ~ Name + Env:Name,
             rcov= ~ units,
             data=DT)
summary(ans1)

####===========================================####
#### Univariate heterogeneous variance models  ####
####===========================================####

## Compound simmetry (CS) + Diagonal (DIAG) model
ans2 <- mmer(Yield~Env,
             random= ~Name + vs(ds(Env),Name),
             rcov= ~ vs(ds(Env),units),
             data=DT)
summary(ans2)

####===========================================####
####  Univariate unstructured variance models  ####
####===========================================####

ans3 <- mmer(Yield~Env,
             random=~ vs(us(Env),Name),
             rcov=~vs(us(Env),units), 
             data=DT)
summary(ans3)

# ####==========================================####
# #### Multivariate homogeneous variance models ####
# ####==========================================####
# 
# ## Multivariate Compound simmetry (CS) model
# DT$EnvName <- paste(DT$Env,DT$Name)
# ans4 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(Name, Gtc = unsm(2)) + vs(EnvName,Gtc = unsm(2)),
#               rcov= ~ vs(units, Gtc = unsm(2)),
#               data=DT)
# summary(ans4)
# 
# ####=============================================####
# #### Multivariate heterogeneous variance models  ####
# ####=============================================####
# 
# ## Multivariate Compound simmetry (CS) + Diagonal (DIAG) model
# ans5 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(Name, Gtc = unsm(2)) + vs(ds(Env),Name, Gtc = unsm(2)),
#               rcov= ~ vs(ds(Env),units, Gtc = unsm(2)),
#               data=DT)
# summary(ans5)
# 
# ####===========================================####
# #### Multivariate unstructured variance models ####
# ####===========================================####
# 
# ans6 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(us(Env),Name, Gtc = unsm(2)),
#               rcov= ~ vs(ds(Env),units, Gtc = unsm(2)),
#               data=DT)
# summary(ans6)
# 
# ####=========================================####
# ####=========================================####
# #### EXAMPLE SET 2
# #### 2 variance components
# #### one random effect with variance covariance structure
# ####=========================================####
# ####=========================================####
# 
# data("DT_cpdata")
# head(DT)
# GT[1:4,1:4]
# #### create the variance-covariance matrix
# A <- A.mat(GT)
# #### look at the data and fit the model
# mix1 <- mmer(Yield~1,
#              random=~vs(id, Gu=A) + Rowf,
#              rcov=~units,
#              data=DT)
# summary(mix1)$varcomp
# #### calculate heritability
# pin(mix1, h1 ~ V1/(V1+V3) )
# #### multi trait example
# mix2 <- mmer(cbind(Yield,color)~1,
#               random = ~ vs(id, Gu=A, Gtc = unsm(2)) + # unstructured at trait level
#                             vs(Rowf, Gtc=diag(2)) + # diagonal structure at trait level
#                                 vs(Colf, Gtc=diag(2)), # diagonal structure at trait level
#               rcov = ~ vs(units, Gtc = unsm(2)), # unstructured at trait level
#               data=DT)
# summary(mix2)
# 
# ####=========================================####
# #### EXAMPLE SET 3
# #### comparison with lmer, install 'lme4' 
# #### and run the code below
# ####=========================================####
# 
# #### lmer cannot use var-cov matrices so we will not 
# #### use them in this comparison example
# 
# library(lme4)
# library(sommer)
# data("DT_cornhybrids")
# fm1 <- lmer(Yield ~ Location + (1|GCA1) + (1|GCA2) + (1|SCA),
#             data=DT )
# out <- mmer(Yield ~ Location,
#              random = ~ GCA1 + GCA2 + SCA,
#              rcov = ~ units,
#              data=DT)
# summary(fm1)
# summary(out)
# ### same BLUPs for GCA1, GCA2, SCA than lme4
# plot(out$U$GCA1$Yield, ranef(fm1)$GCA1[,1])
# plot(out$U$GCA2$Yield, ranef(fm1)$GCA2[,1])
# vv=which(abs(out$U$SCA$Yield) > 0)
# plot(out$U$SCA$Yield[vv], ranef(fm1)$SCA[,1])
# 
# ### a more complex model specifying which locations
# head(DT)
# out2 <- mmer(Yield ~ Location,
#               random = ~ vs(at(Location,c("3","4")),GCA2) +
#                          vs(at(Location,c("3","4")),SCA),
#               rcov = ~ vs(ds(Location),units),
#               data=DT)
# summary(out2)





