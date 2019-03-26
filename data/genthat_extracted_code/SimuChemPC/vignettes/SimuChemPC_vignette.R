### R code from vignette source 'SimuChemPC_vignette.Rnw'

###################################################
### code chunk number 1: SimuChemPC_vignette.Rnw:29-31
###################################################
library(rcdk)
library(SimuChemPC)


###################################################
### code chunk number 2: SimuChemPC_vignette.Rnw:38-42
###################################################
SDF_file = system.file("extdata", "sample.sdf" , package="SimuChemPC")
mols <- load.molecules(SDF_file)
length(mols)
mols=mols[1:20]


###################################################
### code chunk number 3: SimuChemPC_vignette.Rnw:48-51
###################################################
descNames <- c('org.openscience.cdk.qsar.descriptors.molecular.WeightedPathDescriptor')
descNames
features <- eval.desc(mols, descNames)


###################################################
### code chunk number 4: SimuChemPC_vignette.Rnw:57-58
###################################################
get.properties(mols[[1]])


###################################################
### code chunk number 5: SimuChemPC_vignette.Rnw:63-65
###################################################
get.property(mols[[1]], "Potency[nM]")
get.property(mols[[1]], "cr_index")


###################################################
### code chunk number 6: SimuChemPC_vignette.Rnw:70-77
###################################################
p = data.frame()

for (i in 1:length(mols)) 
{
 Potency = get.property(mols[[i]], "Potency[nM]");
 p = rbind(p, data.frame(Potency))
}


###################################################
### code chunk number 7: SimuChemPC_vignette.Rnw:84-88
###################################################
datafile <- cbind(features, p)

dim(datafile)
datafile[1:5,]


###################################################
### code chunk number 8: SimuChemPC_vignette.Rnw:97-111
###################################################
len <- dim(datafile)[1]
len

half <- dim(datafile)[1] / 2
half

col <- dim(datafile)[2]
col

xTrain <- datafile[1:half, 1:(col-1)]
yTrain <- as.matrix(as.numeric(array(datafile[1:half, col])))

xTest <- datafile[(half+1):len, (1:col-1)]
yTest <- as.matrix(as.numeric(array(datafile[(half+1):len, col])))


###################################################
### code chunk number 9: SimuChemPC_vignette.Rnw:117-120
###################################################
loghyper = trainChemPC(xTrain, yTrain)

loghyper


###################################################
### code chunk number 10: SimuChemPC_vignette.Rnw:136-140
###################################################
predictChemPC(xTrain, yTrain, xTest, loghyper, method="RA")
predictChemPC(xTrain, yTrain, xTest, loghyper, method="NN")
predictChemPC(xTrain, yTrain, xTest, loghyper, method="GP")
predictChemPC(xTrain, yTrain, xTest, loghyper, method="EI")


###################################################
### code chunk number 11: SimuChemPC_vignette.Rnw:161-183
###################################################
dataX <- datafile[, 1:(col-1)]
dataY <- as.matrix(as.numeric(array(datafile[, col])))

dim(dataX)

dim(dataY)

rank <- SimuChemPC(dataX, dataY, "RA", 5)
dim(rank)
rank[1:5,]

rank <- SimuChemPC(dataX, dataY, "NN", 5)
dim(rank)
rank[1:5,]

rank <- SimuChemPC(dataX, dataY, "GP", 5)
dim(rank)
rank[1:5,]

rank <- SimuChemPC(dataX, dataY, "EI", 5)
dim(rank)
rank[1:5,]


###################################################
### code chunk number 12: SimuChemPC_vignette.Rnw:203-204
###################################################
options(width=65)


###################################################
### code chunk number 13: SimuChemPC_vignette.Rnw:206-207
###################################################
sessionInfo()


