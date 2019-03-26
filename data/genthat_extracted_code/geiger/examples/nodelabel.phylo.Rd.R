library(geiger)


### Name: nodelabel.phylo
### Title: Blending information from taxonomies and trees
### Aliases: nodelabel.phylo lookup.phylo phylo.lookup phylo.clades
###   glomogram.phylo
### Keywords: data graphs manip

### ** Examples

sal=get(data(caudata))
print(head(sal$tax))

## TREE from TABLE: phylo.lookup()
tax=cbind(sal$tax[,c("subfamily", "family", "suborder")], order="Caudata")
tphy=phylo.lookup(tax, ncores=2)
print(tphy)
head(tphy$node.label)

## TABLE from TREE: lookup.phylo()
tax=sal$tax[,c("genus", "family")]
cld=list(
	Sirenoidea=c("Siren", "Pseudobranchus"), 
	Salamandroidea=c("Ambystomatidae", "Plethodontidae"), 
	Cryptobranchoidea=c("Hynobius_naevius", "Cryptobranchus_alleganiensis"),
	CAUDATA=c("Sirenoidea","Salamandroidea","Cryptobranchoidea")
)
lkp=lookup.phylo(sal$phy, taxonomy=tax, clades=cld, ncores=2)
print(lkp)
nphy=nodelabel.phylo(sal$phy, lkp, ncores=2)
dev.new()
plot.phylo(ladderize(nphy,right=FALSE), cex=0.35, 
type="fan", label.offset=2.5, no.margin=TRUE, edge.color="gray", edge.width=0.5)

nodelabels(nphy$node.label, cex=0.45, col="red", frame="n")

## CLADES to TREE: phylo.clades()
fmrca=geiger:::.mrca
salamandroidea=extract.clade(nphy, fmrca(c("Ambystomatidae", "Plethodontidae"), nphy))
cryptobranchoidea=extract.clade(nphy, fmrca(c("Cryptobranchidae", "Hynobiidae"), nphy))
siren=extract.clade(nphy, fmrca(c("Siren_lacertina", "Siren_intermedia"), nphy))

clades=list(
			 Sirenoidea=c("Siren", "Pseudobranchus"), 
			 Caudata=c("Sirenoidea","Salamandroidea","Cryptobranchoidea"),
			 AMPHIBIA=c("Caudata","Anura","Gymnophiona")
)

phy=list(Cryptobranchoidea=cryptobranchoidea, Salamandroidea=salamandroidea, Siren=siren)
class(phy)="multiPhylo"

res=phylo.clades(clades, phy, ncores=2)
amph=nodelabel.phylo(res$AMPHIBIA, lkp, ncores=2)
print(amph$FUN("Salamandroidea"))
dev.new()
plot(ladderize(amph, right=FALSE), cex=0.2, label.offset=0.05)
nodelabels(amph$node.label, cex=0.35, col="red", frame="n")


## GLOMOGRAM
sirenidae=extract.clade(nphy, fmrca(c("Siren_lacertina", "Pseudobranchus_axanthus"), nphy))
ambystomatidae=extract.clade(nphy, fmrca(c("Ambystoma_gracile", "Ambystoma_texanum"), nphy))
trees=list(
	Cryptobranchoidea=cryptobranchoidea,
	Sirenidae=sirenidae,
	Ambystomatidae=ambystomatidae
)
class(trees)="multiPhylo"

fam=sal$fam
ftax=unique(sal$tax[,c("family", "suborder")])
rownames(ftax)=unname(ftax[,"family"])
fam=nodelabel.phylo(fam, ftax, ncores=2)
fam$FUN("Salamandroidea")

res=glomogram.phylo(fam, trees)
dev.new()
zz=match(res$tip.label, fam$tip.label)
cc=integer(length(zz))
cc[!is.na(zz)]=1

plot(ladderize(res, right=FALSE), cex=1, label.offset=5, tip.color=ifelse(cc==1, "red", "black"))



