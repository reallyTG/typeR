library(dmm)


### Name: dmm-package
### Title: Dyadic mixed model analysis for pedigree data
### Aliases: dmm-package
### Keywords: package

### ** Examples


library(dmm)
# simple univariate case, direct from the dataframe
data(dt8bal.df)
dt8.fit <- dmm(dt8bal.df, CWW ~ 1 + Sex,
   components=c("VarE(I)","VarG(Ia)"))  
summary(dt8.fit)  # fixed effect and environmental and additive genetic components
gsummary(dt8.fit) # heritability with se's
rm(dt8.fit)
rm(dt8bal.df)

# Note: 'dt8bal.df is a small demo dataset. Results are 
#        illustrative but not meaningful.
# for more examples see 'dmm' help page and references
# for a tutorial and fully documented examples see {\em dmmOverview.pdf}



