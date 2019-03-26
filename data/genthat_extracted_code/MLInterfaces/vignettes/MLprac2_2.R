### R code from vignette source 'MLprac2_2.Rnw'

###################################################
### code chunk number 1: intro1
###################################################
library("MASS")
data("crabs")
dim(crabs)
crabs[1:4,]
table(crabs$sex)


###################################################
### code chunk number 2: figbwplot
###################################################
library("lattice")
print(bwplot(RW~sp|sex, data=crabs))


###################################################
### code chunk number 3: dop
###################################################
m1 = glm(sp~RW, data=crabs, family=binomial)
summary(m1)


###################################################
### code chunk number 4: domods
###################################################
plot(predict(m1,type="response"), crabs$sp)
table(predict(m1,type="response")>.5, crabs$sp)
m2 = update(m1, subset=(sex=="F"))
table(predict(m2,type="response")>.5, crabs$sp[crabs$sex=="F"])


###################################################
### code chunk number 5: doml1
###################################################
library(MLInterfaces)
fcrabs = crabs[crabs$sex == "F", ]
ml1 = MLearn( sp~RW, fcrabs, glmI.logistic(thresh=.5), c(1:30, 51:80), 
              family=binomial)
ml1
confuMat(ml1)


###################################################
### code chunk number 6: doscra
###################################################
set.seed(123)
sfcrabs = fcrabs[ sample(nrow(fcrabs)),  ]


###################################################
### code chunk number 7: domods
###################################################
sml1 = MLearn( sp~RW, sfcrabs, glmI.logistic(thresh=.5), 
  c(1:30, 51:80), 
  family=binomial)
confuMat(sml1)
smx1 = MLearn( sp~RW, sfcrabs, glmI.logistic(thresh=.5), 
  xvalSpec("LOG", 5, function(data, clab, iternum) { 
    which(rep(1:5, each=20) == iternum) }), 
  family=binomial)
confuMat(smx1)


###################################################
### code chunk number 8: figdopa
###################################################
pairs(crabs[,-c(1:3)], col=ifelse(crabs$sp=="B", "blue", "orange"))


###################################################
### code chunk number 9: dopc
###################################################
pc1 = prcomp( crabs[,-c(1:3)] )


###################################################
### code chunk number 10: figdopc
###################################################
pairs(pc1$x, col=ifelse(crabs$sp=="B", "blue", "orange"))


###################################################
### code chunk number 11: figdobi
###################################################
biplot(pc1, choices=2:3, col=c("#80808080", "red"))


###################################################
### code chunk number 12: checkClaim
###################################################
stopifnot(eval(formals(heatmap)$scale)[1]=="row")


###################################################
### code chunk number 13: figdohm
###################################################
X = data.matrix(crabs[,-c(1:3)])
heatmap(t(X), 
    ColSideColors=ifelse(crabs$sp=="O", "orange", "blue"),
    col = colorRampPalette(c("blue", "white", "red"))(255))


###################################################
### code chunk number 14: docl
###################################################
cl = hclust(dist(X))
tr = cutree(cl,2)
table(tr)


###################################################
### code chunk number 15: dos
###################################################
library(cluster)
sil = silhouette( tr, dist(X) )
plot(sil)


###################################################
### code chunk number 16: newes
###################################################
feat2 = t(data.matrix(crabs[, -c(1:3)]))
pd2 = new("AnnotatedDataFrame", crabs[,1:2])
crES = new("ExpressionSet", exprs=feat2, phenoData=pd2)
crES$spsex = paste(crES$sp, crES$sex, sep=":")
table(crES$spsex)


###################################################
### code chunk number 17: doper
###################################################
set.seed(1234)
crES = crES[ , sample(1:200, size=200, replace=FALSE)]


###################################################
### code chunk number 18: dotr
###################################################
library(rpart)
tr1 = MLearn(spsex~., crES, rpartI, 1:140)
tr1
confuMat(tr1)


###################################################
### code chunk number 19: doplTree
###################################################
plot(RObject(tr1))
text(RObject(tr1))


###################################################
### code chunk number 20: doccp
###################################################
plotcp(RObject(tr1))


###################################################
### code chunk number 21: dorf
###################################################
set.seed(124)
library(randomForest)
rf1 = MLearn(spsex~., crES, randomForestI, 1:140 )
rf1
cm = confuMat(rf1)
cm


###################################################
### code chunk number 22: dold
###################################################
ld1 = MLearn(spsex~., crES, ldaI, 1:140 )
ld1
confuMat(ld1)
xvld = MLearn( spsex~., crES, ldaI, xvalSpec("LOG", 5, balKfold.xvspec(5)))
confuMat(xvld)


###################################################
### code chunk number 23: dnn
###################################################
nn1 = MLearn(spsex~., crES, nnetI, 1:140, size=3, decay=.1)
nn1
RObject(nn1)
confuMat(nn1)


###################################################
### code chunk number 24: doxx
###################################################
xvnnBAD = MLearn( spsex~., crES, nnetI, 
    xvalSpec("LOG", 5, function(data, clab, iternum) {
      which( rep(1:5,each=40) == iternum ) }),
      size=3, decay=.1 )
xvnnGOOD = MLearn( spsex~., crES, nnetI, 
    xvalSpec("LOG", 5, balKfold.xvspec(5) ),
      size=3, decay=.1 )


###################################################
### code chunk number 25: lktann
###################################################
confuMat(xvnnBAD)
confuMat(xvnnGOOD)


###################################################
### code chunk number 26: dnn
###################################################
sv1 = MLearn(spsex~., crES, svmI, 1:140)
sv1
RObject(sv1)
confuMat(sv1)


###################################################
### code chunk number 27: doxxs
###################################################
xvsv = MLearn( spsex~., crES, svmI, xvalSpec("LOG", 5,
    balKfold.xvspec(5)))


###################################################
### code chunk number 28: lktasv
###################################################
confuMat(xvsv)


###################################################
### code chunk number 29: setupALL
###################################################
library("ALL")
data("ALL")
bALL = ALL[, substr(ALL$BT,1,1) == "B"]
fus = bALL[, bALL$mol.biol %in% c("BCR/ABL", "NEG")]
fus$mol.biol = factor(fus$mol.biol)
fus


###################################################
### code chunk number 30: getq
###################################################
mads = apply(exprs(fus),1,mad)
fusk = fus[ mads > sort(mads,decr=TRUE)[300], ]
fcol = ifelse(fusk$mol.biol=="NEG", "green", "red")


###################################################
### code chunk number 31: dohALL (eval = FALSE)
###################################################
## heatmap(exprs(fusk), ColSideColors=fcol)


###################################################
### code chunk number 32: dopcALL
###################################################
PCg = prcomp(t(exprs(fusk)))


###################################################
### code chunk number 33: lkscre
###################################################
plot(PCg)


###################################################
### code chunk number 34: lkprALL
###################################################
pairs(PCg$x[,1:5],col=fcol,pch=19)


###################################################
### code chunk number 35: dobiALL
###################################################
biplot(PCg)


###################################################
### code chunk number 36: dld1
###################################################
dld1 = MLearn( mol.biol~., fusk, dldaI, 1:40 )


###################################################
### code chunk number 37: dld2
###################################################
dld1
confuMat(dld1)


###################################################
### code chunk number 38: dld3
###################################################
nnALL = MLearn( mol.biol~., fusk, nnetI, 1:40, size=5, decay=.01,
  MaxNWts=2000 )


###################################################
### code chunk number 39: dld4
###################################################
confuMat(nnALL)


###################################################
### code chunk number 40: dld5
###################################################
rfALL = MLearn( mol.biol~., fusk, randomForestI, 1:40 )


###################################################
### code chunk number 41: dld6
###################################################
rfALL
confuMat(rfALL)


###################################################
### code chunk number 42: lkrda
###################################################
set.seed(1234)
rdaALL = MLearn( mol.biol~., fusk, rdacvI, 1:40 )


###################################################
### code chunk number 43: lkrda2
###################################################
rdaALL
confuMat(rdaALL)


###################################################
### code chunk number 44: getgl
###################################################
library(hgu95av2.db)
psid = RObject(rdaALL)$keptFeatures
psid = gsub("^X", "", psid) # make.names is run inopportunely
mget(psid, hgu95av2GENENAME, ifnotfound=NA)[1:5]


###################################################
### code chunk number 45: getko
###################################################
library(keggorthology)
data(KOgraph)
adj(KOgraph, nodes(KOgraph)[1])
EIP = getKOprobes("Environmental Information Processing")
GIP = getKOprobes("Genetic Information Processing")
length(intersect(EIP, GIP))
EIPi = setdiff(EIP, GIP)
GIP = setdiff(GIP, EIP)
EIP = EIPi
Efusk = fusk[ featureNames(fusk) %in% EIP, ]
Gfusk = fusk[ featureNames(fusk) %in% GIP, ]


###################################################
### code chunk number 46: dofs
###################################################
dldFS = MLearn( mol.biol~., fusk, dldaI, xvalSpec("LOG", 5,
   balKfold.xvspec(5), fs.absT(30) ))
dldFS
confuMat(dld1)
confuMat(dldFS)


###################################################
### code chunk number 47: lksess
###################################################
sessionInfo()


