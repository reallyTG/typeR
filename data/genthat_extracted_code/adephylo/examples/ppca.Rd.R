library(adephylo)


### Name: ppca
### Title: Phylogenetic principal component analysis
### Aliases: ppca print.ppca summary.ppca scatter.ppca screeplot.ppca
###   plot.ppca scatter.ppca print.ppca summary.ppca screeplot.ppca
###   plot.ppca
### Keywords: multivariate

### ** Examples


data(lizards)

if(require(ape) && require(phylobase)){

#### ORIGINAL EXAMPLE FROM JOMBART ET AL 2010 ####


## BUILD A TREE AND A PHYLO4D OBJECT
liz.tre <- read.tree(tex=lizards$hprA)
liz.4d <- phylo4d(liz.tre, lizards$traits)
par(mar=rep(.1,4))
table.phylo4d(liz.4d,var.lab=c(names(lizards$traits),
   "ACP 1\n(\"size effect\")"),show.node=FALSE, cex.lab=1.2)


## REMOVE DUPLICATED POPULATIONS
liz.4d <- prune(liz.4d, c(7,14))
table.phylo4d(liz.4d)


## CORRECT LABELS
lab <- c("Pa", "Ph", "Ll", "Lmca", "Lmcy", "Phha", "Pha",
   "Pb", "Pm", "Ae", "Tt", "Ts", "Lviv", "La", "Ls", "Lvir")
tipLabels(liz.4d) <- lab


## REMOVE SIZE EFFECT
dat <- tdata(liz.4d, type="tip")
dat <- log(dat)
newdat <- data.frame(lapply(dat, function(v) residuals(lm(v~dat$mean.L))))
rownames(newdat) <- rownames(dat)
tdata(liz.4d, type="tip") <- newdat[,-1] # replace data in the phylo4d object


## pPCA
liz.ppca <- ppca(liz.4d,scale=FALSE,scannf=FALSE,nfposi=1,nfnega=1, method="Abouheif")
liz.ppca
tempcol <- rep("grey",7)
tempcol[c(1,7)] <- "black"
barplot(liz.ppca$eig,main='pPCA eigenvalues',cex.main=1.8,col=tempcol)

par(mar=rep(.1,4))
plot(liz.ppca,ratio.tree=.7)


## CONTRIBUTIONS TO PC (LOADINGS) (viewed as dotcharts)
dotchart(liz.ppca$c1[,1],lab=rownames(liz.ppca$c1),main="Global principal
component 1")
abline(v=0,lty=2)

dotchart(liz.ppca$c1[,2],lab=rownames(liz.ppca$c1),main="Local principal
component 1")
abline(v=0,lty=2)


## REPRODUCE FIGURES FROM THE PAPER
obj.ppca <- liz.4d
tdata(obj.ppca, type="tip") <- liz.ppca$li
myLab <- paste(" ",rownames(liz.ppca$li), sep="")

## FIGURE 1
par(mar=c(.1,2.4,2.1,1))
table.phylo4d(obj.ppca, ratio=.7, var.lab=c("1st global PC", "1st local
   PC"), tip.label=myLab,box=FALSE,cex.lab=1.4, cex.sym=1.2, show.node.label=TRUE)
add.scatter.eig(liz.ppca$eig,1,1,1,csub=1.2, posi="topleft", ratio=.23)


## FIGURE 2
s.arrow(liz.ppca$c1,xlim=c(-1,1),clab=1.3,cgrid=1.3)



#### ANOTHER EXAMPLE - INCLUDING NA REPLACEMENT ####
## LOAD THE DATA
data(maples)
tre <- read.tree(text=maples$tre)
x <- phylo4d(tre, maples$tab)
omar <- par("mar")
par(mar=rep(.1,4))
table.phylo4d(x, cex.lab=.5, cex.sym=.6, ratio=.1) # note NAs in last trait ('x')

## FUNCTION TO REPLACE NAS
f1 <- function(vec){
if(any(is.na(vec))){
m <- mean(vec, na.rm=TRUE)
vec[is.na(vec)] <- m
}
return(vec)
}


## PERFORM THE PPCA
dat <- apply(maples$tab,2,f1) # replace NAs
x.noNA <- phylo4d(tre, as.data.frame(dat))
map.ppca <- ppca(x.noNA, scannf=FALSE, method="Abouheif")
map.ppca


## SOME GRAPHICS
screeplot(map.ppca)
scatter(map.ppca, useLag=TRUE)
plot(map.ppca, useLag=TRUE)


## MOST STRUCTURED TRAITS
a <- map.ppca$c1[,1] # loadings on PC 1
names(a) <- row.names(map.ppca$c1)
highContrib <- a[a< quantile(a,0.1) | a>quantile(a,0.9)]
datSel <- cbind.data.frame(dat[, names(highContrib)], map.ppca$li)
temp <- phylo4d(tre, datSel)
table.phylo4d(temp) # plot of most structured traits


## PHYLOGENETIC AUTOCORRELATION TESTS FOR THESE TRAITS
prox <- proxTips(tre, method="Abouheif")
abouheif.moran(dat[, names(highContrib)], prox)

}




