library(poLCA)


### Name: poLCA.table
### Title: Frequency tables of predicted cell counts from latent class
###   analysis
### Aliases: poLCA.table
### Keywords: methods

### ** Examples

data(gss82)
f <- cbind(PURPOSE,ACCURACY,UNDERSTA,COOPERAT)~1
gss.lc2 <- poLCA(f,gss82,nclass=2)
gss.lc2$predcell

poLCA.table(formula=COOPERAT~1,condition=list(PURPOSE=3,ACCURACY=1,UNDERSTA=2),lc=gss.lc2)

poLCA.table(formula=COOPERAT~UNDERSTA,condition=list(PURPOSE=3,ACCURACY=1),lc=gss.lc2)

poLCA.table(formula=COOPERAT~UNDERSTA,condition=list(),lc=gss.lc2)



