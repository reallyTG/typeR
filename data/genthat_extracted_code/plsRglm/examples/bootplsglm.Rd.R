library(plsRglm)


### Name: bootplsglm
### Title: Non-parametric Bootstrap for PLS generalized linear models
### Aliases: bootplsglm
### Keywords: models

### ** Examples

#Imputed aze dataset
data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y

dataset <- cbind(y=yaze_compl,Xaze_compl)
modplsglm <- plsRglm(y~.,data=dataset,3,modele="pls-glm-logistic")

library(boot)
# Bastien (Y,T) PLS bootstrap
aze_compl.bootYT <- bootplsglm(modplsglm, R=250)
boxplots.bootpls(aze_compl.bootYT)
confints.bootpls(aze_compl.bootYT)
plots.confints.bootpls(confints.bootpls(aze_compl.bootYT))

## No test: 
plot(aze_compl.bootYT,index=2)
jack.after.boot(aze_compl.bootYT, index=2, useJ=TRUE, nt=3)
plot(aze_compl.bootYT, index=2,jack=TRUE)
aze_compl.tilt.boot <- tilt.bootplsglm(modplsglm, statistic=coefs.plsRglm, 
R=c(499, 100, 100), alpha=c(0.025, 0.975), sim="ordinary", stype="i", index=1)

# PLS bootstrap balanced
aze_compl.bootYT <- bootplsglm(modplsglm, sim="balanced", R=250)
boxplots.bootpls(aze_compl.bootYT)
confints.bootpls(aze_compl.bootYT)
plots.confints.bootpls(confints.bootpls(aze_compl.bootYT))


plot(aze_compl.bootYT)
jack.after.boot(aze_compl.bootYT, index=1, useJ=TRUE, nt=3)
plot(aze_compl.bootYT,jack=TRUE)
aze_compl.tilt.boot <- tilt.bootplsglm(modplsglm, statistic=coefs.plsR,
R=c(499, 100, 100), alpha=c(0.025, 0.975), sim="balanced", stype="i", index=1)


# PLS permutation bootstrap

aze_compl.bootYT <- bootplsglm(modplsglm, sim="permutation", R=250)
boxplots.bootpls(aze_compl.bootYT)
plot(aze_compl.bootYT)


#Original aze dataset with missing values
data(aze)
Xaze<-aze[,2:34]
yaze<-aze$y

library(boot)
modplsglm2 <- plsRglm(yaze,Xaze,3,modele="pls-glm-logistic")
aze.bootYT <- bootplsglm(modplsglm2, R=250)
boxplots.bootpls(aze.bootYT)
confints.bootpls(aze.bootYT)
plots.confints.bootpls(confints.bootpls(aze.bootYT))




#Ordinal logistic regression
data(bordeaux)
Xbordeaux<-bordeaux[,1:4]
ybordeaux<-factor(bordeaux$Quality,ordered=TRUE)
dataset <- cbind(y=ybordeaux,Xbordeaux)
options(contrasts = c("contr.treatment", "contr.poly"))
modplsglm3 <- plsRglm(ybordeaux,Xbordeaux,1,modele="pls-glm-polr")
bordeaux.bootYT<- bootplsglm(modplsglm3, sim="permutation", R=250)
boxplots.bootpls(bordeaux.bootYT)
boxplots.bootpls(bordeaux.bootYT,ranget0=TRUE)

bordeaux.bootYT2<- bootplsglm(modplsglm3, sim="permutation", R=250, 
strata=unclass(ybordeaux))
boxplots.bootpls(bordeaux.bootYT2,ranget0=TRUE)


if(require(chemometrics)){
data(hyptis)
hyptis
yhyptis <- factor(hyptis$Group,ordered=TRUE)
Xhyptis <- as.data.frame(hyptis[,c(1:6)])
dataset <- cbind(y=yhyptis,Xhyptis)
options(contrasts = c("contr.treatment", "contr.poly"))
modplsglm4 <- plsRglm(yhyptis,Xhyptis,3,modele="pls-glm-polr")
hyptis.bootYT3<- bootplsglm(modplsglm4, sim="permutation", R=250)
rownames(hyptis.bootYT3$t0)<-c("Sabi\nnene","Pin\nene",
"Cine\nole","Terpi\nnene","Fenc\nhone","Terpi\nnolene")
boxplots.bootpls(hyptis.bootYT3)
boxplots.bootpls(hyptis.bootYT3,xaxisticks=FALSE)
boxplots.bootpls(hyptis.bootYT3,ranget0=TRUE)
boxplots.bootpls(hyptis.bootYT3,ranget0=TRUE,xaxisticks=FALSE)
}
## End(No test)



