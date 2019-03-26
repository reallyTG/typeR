library(sommer)


### Name: h2.fun
### Title: Obtain heritabilities with three different methods
### Aliases: h2.fun

### ** Examples


data(DT_example)
head(DT)
# ####=========================================####
# #### fit the mixed model (very heavy model)
# ####=========================================####
# ans1 <- mmer(Yield~Env,
#               random=~vs(ds(Env),Name) + vs(ds(Env),Block),
#               rcov=~vs(ds(Env),units),
#               data=DT)
# summary(ans1)




