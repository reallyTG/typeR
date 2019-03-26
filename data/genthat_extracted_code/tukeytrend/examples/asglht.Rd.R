library(tukeytrend)


### Name: asglht
### Title: Coerce object of class 'tukeytrend' to 'glht'
### Aliases: asglht
### Keywords: misc

### ** Examples

data(litter, package="multcomp")
dl <- litter
dl$dosen <- as.numeric(as.character(dl$dose))
fit <- lm(weight ~ dosen + number, data=dl)
ttlitter <- tukeytrendfit(fit, dose="dosen", 
 scaling=c("ari", "ord", "log"))

# instead of transferring individual elements from the
# tukeytrend output into the arguments of glht , ...
# comp1 <- glht(model=ttlitter$mmm, linfct=ttlitter$mlf,
# df=round(mean(ttlitter$df)), alternative="less")
# summary(comp1)

# ... you can just use:
comp2 <- asglht(ttlitter, alternative="less")
summary(comp2)





