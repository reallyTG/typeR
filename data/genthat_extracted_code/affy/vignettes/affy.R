### R code from vignette source 'affy.Rnw'

###################################################
### code chunk number 1: affy.Rnw:118-119
###################################################
library(affy)


###################################################
### code chunk number 2: affy.Rnw:324-325
###################################################
bgcorrect.methods()


###################################################
### code chunk number 3: affy.Rnw:331-334
###################################################
library(affydata)
data(Dilution) ##data included in the package for examples
normalize.methods(Dilution)


###################################################
### code chunk number 4: affy.Rnw:339-340
###################################################
pmcorrect.methods()


###################################################
### code chunk number 5: affy.Rnw:345-346
###################################################
express.summary.stat.methods()


###################################################
### code chunk number 6: affy.Rnw:381-382
###################################################
eset <- mas5(Dilution)


###################################################
### code chunk number 7: affy.Rnw:387-388
###################################################
Calls <- mas5calls(Dilution)


###################################################
### code chunk number 8: affy.Rnw:412-413
###################################################
eset <- rma(Dilution)


###################################################
### code chunk number 9: affy.Rnw:436-437
###################################################
Dilution


###################################################
### code chunk number 10: affy.Rnw:451-453
###################################################
phenoData(Dilution)
pData(Dilution)


###################################################
### code chunk number 11: affy.Rnw:473-475
###################################################
data(Dilution)
MAplot(Dilution,pairs=TRUE,plot.method="smoothScatter")


###################################################
### code chunk number 12: affy.Rnw:490-494
###################################################
Index <- c(1,2,3,100,1000,2000) ##6 arbitrary probe positions
pm(Dilution)[Index,]
mm(Dilution)[Index,]
probeNames(Dilution)[Index]


###################################################
### code chunk number 13: affy.Rnw:503-504
###################################################
sampleNames(Dilution)


###################################################
### code chunk number 14: affy.Rnw:509-510
###################################################
mean(mm(Dilution)>pm(Dilution))


###################################################
### code chunk number 15: affy.Rnw:515-517
###################################################
gn <- geneNames(Dilution)
pm(Dilution, gn[100])


###################################################
### code chunk number 16: affy.Rnw:531-532
###################################################
hist(Dilution[,1:2]) ##PM histogram of arrays 1 and 2


###################################################
### code chunk number 17: affy.Rnw:548-550 (eval = FALSE)
###################################################
## par(mfrow=c(2,2))
## image(Dilution)


###################################################
### code chunk number 18: affy.Rnw:566-568
###################################################
par(mfrow=c(1,1))
boxplot(Dilution, col=c(2,3,4))


###################################################
### code chunk number 19: affy.Rnw:591-593
###################################################
deg <- AffyRNAdeg(Dilution)
names(deg)


###################################################
### code chunk number 20: affy.Rnw:597-598
###################################################
summaryAffyRNAdeg(deg)


###################################################
### code chunk number 21: affy.Rnw:605-606
###################################################
plotAffyRNAdeg(deg)


###################################################
### code chunk number 22: affy.Rnw:620-621
###################################################
Dilution.normalized <- normalize(Dilution)


###################################################
### code chunk number 23: affy.Rnw:667-671
###################################################
gn <- featureNames(Dilution)
ps <- probeset(Dilution, gn[1:2])
#this is what i should be using: ps
show(ps[[1]])


###################################################
### code chunk number 24: affy.Rnw:687-689
###################################################
mylocation <- list("1000_at"=cbind(pm=c(1,2,3),mm=c(4,5,6)),
                   "1001_at"=cbind(pm=c(4,5,6),mm=c(1,2,3)))


###################################################
### code chunk number 25: affy.Rnw:696-698
###################################################
ps <- probeset(Dilution, genenames=c("1000_at","1001_at"),
                 locations=mylocation)


###################################################
### code chunk number 26: affy.Rnw:702-706
###################################################
pm(ps[[1]])
mm(ps[[1]])
pm(ps[[2]])
mm(ps[[2]])


###################################################
### code chunk number 27: affy.Rnw:725-737
###################################################
data(SpikeIn) ##SpikeIn is a ProbeSets
pms <- pm(SpikeIn)
mms <- mm(SpikeIn)

##pms follow concentration
par(mfrow=c(1,2))
concentrations <- matrix(as.numeric(sampleNames(SpikeIn)),20,12,byrow=TRUE)
matplot(concentrations,pms,log="xy",main="PM",ylim=c(30,20000))
lines(concentrations[1,],apply(pms,2,mean),lwd=3)
##so do mms
matplot(concentrations,mms,log="xy",main="MM",ylim=c(30,20000))
lines(concentrations[1,],apply(mms,2,mean),lwd=3)


###################################################
### code chunk number 28: affy.Rnw:771-773
###################################################
cat("HG_U95Av2 is",cleancdfname("HG_U95Av2"),"\n")
cat("HG-133A is",cleancdfname("HG-133A"),"\n")


###################################################
### code chunk number 29: affy.Rnw:777-778
###################################################
cat("HG_U95Av2 is",cleancdfname("HG_U95Av2",addcdf=FALSE),"\n")


###################################################
### code chunk number 30: affy.Rnw:785-788
###################################################
data(cdfenv.example)
ls(cdfenv.example)[1:5]
get(ls(cdfenv.example)[1],cdfenv.example)


###################################################
### code chunk number 31: affy.Rnw:799-802
###################################################
print(Dilution@cdfName)
myenv <- getCdfInfo(Dilution)
ls(myenv)[1:5]


###################################################
### code chunk number 32: affy.Rnw:810-813
###################################################
Index <- pmindex(Dilution)
names(Index)[1:2]
Index[1:2]


###################################################
### code chunk number 33: affy.Rnw:817-818
###################################################
pmindex(Dilution, genenames=c("1000_at","1001_at"))


###################################################
### code chunk number 34: affy.Rnw:822-823
###################################################
mmindex(Dilution, genenames=c("1000_at","1001_at"))


###################################################
### code chunk number 35: affy.Rnw:826-829
###################################################
indexProbes(Dilution, which="pm")[1]
indexProbes(Dilution, which="mm")[1]
indexProbes(Dilution, which="both")[1]


###################################################
### code chunk number 36: affy.Rnw:841-844
###################################################
opt <- getOption("BioC")
affy.opt <- opt$affy
print(names(affy.opt))


###################################################
### code chunk number 37: affy.Rnw:848-853
###################################################
opt <- getOption("BioC")
affy.opt <- opt$affy
affy.opt$normalize.method <- "constant"
opt$affy <- affy.opt
options(BioC=opt)


###################################################
### code chunk number 38: affy.Rnw:859-864
###################################################
opt <- getOption("BioC")
affy.opt <- opt$affy
affy.opt$compress.cel <- TRUE
opt$affy <- affy.opt
options(BioC=opt)


