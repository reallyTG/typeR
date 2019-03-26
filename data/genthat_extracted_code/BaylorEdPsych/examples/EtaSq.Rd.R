library(BaylorEdPsych)


### Name: EtaSq
### Title: (Partial) Eta Squared
### Aliases: EtaSq 'Effect Size' ANOVA
### Keywords: Eta Squared Partial Eta Squared Effect Size

### ** Examples

data(MLBOffense2011)
groupRBI<-aov(RBI~Tm, data=MLBOffense2011, subset=c(Tm=="ARI" | Tm=="TOT" | Tm=="SFG"))
EtaSq(groupRBI)



