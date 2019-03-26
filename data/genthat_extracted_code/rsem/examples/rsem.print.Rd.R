library(rsem)


### Name: rsem.print
### Title: Organize the output for Lavaan with robust s.e. and test
###   statistics
### Aliases: rsem.print

### ** Examples

##\dontrun{
## an example
 data(mardiamv25)
 names(mardiamv25)<-paste('V', 1:5, sep='')
 
 fa.model<-'f1 =~ V1 + V2
f2 =~ V4 + V5 
f1 ~ 1
f2 ~ 1
V1 ~0*1
V2 ~0*1
V4 ~0*1
V5 ~0*1'

pat<-rsem.pattern(mardiamv25)

phi<-0.1
musig<-rsem.emmusig(pat, varphi=phi)

res.lavaan<-sem(fa.model, sample.cov=musig$sigma, sample.mean=musig$mu, sample.nobs=88,mimic='EQS')

ascov<-rsem.Ascov(pat, musig, varphi=phi)

robust.se<-rsem.se(res.lavaan, ascov$Gamma)

robust.fit <- rsem.fit(res.lavaan, ascov$Gamma, musig)

rsem.print(res.lavaan, robust.se, robust.fit)
## }



