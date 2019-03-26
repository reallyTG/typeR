library(sommer)


### Name: DT_example
### Title: Broad sense heritability calculation.
### Aliases: DT_example
### Keywords: datasets

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
#               random= ~ vs(Name) + vs(EnvName),
#               rcov= ~ vs(units),
#               data=DT)
# summary(ans4)
# 
# ####=============================================####
# #### Multivariate heterogeneous variance models  ####
# ####=============================================####
# 
# ## Multivariate Compound simmetry (CS) + Diagonal (DIAG) model
# ans5 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(Name) + vs(ds(Env),Name),
#               rcov= ~ vs(ds(Env),units),
#               data=DT)
# summary(ans5)
# 
# ####===========================================####
# #### Multivariate unstructured variance models ####
# ####===========================================####
# 
# ans6 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(us(Env),Name),
#               rcov= ~ vs(ds(Env),units),
#               data=DT)
# summary(ans6)




