library(sommer)


### Name: DT_h2
### Title: Broad sense heritability calculation.
### Aliases: DT_h2
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####
data(DT_h2)
head(DT)
# ####=========================================####
# #### fit the mixed model (very heavy model)
# ####=========================================####
# ans1 <- mmer(y~Env,
#               random=~vs(ds(Env),Name) + vs(ds(Env),Block),
#               rcov=~vs(ds(Env),units),
#               data=DT)
# summary(ans1)




