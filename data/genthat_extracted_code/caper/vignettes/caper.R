### R code from vignette source 'caper.rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
	library(caper)
	## whilst code is being tested, load most recent versions from the pkg repository
	for(f in dir('../../R', full=TRUE)) (source(f))


###################################################
### code chunk number 2: whycaper
###################################################
par(mfrow=c(2,2), mar=c(3,3,1,1), mgp=c(2,0.7,0))

plot(c(0,13),c(0,10), typ="n", bty="n", xaxt="n",yaxt="n", xlab="", ylab="", xaxs="i",yaxs="i")
lines(c(0,7), c(5,8.5))
lines(c(0,7), c(5,1.5))
lines(c(3.5,7), c(3.25,5))
polygon(c(7,10,10), y=c(8.5,10,7))
polygon(c(7,10,10), y=c(5,6.5,3.5))
polygon(c(7,10,10), y=c(1.5,3,0))


points( c(0.5,1.5) +0.5, c(5,5), cex=1, col=1:2)
points(c(7.5,8.5)+0.5, c(8.5,8.5), cex=1, col=1:2)
points(c(4,5)+0.5, c(3.25,3.25), cex=1.5, col=1:2)
points(c(7.5,8.5)+0.5, c(5,5), cex=1.5, col=1:2)
points(c(7.5,8.5)+0.5, c(1.5,1.5), cex=2, col=1:2)

rect(11 - c(.3,.2,.1), c(0,3.5,7), 11 + c(.3,.2,.1) , c(3,6.5,10))
rect(12 - c(.3,.2,.1), c(0,3.5,7), 12 + c(.3,.2,.1) , c(3,6.5,10), border="red")
par(usr=c(0,1,0,1)); text(0.1,0.9, cex=2,"a")

dat <- data.frame(x = rnorm(120, mean= rep(2:4, each=40), sd=0.5),
 				  y = rnorm(120, mean= rep(2:4, each=40), sd=0.5),
				  tx = gl(3,40))

plot(y~x, col=unclass(tx), data=dat, xaxt="n", xlab="", ylab="")
axis(1, col.axis="red")
abline(lm(y~x, data=dat))
for(sub in split(dat, dat$tx)) abline(lm(y~x,  data=sub), col=unclass(sub$tx)[1], lty=2) 


plot(c(0,13),c(0,10), typ="n", bty="n", xaxt="n",yaxt="n", xlab="", ylab="", xaxs="i",yaxs="i")
lines(c(0,7), c(5,8.5))
lines(c(0,7), c(5,1.5))
lines(c(3.5,7), c(3.25,5))
polygon(c(7,10,10), y=c(8.5,10,7))
polygon(c(7,10,10), y=c(5,6.5,3.5))
polygon(c(7,10,10), y=c(1.5,3,0))

points(c(0.5,1.5)+0.5, c(5,5), cex=1, col=1:2)
points(c(7.5,8.5)+0.5, c(8.5,8.5), cex=1, col=1:2)
points(c(4,5)+0.5, c(3.25,3.25), cex=c(1,1.5), col=1:2)
points(c(7.5,8.5)+0.5, c(5,5), cex=c(1,1.5), col=1:2)
points(c(7.5,8.5)+0.5, c(1.5,1.5), cex=c(1,2), col=1:2)

polygon(11 + c(-0,-0.1,0.1,0), c(3,0,0,3))
polygon(12 + c(-0.2,-0.3,0.3,0.2), c(3,0,0,3), border="red")
polygon(11 + c(-0,-0.1,0.1,0), c(6.5,3.5,3.5,6.5))
polygon(12 + c(-0.1,-0.2,0.2,0.1), c(6.5,3.5,3.5,6.5), border="red")
polygon(11 + c(-0,-0.1,0.1,0), c(10,7.5,7.5,10))
polygon(12 + c(-0.0,-0.1,0.1,0.), c(10,7.5,7.5,10), border="red")
par(usr=c(0,1,0,1)); text(0.1,0.9, cex=2, "b")


dat <- data.frame(x = rnorm(120, mean= rep(2:4, each=40), sd=0.5),
				  tx = gl(3,40))
dat$y <- dat$x - rnorm(120, mean= rep(0:2, each=40), sd=0.5)

plot(y~x, col=unclass(tx), data=dat, xaxt="n", xlab="", ylab="")
axis(1, col.axis="red")
abline(lm(y~x, data=dat))
for(sub in split(dat, dat$tx)) abline(lm(y~x,  data=sub), col=unclass(sub$tx)[1], lty=2) 



###################################################
### code chunk number 3: comparative.data
###################################################
phy <- read.tree(text='(((B:2,A:2):1,D:3):1,(C:1,E:1):3);')
dat <- data.frame(taxa=c("A","B","C","D","E"), n.species=c(5,9,12,1,13), mass=c(4.1,4.5,5.9,3.0,6.0))
cdat <- comparative.data(data=dat, phy=phy, names.col="taxa")

print(cdat)


###################################################
### code chunk number 4: na.omit
###################################################
data(perissodactyla)
(perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial))
# but this can be turned off
(perissoFull <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial, na.omit=FALSE))
na.omit(perisso)


###################################################
### code chunk number 5: na.omit2
###################################################
comparative.data(perissodactyla.tree, perissodactyla.data, Binomial, scope= log.female.wt ~ log.gestation.length)
na.omit(perissoFull, scope=log.female.wt ~ log.gestation.length + Territoriality)


###################################################
### code chunk number 6: subset
###################################################
subset(perissoFull, subset=! is.na(Territoriality))
subset(perissoFull, subset=log.female.wt > 5.5, select=c(log.female.wt, log.gestation.length))


###################################################
### code chunk number 7: squarebracket
###################################################
horses <- grep('Equus', perissoFull$phy$tip.label)
perissoFull[horses,]
perissoFull[horses, 2:3]


###################################################
### code chunk number 8: pglsSetup
###################################################
## demo tree
z <- structure(list(edge = structure(c(11L, 15L, 18L, 18L, 15L, 16L, 
16L, 11L, 12L, 13L, 13L, 19L, 19L, 12L, 14L, 14L, 17L, 17L, 15L, 
18L, 1L, 2L, 16L, 3L, 4L, 12L, 13L, 5L, 19L, 6L, 7L, 14L, 8L, 
17L, 9L, 10L), .Dim = c(18L, 2L)), edge.length = c(5.723, 2.186, 
1.09, 1.09, 0.627, 2.649, 2.649, 1.049, 1.411, 6.54, 5.538, 1.001, 
1.001, 1.863, 6.088, 4.777, 1.312, 1.312), tip.label = c("t8", 
"t6", "t4", "t10", "t9", "t5", "t7", "t1", "t3", "t2"), Nnode = 9L), .Names = c("edge", 
"edge.length", "tip.label", "Nnode"), class = "phylo", order = "cladewise")
V <- VCV.array(z)


###################################################
### code chunk number 9: vcvFig
###################################################
ec <- rep('grey50', 18)
ec[c(1,5,7)] <- 'red'
ec[c(8,14)] <- 'blue'
plot(z, no.margin=TRUE, cex=0.6, label.offset=0.3, edge.col=ec)


###################################################
### code chunk number 10: bltrans
###################################################
## internal branch lengths
internal <- z$edge[,2] > 10
vlines <- 9 * c(0, 0.5, 1, 1.5)
zz <- z

# layout
layout(matrix(c(1:9), ncol=3))
par(mar=c(0,0.5,2,0.5))
cx <- 0.8
ln <- 0.5
xl <- c(0,15)

# lambda
pvals <- c(1.4, 0.5)
ec <- ifelse(internal,'red', 'grey30')

## zz$edge.length <- ifelse(internal, z$edge.length*pvals[1], z$edge.length)
## plot(zz, edge.col=ec, x.lim=xl, label.offset=0.2)
## mtext(bquote(lambda == .(pvals[1])), side=3, cex=cx, line=ln)
## abline(v=vlines, lty=2, col='grey')
## 
## plot(z,  edge.col=ec, x.lim=xl, label.offset=0.2)
## abline(v=vlines, lty=2, col='grey')
## mtext(expression(lambda == 1), side=3, cex=cx, line=ln)
## 
## zz$edge.length <- ifelse(internal, z$edge.length*pvals[2], z$edge.length)
## plot(zz,  edge.col=ec, x.lim=xl, label.offset=0.2)
## mtext(bquote(lambda == .(pvals[2])), side=3, cex=cx, line=ln)
## abline(v=vlines, lty=2, col='grey')

# get the branching structure back from the matrix
dd <- ifelse(lower.tri(V) | upper.tri(V), V * pvals[1], V)
ddh <- as.phylo(hclust(dist(dd)))
plot(ddh, edge.col = 'red', x.lim=xl, label.offset=0.2)
mtext(bquote(lambda == .(pvals[1])), side=3, cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')

plot(z,  edge.col=ec, x.lim=xl, label.offset=0.2)
abline(v=vlines, lty=2, col='grey')
mtext(expression(lambda == 1), side=3, cex=cx, line=ln)

dd <- ifelse(lower.tri(V) | upper.tri(V), V * pvals[2], V)
ddh <- as.phylo(hclust(dist(dd)))
plot(ddh, edge.col = 'red', x.lim=xl, label.offset=0.2)
mtext(bquote(lambda == .(pvals[2])), side=3, cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')


# delta: 
pvals <- c(1.2, 0.5)

# get the branching structure back from the matrix
dd <- V ^ pvals[1]
ddh <- as.phylo(hclust(dist(dd)))
plot(ddh, edge.col = 'red', x.lim=xl, label.offset=0.2)
mtext(bquote(delta == .(pvals[1])), side=3, cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')

plot(z,  edge.col='red', x.lim=xl, label.offset=0.2)
abline(v=vlines, lty=2, col='grey')
mtext(expression(delta == 1), side=3, cex=cx, line=ln)

dd <- V ^ pvals[2]
ddh <- as.phylo(hclust(dist(dd)))
plot(ddh, edge.col='red', x.lim=xl, label.offset=0.2)
mtext(bquote(delta == .(pvals[2])),  cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')

# kappa
pvals <- c(1.2, 0.0)
ec <- ifelse(internal,'red', 'grey30')

zz$edge.length <- z$edge.length^pvals[1]
plot(zz, edge.col = 'red', x.lim=xl, label.offset=0.2)
mtext(bquote(kappa == .(pvals[1])), side=3, cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')

plot(z,  edge.col='red', x.lim=xl, label.offset=0.2)
abline(v=vlines, lty=2, col='grey')
mtext(expression(kappa == 1), side=3, cex=cx, line=ln)

zz$edge.length <- z$edge.length^pvals[2]
plot(zz, edge.col='red', x.lim=xl, label.offset=0.2)
mtext(bquote(kappa == .(pvals[1])),  cex=cx, line=ln)
abline(v=vlines, lty=2, col='grey')



###################################################
### code chunk number 11: basicPGLS
###################################################
data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE)
mod <- pgls(log(Egg.Mass) ~ log(M.Mass), shorebird)
print(mod)
summary(mod)


###################################################
### code chunk number 12: lambdaOpt
###################################################
data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species, vcv=TRUE, vcv.dim=3)
mod <- pgls(log(Egg.Mass) ~ log(M.Mass), shorebird, lambda='ML')
summary(mod)
mod.l <- pgls.profile(mod, 'lambda')
mod.d <- pgls.profile(mod, 'delta')
mod.k <- pgls.profile(mod, 'kappa')
plot(mod.l); plot(mod.d); plot(mod.k)


###################################################
### code chunk number 13: lambdaOptPlot
###################################################
par(mar=c(4.5,3,1,1), mfrow=c(1,3), mgp=c(1.8,0.8,0), tcl=-0.2)
plot(mod.l); plot(mod.d); plot(mod.k)


###################################################
### code chunk number 14: pglsPlotCmd
###################################################
par(mfrow=c(2,2), mar=c(3,3,1,1), mgp=c(2,0.7,0), tcl=-0.2)
plot(mod)


###################################################
### code chunk number 15: pglsCrit
###################################################
mod1 <- pgls(log(Egg.Mass) ~ log(M.Mass) * log(F.Mass), shorebird) 
anova(mod1)

mod2 <- pgls(log(Egg.Mass) ~ log(M.Mass) + log(F.Mass), shorebird)  
mod3 <- pgls(log(Egg.Mass) ~ log(M.Mass) , shorebird)
mod4 <- pgls(log(Egg.Mass) ~ 1, shorebird)

anova(mod1, mod2, mod3, mod4)
AIC(mod1, mod2, mod3, mod4)


###################################################
### code chunk number 16: crunchExample
###################################################
data(shorebird)

shorebird.data$lgEgg.Mass <- log(shorebird.data$Egg.Mass)
shorebird.data$lgM.Mass <- log(shorebird.data$M.Mass)
shorebird.data$lgF.Mass <- log(shorebird.data$F.Mass)

shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(lgEgg.Mass ~ lgF.Mass + lgM.Mass, data=shorebird)
summary(crunchMod)


###################################################
### code chunk number 17: brunchExample
###################################################
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
brunchMod <- brunch(log.female.wt ~ Territoriality, data=perisso)
caic.table(brunchMod)


###################################################
### code chunk number 18: brunchPlot
###################################################
bwd <- rep(1,15)
bwd[c(5,6,11,12,9,13,14,15)] <- 3
plot(perisso$phy,  'cladogram', use.edge.length=FALSE, label.offset=0.4, show.node=TRUE, cex=0.7, show.tip=FALSE, x.lim=c(0,12), no.margin=TRUE, edge.width=bwd)
points(rep(8.25,9), 1:9, pch=ifelse(perisso$data$Terr=='Yes', 1,19))
text(rep(8.5,9), 1:9, perisso$phy$tip.label, font=3, adj=0)


###################################################
### code chunk number 19: macrocaicExample
###################################################
data(IsaacEtAl)
primates <- comparative.data(primates.tree, primates.data, binomial, na.omit=FALSE)
primatesBodySize <- macrocaic(species.rich ~ body.mass, data=primates)
summary(primatesBodySize)



###################################################
### code chunk number 20: phylodScale
###################################################
data(BritishBirds)
BritishBirds <- comparative.data(BritishBirds.tree, BritishBirds.data, binomial)
redPD <- phylo.d(BritishBirds, binvar=Red_list)

par(mar=c(3,3,2,1), mgp=c(1.8,0.8,0), tcl=-0.3)

plot(density(redPD$Permutations$random, bw=0.5), main='', xlim=c(10,55), col='blue', xlab='Sum of character change')
lines(density(redPD$Permutations$brownian,bw=0.5), col='red')
abline(v=redPD$Parameters$Observed)
abline(v=redPD$Parameters$Observed, col='grey')
abline(v=redPD$Parameters$MeanRandom, col='blue')
abline(v=redPD$Parameters$MeanBrownian, col='red')

with(redPD$Parameters, axis(3, at=c(MeanBrownian, Observed, MeanRandom), labels=c(0, round(redPD$DEstimate,2),1), mgp=c(1.5,0.7,0.25)))
mtext(expression(italic(D)==phantom(x)), side=3, at=25, line=1.2)



###################################################
### code chunk number 21: phylodDemo
###################################################
data(BritishBirds)
BritishBirds <- comparative.data(BritishBirds.tree, BritishBirds.data, binomial)
redPhyloD <- phylo.d(BritishBirds, binvar=Red_list)
print(redPhyloD)


###################################################
### code chunk number 22: caicDiagExample
###################################################
par(mfrow=c(2,3))
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(Egg.Mass ~  M.Mass, data=shorebird)
caic.diagnostics(crunchMod)

shorebird.data$lgEgg.Mass <- log(shorebird.data$Egg.Mass)
shorebird.data$lgM.Mass <- log(shorebird.data$M.Mass)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)

crunchMod2 <- crunch(lgEgg.Mass ~  lgM.Mass, data=shorebird)
caic.diagnostics(crunchMod2)


###################################################
### code chunk number 23: caicDiagExamplePlot
###################################################
par(mfrow=c(2,3), mar=c(3,3,1,1), mgp=c(2,0.7,0), tcl=-0.2)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
# need to store the output of caic diagnostics to stop it
# showing up in the float
crunchMod <- crunch(Egg.Mass ~  M.Mass, data=shorebird)
x <- caic.diagnostics(crunchMod)
crunchMod2 <- crunch(lgEgg.Mass ~  lgM.Mass, data=shorebird)
x <- caic.diagnostics(crunchMod2)


###################################################
### code chunk number 24: caicRobustExample
###################################################
data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)

crunchMod <- crunch(Egg.Mass ~ M.Mass, data=shorebird)
caic.diagnostics(crunchMod)

crunchModRobust <- caic.robust(crunchMod)
caic.diagnostics(crunchModRobust, outlier=2)


###################################################
### code chunk number 25: caicRobustExamplePlot
###################################################
par(mfrow=c(2,3), mar=c(3,3,1,1), mgp=c(2,0.7,0), tcl=-0.2)
data(shorebird)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
# need to store the output of caic diagnostics to stop ip showing up in the float
crunchMod <- crunch(Egg.Mass ~ M.Mass, data=shorebird)
x <-caic.diagnostics(crunchMod)

crunchModRobust <- caic.robust(crunchMod)
x <-caic.diagnostics(crunchModRobust, outlier=2)


###################################################
### code chunk number 26: modelCrit
###################################################

data(shorebird)

shorebird.data$lgEgg.Mass <- log(shorebird.data$Egg.Mass)
shorebird.data$lgM.Mass <- log(shorebird.data$M.Mass)
shorebird.data$lgF.Mass <- log(shorebird.data$F.Mass)

shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)
crunchMod <- crunch(lgEgg.Mass ~ lgF.Mass + lgM.Mass, data=shorebird)
par(mfrow=c(2,2))
plot(crunchMod)



###################################################
### code chunk number 27: modelCritPlot
###################################################
par(mfrow=c(2,2), mar=c(3,3,2,1), mgp=c(2,0.7,0), tcl=-0.2)
data(shorebird)
crunchMod <- crunch(lgEgg.Mass ~ lgF.Mass + lgM.Mass, data=shorebird)
plot(crunchMod)


###################################################
### code chunk number 28: modelComparison
###################################################
shorebird.data$lgEgg.Mass <- log(shorebird.data$Egg.Mass)
shorebird.data$lgM.Mass <- log(shorebird.data$M.Mass)
shorebird.data$lgF.Mass <- log(shorebird.data$F.Mass)
shorebird <- comparative.data(shorebird.tree, shorebird.data, Species)

cMod1 <- crunch(lgEgg.Mass ~ lgM.Mass * lgF.Mass, data=shorebird)
cMod2 <- crunch(lgEgg.Mass ~ lgM.Mass + lgF.Mass, data=shorebird)
cMod3 <- crunch(lgEgg.Mass ~ lgM.Mass , data=shorebird)

anova(cMod1, cMod2, cMod3)
AIC(cMod1, cMod2, cMod3)


###################################################
### code chunk number 29: fuscoDemo
###################################################
data(syrphidae)
syrphidae <- comparative.data(phy=syrphidaeTree, dat=syrphidaeRich, names.col=genus)
summary(fusco.test(syrphidae, rich=nSpp))
summary(fusco.test(syrphidae, tipsAsSpecies=TRUE))


###################################################
### code chunk number 30: pdExample
###################################################
data(BritishBirds)
BritishBirds.cm <- clade.matrix(BritishBirds.tree)
redListSpecies <- with(BritishBirds.data, binomial[Red_list==1])
obs <- pd.calc(BritishBirds.cm, redListSpecies, method="TBL")
rand <- pd.bootstrap(BritishBirds.cm, ntips=length(redListSpecies), rep=1000, method="TBL")

plot(density(rand), main='Total branch length for random sets of 32 species.')
abline(v=obs, col='red')


###################################################
### code chunk number 31: pdMeasurePlot
###################################################
tree <- read.tree(text="((((A:1,B:1):1.5,C:2.5):0.5,(D:0.6,E:0.6):2.4):0.5,((F:1.9,G:1.9):0.8,(H:1.6,I:1.6):1.1):0.8):0.2;")

clmat <- clade.matrix(tree)
tips <- c("A","C","D","E","G","H")

par(mfrow=c(2,3), mar=rep(1,4))

tip.col <- rep('grey', length=length(tree$tip.label))              
tip.col[c(1,3,4,5,7,8)] <- 'black'
                                         
# TBL
cl <- rep('black', length=length(tree$edge.length))
cl[c(1,2,3,4,6,7,8,9,10,11,13,14,15)] <- 'red'
plot(tree, label.offset=0.1, cex=1.2, tip.color=tip.col, x.lim=3.8, edge.col=cl)
text(0.2,8.5, "TBL", cex=1.2, adj=c(0,0))

# UEH
cl <- rep('black', length=length(tree$edge.length))
cl[c(3,4,6,8,9,11,14,13,15)] <- 'red'
plot(tree, label.offset=0.1, cex=1.2, tip.color=tip.col, x.lim=3.8, edge.col=cl)
text(0.2,8.5, "UEH", cex=1.2, adj=c(0,0))

# SBL
cl <- rep('black', length=length(tree$edge.length))
cl[c(1,2,7,10)] <- 'red'
plot(tree, label.offset=0.1, cex=1.2, tip.color=tip.col, x.lim=3.8, edge.col=cl)
text(0.2,8.5, "SBL", cex=1.2, adj=c(0,0))

# TIP
cl <- rep('black', length=length(tree$edge.length))
cl[c(4,6,8,9,13,15)] <- 'red'
plot(tree, label.offset=0.1, cex=1.2, tip.color=tip.col, x.lim=3.8, edge.col=cl)
text(0.2,8.5, "TIP", cex=1.2, adj=c(0,0))


# MST
tips <- c("A","C")
tip.col <- rep('grey', length=length(tree$tip.label))              
tip.col[c(1,3)] <- 'black'

cl <- rep('black', length=length(tree$edge.length))
cl[c(3,4,6)] <- 'red'

plot(tree, label.offset=0.1, cex=1.2, tip.color=tip.col, x.lim=3.8, edge.col=cl)
text(0.2,8.5, "MST", cex=1.2, adj=c(0,0))

par(mar=c(3,3,1,1))
plot(density(rand), main='', xlab= 'TBL values for red listed British birds.')
abline(v=obs, col='red')


###################################################
### code chunk number 32: edExample
###################################################
data(IsaacEtAl)
primates.cm <- clade.matrix(primates.tree)
primateED <- ed.calc(primates.cm)
str(primateED)
plot(density(primateED$spp$ED))
with(primateED, spp[spp$ED == max(spp$ED),])


###################################################
### code chunk number 33: edExamplePlots
###################################################
par(mfrow=c(1,3), mar=c(0,0,0,0), mgp=c(2,0.7,0))
edDemo <- ed.calc(clmat)

edge.col <- rep('gray30', 16)
edge.col[c(1,2,6)] <- 'red'
edge.col[10:12] <- 'blue'

xx <-  plot(tree, show.tip.label=FALSE, x.lim=c(0,4),y.lim=c(0.6,9.4), edge.col=edge.col, edge.width=2, no.margin=TRUE)

edgeLab <- with(edDemo$branch, paste(len, '/' , nSp)) [tree$edge[,2]]
edgelabels(edgeLab, 1:16, adj=c(0.5,-0.3), frame='none', col='gray30', cex=0.7)

edgeLab <- edDemo$branch$ED[tree$edge[,2]]
edgelabels(sprintf("%0.2f", edgeLab), 1:16, adj=c(0.5,1.3), frame='none', col=edge.col, cex=0.9)

tipLab <- with(edDemo$spp, sprintf("%0.2f", ED))
tipCol <- rep('gray30', 9)
tipCol[c(3,6)] <- c('red','blue')
tiplabels(text=tipLab, adj=c(-0.25,0.5), frame='none', col=tipCol)

par(usr=c(0,1,0,1))
text(0.1, 0.9, "a)", cex=1.2)

par(mar=c(3,3,1,1))
plot(density(primateED$spp$ED), main='', xlab='Species ED score')

edMax <- max(primateED$spp$ED)
arrows(edMax, 0.04, edMax, 0.01, col='red', len=0.1)

par(usr=c(0,1,0,1), mar=c(0,0,0,0))
text(0.1, 0.9, "b)", cex=1.2)

maxSpp <- which(primateED$spp$ED == edMax)
xx <- which(rowSums(primates.cm$clade.matrix[,maxSpp])> 0)

edgeCol <- rep('grey30', length(primates.tree$edge.length))
edgeCol[match(xx, primates.tree$edge[,2])] <- 'red'

plot(primates.tree, show.tip=FALSE, no.margin=TRUE, edge.col=edgeCol)

par(usr=c(0,1,0,1))
text(0.1, 0.9, "c)", cex=1.2)



###################################################
### code chunk number 34: setSeed
###################################################
# reasonable run time and reasonable results (on my Mac, 
# no idea if this will carry on to R-Forge.)
set.seed(2345)


###################################################
### code chunk number 35: simpleGrowTree
###################################################
basicTree <- growTree(b=1, d=0, halt=20, grain=Inf)
extendTree <- growTree(b=1, d=0, halt=20, extend.proportion=1, grain=Inf)
timeLimit <- growTree(b=1, d=0, halt=expression(clade.age>=3), grain=0.01)
extinctTree <- growTree(b=1, d=0.1, halt=expression(nExtinctTip>=3), extend.proportion=1, grain=Inf)
densityDependence <- growTree(b=expression(2/nExtantTip), d=0, halt=50, grain=Inf)
increasingExtinction <- growTree(b=1, d=expression(0.2 * clade.age), halt=50)


###################################################
### code chunk number 36: simpleGrowTreePlots
###################################################
par(mfrow=c(2,3), mar=c(1.5,0.5,0,0.5), tcl=-0.2, mgp=c(1,0.5,0), cex.axis=0.8)
plot(basicTree$phy  , root.edge=TRUE);   axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"a)")
plot(extendTree$phy , root.edge=TRUE);  axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"b)")
plot(timeLimit$phy  , root.edge=TRUE);   axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"c)")
plot(extinctTree$phy, root.edge=TRUE); axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"d)")
plot(densityDependence$phy, root.edge=TRUE); axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"e)")
plot(increasingExtinction$phy, root.edge=TRUE); axis(1); par(usr=c(0,1,0,1)); text(0.1,0.06,"f)")



###################################################
### code chunk number 37: setSeed
###################################################
# reasonable run time and reasonable results (on my Mac, 
# no idea if this will carry on to R-Forge.)
set.seed(421)


###################################################
### code chunk number 38: caper.rnw:997-1014
###################################################
# > pantheria <- read.delim('PanTHERIA_1-0_WR05_Aug2008.txt', na.string='-999.00')
# > vars <- log(pantheria[, c(7,21)])
# > cov(vars, use='complete')
#                      X5.1_AdultBodyMass_g X15.1_LitterSize
# X5.1_AdultBodyMass_g           10.0038050       -0.6544125
# X15.1_LitterSize               -0.6544125        0.4427426
# > sum(complete.cases(vars))
# [1] 2325
# > mean(vars,na.rm=TRUE)
# X5.1_AdultBodyMass_g     X15.1_LitterSize 
#            5.4749827            0.6905053 
mammalMeans <- c(logBodyMass=5.48, logLitterSize=0.69)
simpleBrownian <- growTree(halt=100, ct.start=mammalMeans, extend.proportion=1, grain=Inf)
mammalVar <- c(10, 0.44)
varBrownian <- growTree(halt=100, ct.start=mammalMeans, ct.var=mammalVar, extend.proportion=1, grain=Inf)
mammalCovar <- matrix(c(10,-0.65, -0.65, 0.44), ncol=2)
covarBrownian <- growTree(halt=100, ct.start=mammalMeans, ct.var=mammalCovar, extend.proportion=1, grain=Inf)


###################################################
### code chunk number 39: contTraitPlots
###################################################
## par(mfrow=c(1,3), mar=c(0,0.5,0,4), tcl=-0.2, mgp=c(1,0.5,0), cex.axis=0.8)
## 
## plot(simpleBrownian, show.tip=FALSE)
## 
## rightEdge <- rep(par('usr')[2], 25)
## bm <- with(simpleBrownian, ct.data$logBodyMass[ match(tip.label, ct.data$node)])
## points(rightEdge, 1:25, cex=bm / 3, xpd=NA)
## ls <- with(simpleBrownian, ct.data$logLitterSize[ match(tip.label, ct.data$node)])
## points(rightEdge*1.1, 1:25, cex=ls * 2, xpd=NA)
## 
## plot(varBrownian, show.tip=FALSE)
## 
## rightEdge <- rep(par('usr')[2], 25)
## bm <- with(varBrownian, ct.data$logBodyMass[ match(tip.label, ct.data$node)])
## points(rightEdge, 1:25, cex=bm / 3, xpd=NA)
## ls <- with(varBrownian, ct.data$logLitterSize[ match(tip.label, ct.data$node)])
## points(rightEdge*1.1, 1:25, cex=ls * 2, xpd=NA)
## 
## 
## 
## plot(covarBrownian, show.tip=FALSE)
## 
## rightEdge <- rep(par('usr')[2], 25)
## bm <- with(covarBrownian, ct.data$logBodyMass[ match(tip.label, ct.data$node)])
## points(rightEdge, 1:25, cex=bm / 3, xpd=NA)
## ls <- with(covarBrownian, ct.data$logLitterSize[ match(tip.label, ct.data$node)])
## points(rightEdge*1.1, 1:25, cex=ls *2 , xpd=NA)
par(mfrow=c(1,3), mar=c(2.5,2.5,0.5,0.5), tcl=-0.2, mgp=c(1.5,0.5,0), cex.axis=0.8)

stips <- simpleBrownian$data
vtips <- varBrownian$data
cvtips <- covarBrownian$data

lims <- sapply( rbind(stips, vtips,cvtips)[, c('logBodyMass','logLitterSize')], range)

plot(logBodyMass ~ logLitterSize, data=stips, xlim=lims[,2], ylim=lims[,1])
plot(logBodyMass ~ logLitterSize, data=vtips, xlim=lims[,2], ylim=lims[,1])
plot(logBodyMass ~ logLitterSize, data=cvtips, xlim=lims[,2], ylim=lims[,1])



###################################################
### code chunk number 40: discreteTraitExamples
###################################################
flight <- matrix(c(0,0.1,0.001,0), ncol=2)
flightNames <- c('ter','fly')
dimnames(flight) <- list(flightNames, flightNames)

trophic <- matrix(c(0,0.2,0.01,0.2,0,0.1,0,0.05,0), ncol=3)
trophNames <- c('herb','omni','carn')
dimnames(trophic) <- list(trophNames, trophNames)

discTraits <- list(flight=flight, trophic=trophic)
discreteTree <- growTree(halt=60, dt=discTraits, extend.proportion=1, grain=Inf)



###################################################
### code chunk number 41: discreteTraitPlot
###################################################
par(mar=c(0,0,0,0), tcl=-0.2, mgp=c(1,0.5,0), cex.axis=0.8)
plot(discreteTree$phy, show.tip=FALSE)

lastPP <- get("last_plot.phylo", envir = .PlotPhyloEnv)
traitsByNode <- with(discreteTree,  rbind( cbind(node=phy$tip.label, data[, c('flight','trophic')]), node.data[, c('node','flight','trophic')]))
traitsByNode <- traitsByNode[match(1:199, traitsByNode$node), ]

with(lastPP, points(xx + 0.06, yy,  pch=21, col=unclass(traitsByNode$flight), xpd=NA, cex=0.6))
with(lastPP, points(xx + 0.12, yy,  pch=22, col=unclass(traitsByNode$trophic), xpd=NA, cex=0.6))



###################################################
### code chunk number 42: setseed
###################################################
set.seed(95132)


###################################################
### code chunk number 43: patencyModel
###################################################
bLatency <- expression((0.2 *lin.age)/(0.1 + lin.age))
dSenesce <- expression(lin.age * 0.02)
halt <- expression(nExtantTip >= 60)
latencyTree <- growTree(b=bLatency, d=dSenesce, halt=halt, grain=0.01)

traitMean <- c(logBodyMass=5.48)
traitVar <- c(logBodyMass=10)
bLatTrait <- expression(((0.2 + ((5.48 - logBodyMass)/25))*lin.age)/(0.1 + lin.age))

latTraitTree <- growTree(b=bLatTrait, d=dSenesce, halt=halt, ct.start=traitMean, ct.var=traitVar, grain=0.01)



###################################################
### code chunk number 44: patencyPlot
###################################################
par(mfrow=c(2,2), mar=c(2.5,2.5,1,1), tcl=-0.2, mgp=c(1.5,0.5,0), cex.axis=0.8)

curve(0.02*x, xlim=c(0,20), ylab='Rate', xlab="Lineage age")
curve(((0.2 + ((5.48 - 5.48)/25))*x)/(0.1 + x), add=TRUE, col='red')
curve(((0.2 + ((5.48 - 3.48)/25))*x)/(0.1 + x), add=TRUE, col='red', lty=2)
curve(((0.2 + ((5.48 - 7.48)/25))*x)/(0.1 + x), add=TRUE, col='red', lty=2)

plot(latencyTree$phy, no.margin=TRUE, cex=0.8)

plot(latTraitTree$phy, no.margin=TRUE, cex=0.8, show.tip=FALSE)

# rightEdge <- par('usr')[2] - 0.75
# tips <- seq_along(latTraitTree$tip.label)
# bm <- with(latTraitTree, ct.data$logBodyMass[ match(tips, ct.data$node)])
# 
# rect(rightEdge - 5.48/20, 0 , rightEdge + 5.48/20, max(tips)+1, col='grey80', border=NA)
# 
# arrows(rightEdge-bm/20, tips, rightEdge+bm/20, tips, code=0, col='red', xpd=NA, lwd=2, lend=2)



###################################################
### code chunk number 45: inheritanceExample1
###################################################
traitMean <- c(logBodyMass=5.48)
traitVar <- c(logBodyMass=10)
inherit <- list(logBodyMass=expression(logBodyMass * c(0.8, 1.2)))
inheritTree <- growTree(b=1, halt=40, ct.start=traitMean, ct.var=traitVar, inheritance=inherit, grain=Inf, extend.proportion=1)


###################################################
### code chunk number 46: inheritanceExamples2
###################################################
rNames <- c("AB", "A", "B")
regions <- list(region = matrix(c(0, 0.05, 0.05, 0.1, 0,0,0.1,0,0), ncol=3,
	             dimnames=list(rNames,rNames)))
	
extinct <- expression(ifelse(region == "AB", 0.0001, 0.01))

spec <- list(regA_spec = expression(ifelse(region == "AB" | region == "A", 1, 0)),
             regB_spec = expression(ifelse(region == "AB" | region == "B", 0.5, 0)))

inherit <- list(region = expression(if(winnerName=="regB_spec" && region[1] == "AB") c("B","A") else region),
                region = expression(if(winnerName=="regA_spec" && region[1] == "AB") c("A","B") else region))

biogeogTree <- growTree(b=spec, d=extinct, halt=80, inherit=inherit, dt.rates=regions, inf.rates="quiet", grain=Inf)


###################################################
### code chunk number 47: epochExample
###################################################
epochTree <- growTree(halt=100, output.lineages=TRUE, grain=Inf)
epochTree2 <- growTree(d=5, halt=expression(nExtantTip==20), linObj=epochTree, output.lineages=TRUE, grain=Inf)
epochTree3 <- growTree(linObj=epochTree2, halt=100, grain=Inf)


###################################################
### code chunk number 48: inheritancePlots
###################################################
par(mfrow=c(1,3), mar=c(1,1,1,1))

depth <- VCV.array(inheritTree$phy)[1,1]

plot(inheritTree$phy, no.margin=TRUE, cex=0.8, show.tip=FALSE, root.edge=TRUE, x.lim=c(0,depth*1.1))

rightEdge <- depth*1.05
tips <- seq_along(inheritTree$phy$tip.label)
bm <- inheritTree$data$logBodyMass
sc <- max(bm) / (depth*0.04)

rect(rightEdge - 5.48/sc, 0 , rightEdge + 5.48/sc, max(tips)+1, col='grey80', border=NA)

arrows(rightEdge-bm/sc, tips, rightEdge+bm/sc, tips, code=0, col='red', xpd=NA, lwd=2, lend=2)

plot(biogeogTree$phy, edge.col= unclass(biogeogTree$data$region), show.tip.label=FALSE, root.edge=TRUE)
plot(epochTree3$phy, show.tip.label=FALSE)


###################################################
### code chunk number 49: cladeMatrixExample
###################################################
data(perissodactyla)
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
perissoCM <- clade.matrix(perisso$phy)
str(perissoCM)
perissoCM$clade.matrix


###################################################
### code chunk number 50: cladeMembersExample
###################################################
data(perissodactyla)
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
clade.members(15, perisso$phy)
clade.members(15, perisso$phy, tip.labels=TRUE)
clade.members(15, perisso$phy, tip.labels=TRUE, include.nodes=TRUE)
str(clade.members.list(perisso$phy))
str(clade.members.list(perisso$phy, tip.labels=TRUE))


###################################################
### code chunk number 51: vcvArrayExample
###################################################
data(perissodactyla)
perisso <- comparative.data(perissodactyla.tree, perissodactyla.data, Binomial)
str(VCV.array(perisso$phy))
str(VCV.array(perisso$phy, dim=3))


