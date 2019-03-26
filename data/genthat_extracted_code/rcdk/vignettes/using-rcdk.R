## ------------------------------------------------------------------------
library(rcdk)

## ----echo=FALSE----------------------------------------------------------
data(bpdata)
str(bpdata)

## ---- eval=FALSE---------------------------------------------------------
#  mols <- load.molecules( c('data1.sdf', '/some/path/data2.sdf') )

## ----eval=FALSE----------------------------------------------------------
#  iter <- iload.molecules('verybig.sdf', type='sdf')
#  while(hasNext(iter)) {
#   mol <- nextElem(iter)
#   print(get.property(mol, "cdk:Title"))
#  }

## ----eval=FALSE----------------------------------------------------------
#  smile <- 'c1ccccc1CC(=O)C(N)CC1CCCCOC1'
#  mol <- parse.smiles(smile)[[1]]

## ----eval=FALSE----------------------------------------------------------
#  options("java.parameters"=c("-Xmx4000m"))
#  library(rcdk)
#  for (smile in smiles) {
#      m <- parse.smiles(smile)
#      ## perform operations on this molecule
#  
#      jcall("java/lang/System","V","gc")
#      gc()
#  }

## ----eval=FALSE----------------------------------------------------------
#  write.molecules(mols, filename='mymols.sdf')

## ----eval=FALSE----------------------------------------------------------
#   write.molecules(mols, filename='mymols.sdf', together=FALSE)

## ------------------------------------------------------------------------
smiles <- c('CCC', 'c1ccccc1', 'CCCC(C)(C)CC(=O)NC')
mols <- parse.smiles(smiles)
get.smiles(mols[[1]])
unlist(lapply(mols, get.smiles))

## ------------------------------------------------------------------------
smiles <- c('CCC', 'c1ccccc1', 'CCc1ccccc1CC(C)(C)CC(=O)NC')
mols <- parse.smiles(smiles)
get.smiles(mols[[3]], smiles.flavors(c('UseAromaticSymbols')))
get.smiles(mols[[3]], smiles.flavors(c('Generic','CxSmiles')))

## ------------------------------------------------------------------------
m <- parse.smiles('CCC')[[1]]
m <- generate.2d.coordinates(m)
get.smiles(m, smiles.flavors(c('CxSmiles')))
get.smiles(m, smiles.flavors(c('CxCoordinates')))

## ----eval=FALSE----------------------------------------------------------
#  smiles <- c('CCC', 'CCN', 'CCN(C)(C)',
#              'c1ccccc1Cc1ccccc1',
#              'C1CCC1CC(CN(C)(C))CC(=O)CC')
#  mols <- parse.smiles(smiles)
#  view.molecule.2d(mols[[1]])
#  view.molecule.2d(mols)

## ----eval=FALSE----------------------------------------------------------
#  depictor <- get.depictor(style='cob', abbr='reagents', width=300, height=300)
#  view.molecule.2d(mols[[5]], depictor=depictor)

## ----eval=FALSE----------------------------------------------------------
#  depictor <- get.depictor(style='cob', abbr='reagents', width=300, height=300)
#  view.molecule.2d(mols[[5]], depictor=depictor)
#  depictor$setStyle('cow')
#  view.molecule.2d(mols[[5]], depictor=depictor)

## ----eval=FALSE----------------------------------------------------------
#  depictor <- get.depictor(style='cob', abbr='reagents', sma='N(C)(C)')
#  view.molecule.2d(mols, depictor=depictor)

## ----eval=FALSE----------------------------------------------------------
#  smiles <- c('CCC', 'CCN', 'CCN(C)(C)','c1ccccc1Cc1ccccc1')
#  mols <- parse.smiles(smiles)
#  dframe <- data.frame(x = runif(4),
#    toxicity = factor(c('Toxic', 'Toxic', 'Nontoxic', 'Nontoxic')),
#    solubility = c('yes', 'yes', 'no', 'yes'))
#  view.table(mols, dframe)

## ------------------------------------------------------------------------
img <- view.image.2d(parse.smiles("B([C@H](CC(C)C)NC(=O)[C@H](CC1=CC=CC=C1)NC(=O)C2=NC=CN=C2)(O)O")[[1]])
plot(1:10, 1:10, pch=19)
rasterImage(img, 1,6, 5,10)

## ------------------------------------------------------------------------
mol <- parse.smiles('c1ccccc1')[[1]]
set.property(mol, "title", "Molecule 1")
set.property(mol, "hvyAtomCount", 6)
get.property(mol, "title")

## ------------------------------------------------------------------------
get.properties(mol)

## ----eval=FALSE----------------------------------------------------------
#  write.molecules(mol, 'tagged.sdf', write.props=TRUE)

## ------------------------------------------------------------------------
mol <- parse.smiles('c1ccccc1C(Cl)(Br)c1ccccc1')[[1]]
atoms <- get.atoms(mol)
bonds <- get.bonds(mol)
cat('No. of atoms =', length(atoms), '\n')
cat('No. of bonds =', length(bonds), '\n')

## ------------------------------------------------------------------------
unlist(lapply(atoms, get.symbol))

## ------------------------------------------------------------------------
coords <- get.point3d(atoms[[1]])

## ------------------------------------------------------------------------
coords <- do.call('rbind', lapply(atoms, get.point3d))

## ------------------------------------------------------------------------
if ( any(apply(coords, 2, function(x) length(unique(x))) == 1) ) {
    print("molecule is flat")
}

## ------------------------------------------------------------------------
mols <- parse.smiles(c('CC(C)(C)C','c1ccc(Cl)cc1C(=O)O', 'CCC(N)(N)CC'))
query <- '[#6D2]'
matches(query, mols)

## ------------------------------------------------------------------------
dc <- get.desc.categories()
dc

## ------------------------------------------------------------------------
dn <- get.desc.names(dc[4])
dn

## ----eval=FALSE----------------------------------------------------------
#  aDesc <- eval.desc(mol, dn[4])
#  allDescs <- eval.desc(mol, dn)

## ------------------------------------------------------------------------
descNames <- unique(unlist(sapply(get.desc.categories(), get.desc.names)))

## ------------------------------------------------------------------------
data(bpdata)
mols <- parse.smiles(bpdata[,1])
descNames <- c(
 'org.openscience.cdk.qsar.descriptors.molecular.KierHallSmartsDescriptor',
 'org.openscience.cdk.qsar.descriptors.molecular.APolDescriptor',
 'org.openscience.cdk.qsar.descriptors.molecular.HBondDonorCountDescriptor')
descs <- eval.desc(mols, descNames)
class(descs)
dim(descs)

## ------------------------------------------------------------------------
mol <- parse.smiles('CC(=O)CC(=O)NCN')[[1]]
convert.implicit.to.explicit(mol)
get.tpsa(mol)
get.xlogp(mol)
get.alogp(mol)

## ------------------------------------------------------------------------
descs <- descs[, !apply(descs, 2, function(x) any(is.na(x)) )]
descs <- descs[, !apply( descs, 2, function(x) length(unique(x)) == 1 )]
r2 <- which(cor(descs)^2 > .6, arr.ind=TRUE)
r2 <- r2[ r2[,1] > r2[,2] , ]
descs <- descs[, -unique(r2[,2])]

## ------------------------------------------------------------------------
model <- lm(BP ~ khs.sCH3 + khs.sF + apol + nHBDon, data.frame(bpdata, descs))
summary(model)
plot(bpdata$BP, predict(model, descs),
     xlab="Observed BP", ylab="Predicted BP",
     pch=19, xlim=c(100, 700), ylim=c(100, 700))
abline(0,1, col='red')

## ------------------------------------------------------------------------
data(bpdata)
mols <- parse.smiles(bpdata[,1])
fps <- lapply(mols, get.fingerprint, type='circular')

## ------------------------------------------------------------------------
fp.sim <- fingerprint::fp.sim.matrix(fps, method='tanimoto')
fp.dist <- 1 - fp.sim

## ------------------------------------------------------------------------
cls <- hclust(as.dist(fp.dist))
plot(cls, main='A Clustering of the BP dataset', labels=FALSE)

## ------------------------------------------------------------------------
query.mol <- parse.smiles('CC(=O)')[[1]]
target.mols <- parse.smiles(bpdata[,1])
query.fp <- get.fingerprint(query.mol, type='circular')
target.fps <- lapply(target.mols, get.fingerprint, type='circular')
sims <- data.frame(sim=do.call(rbind, lapply(target.fps,
     fingerprint::distance,
     fp2=query.fp, method='tanimoto')))
subset(sims, sim >= 0.3)

