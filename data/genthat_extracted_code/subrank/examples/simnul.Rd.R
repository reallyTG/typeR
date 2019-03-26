library(subrank)


### Name: simnul
### Title: Test statistic distribution under independence hypothesis
### Aliases: simnul

### ** Examples

library(datasets)
# plot(swiss)
c=corc(swiss,1:3,8)
c
RV=sum(c$cop*log(c$cop),na.rm=TRUE)+3*log(8)
sims=simnul(47,3,8,100)
pvalue=mean(RV<sims$lrs)
pvalue
RV
summary(sims$lrs)



