library(adiv)


### Name: rlqESLTP
### Title: Linking Patterns in Phylogeny, Traits, Abiotic Variables and
###   Space
### Aliases: rlqESLTP plot.rlqESLTP summary.rlqESLTP
### Keywords: models

### ** Examples

data(mafragh, package="ade4")
xy <- mafragh$xy
#The object that defines the neighbourhood between plots is in
mneig <- mafragh$neig
#mneig is an object of class neig
s.label(mafragh$xy, nb = mafragh$nb, paxes.draw = FALSE)

#The environmental variables are in
env <- mafragh$env
names(env)
#The abundance data are in
flo <- mafragh$flo
# Adjustement of the writing of species names
names <- gsub(" ", "_", mafragh$spenames[colnames(flo), 1])
for(i in 1:26){
names <- gsub(LETTERS[i], letters[i], names)
}
names <- gsub("alisma_plantago", "alisma_plantago_aquatica", names)
colnames(flo) <- names
#The data on traits are in
traits <- lapply(mafragh$traits, function(x) x[colnames(flo), , drop=FALSE])
#The phylogenetic tree is in
phy <- read.tree(text=mafragh$tre)
plot(phy)

#Traits are separated by statistical type. The object traits is a list of data frames.
tabBinary <- prep.binary(traits$tabBinary, c(3, 4))
tabQuantitative <- traits$tabQuantitative
tabCircular <- prep.circular(traits$tabCircular, 1, 12)
tabOrdinal <- traits$tabOrdinal

#Analyses:
coaflo <- dudi.coa(flo, scan = FALSE, nf = 55)
vecspa <- scores.neig(mneig)
pcaspa <- dudi.pca(vecspa, coaflo$lw, scan = FALSE, nf = 96)
#We first removed environmental variables
env <- env[-(8:10)]
env[4:8] <- log(env[4:8])
pcaenv <- dudi.pca(env, coaflo$lw, scale = FALSE, scan = FALSE, nf = 8)
disT <- dist.ktab(ktab.list.df(list(tabBinary,
tabOrdinal[c("Spikiness", "Hairy leaves")])), c("B", "O"))
# The definition of the functional distances between species 
# were slightly different in Pavoine et al. (2011).

pcotraits <- dudi.pco(disT, coaflo$cw, full = TRUE)
pcophy <- dudi.pco(sqrt(as.dist(cophenetic(phy)[names(flo), names(flo)])/2), coaflo$cw, full = TRUE)


rlqmix <- rlqESLTP(pcaenv, pcaspa, coaflo, pcotraits, pcophy, scan = FALSE, nf = 2)
barplot(rlqmix$eig)
rlqmix$eig[1]/sum(rlqmix$eig)
plot(rlqmix, xy=xy, ax=1, wh="S")
plot(rlqmix, phy=phy, ax=1, wh="P")
plot(rlqmix, traits=tabBinary, ax=1, type="B", wh="T")
plot(rlqmix, traits=tabOrdinal[2:3], ax=1, type="O", wh="T")
plot(rlqmix, env=env, ax=1, type="Q", wh="E")



