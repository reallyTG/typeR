library(tukeytrend)


### Name: tukeytrendformula
### Title: Fit multiple marginal models with differently re-scaled dose
###   variable.
### Aliases: tukeytrendformula
### Keywords: htest

### ** Examples

data(litter, package="multcomp")

# compare

dl <- litter
dl$dosen <- as.numeric(as.character(dl$dose))

ttlitter <- tukeytrendformula(weight ~ dosen + number, data=dl, model="lm", dose="dosen", 
 scaling=c("ari", "ord", "log", "treat"), ctype="Dunnett")

summary(asglht(ttlitter))




