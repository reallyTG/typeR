library(lmec)


### Name: lmec
### Title: Linear Mixed-Effects Models with Censored Responses
### Aliases: lmec
### Keywords: models

### ** Examples

data(UTIdata)
UTIdata <- subset(UTIdata, !is.na(RNA))
o <- order(UTIdata$Patid, UTIdata$Fup)
UTIdata <- UTIdata[o,]
cens = (UTIdata$RNAcens==1)+0
y = log10(UTIdata$RNA)
X = cbind((UTIdata$Fup==0)+0, (UTIdata$Fup==1)+0, (UTIdata$Fup==3)+0, (UTIdata$Fup==6)+0, (UTIdata$Fup==9)+0, (UTIdata$Fup==12)+0, (UTIdata$Fup==18)+0, (UTIdata$Fup==24)+0)
Z = matrix(rep(1, length(y)), ncol=1)
cluster = as.numeric(UTIdata$Patid)
fit = lmec(yL=y,cens=cens, X=X, Z=Z, cluster=cluster, method='ML', maxstep=40)



