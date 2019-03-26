library(agridat)


### Name: denis.missing
### Title: Multi-environment trial with structured missing values
### Aliases: denis.missing

### ** Examples


data(denis.missing)
dat <- denis.missing

# view missingness structure
if(require(reshape2)){
  acast(dat, env~gen, value.var='yield')
}


require(lattice)
redblue <- colorRampPalette(c("firebrick", "lightgray", "#375997"))
levelplot(yield ~ gen*env, data=dat,
          col.regions=redblue,
          main="denis.missing - incidence heatmap")

# stability variance (Table 3 in Piepho)
require("nlme")
m1 <- lme(yield ~ -1 + gen, data=dat, random= ~ 1|env,
          weights = varIdent(form= ~ 1|gen),
          na.action=na.omit)
svar <- m1$sigma^2 * c(1, coef(m1$modelStruct$varStruct, unc = FALSE))^2
round(svar, 2)
##          G5    G3    G1    G2
## 39.25 22.95 54.36 12.17 23.77

# m2 <- asreml(yield ~ gen, random = ~ env + at(gen):env, data=dat)




