## ------------------------------------------------------------------------
library(RColorBrewer) # for nice colors
# load this package (bnpsd) and a related popgen package (popkin)
# since both packages have an "fst" function, load "bnpsd" last so its function isn't masked
library(popkin) # for visualizing coancestry matrix with plotPopkin
library(bnpsd)

# dimensions of data/model
n <- 100 # number of individuals (NOTE this is 10x less than in publication!)
k <- 10 # number of intermediate subpops

# define population structure
F <- 1:k # subpopulation FST vector, up to a scalar
s <- 0.5 # desired bias coefficient
Fst <- 0.1 # desired FST for the admixed individuals
obj <- q1d(n, k, s=s, F=F, Fst=Fst) # admixture proportions from 1D geography
Q <- obj$Q
F <- obj$F

# get pop structure parameters of the admixed individuals
Theta <- coanc(Q,F) # the coancestry matrix
# verify that we got the desired Fst!
Fst2 <- fst(Q,F)
Fst2
# this should also equal Fst
inbr <- diag(Theta)
popkin::fst(inbr)
# verify that we got the desired s too!
s2 <- mean(Theta)/Fst
s2

## ---- fig.width=4, fig.height=2, fig.align='center'----------------------
# visualize the per-subpopulation inbreeding coefficients (FSTs)
par(mar=c(4,4,0,0)+0.2) # shrink default margins
colIS <- brewer.pal(k, "Paired") # indep. subpop. colors
barplot(F, col=colIS, names.arg=1:k, ylim=c(0,1),
	xlab='Subpopulation', ylab='Inbreeding coeff.')

## ---- fig.width=6, fig.height=1.5, fig.align='center'--------------------
# visualize the admixture proportions
par(mar=c(1,4,0,0)+0.2) # shrink default margins
barplot(t(Q), col=colIS, border=NA, space=0, ylab='Admixture prop.')
mtext('Individuals', 1)

## ---- fig.width=4.2, fig.height=3, fig.align='center'--------------------
# Visualize the coancestry matrix using "popkin"!
# set outer margin for axis labels (left and right are non-zero)
par(oma=c(0,1.5,0,3))
# zero inner margin (plus padding) because we have no individual or subpopulation labels
par(mar=c(0,0,0,0)+0.2)
# now plot!
plotPopkin(Theta)

## ------------------------------------------------------------------------
m <- 10000 # number of loci in simulation (NOTE this is 30x less than in publication!)
# draw all random Allele Freqs (AFs) and genotypes
# reuse the previous F,Q
out <- rbnpsd(Q, F, m)
X <- out$X # genotypes
P <- out$P # IAFs (individual-specific AFs)
B <- out$B # intermediate AFs
pAnc <- out$Pa # ancestral AFs

## ---- fig.width=4, fig.height=2, fig.align='center'----------------------
# inspect distribution of ancestral AFs (~ Uniform(0.01,0.5))
par(mar=c(4,4,0,0)+0.2) # shrink default margins for these figures
hist(pAnc, xlab='Ancestral AF', main='', xlim=c(0,1))
# distribution of intermediate population AFs
# (all subpopulations combined)
# (will be more dispersed toward 0 and 1 than ancestral AFs)
hist(B, xlab='Intermediate Subpopulation AF', main='', xlim=c(0,1))
# distribution of IAFs (admixed individuals)
# (admixture reduces differentiation, so these resemble ancestral AFs a bit more)
hist(P, xlab='Individual-specific AF', main='', xlim=c(0,1))
# genotype distribution of admixed individuals
barplot(table(X), xlab='Genotypes', ylab='Frequency', col='white')

## ---- fig.width=6, fig.height=2.8, fig.align='center'--------------------
# for best estimates, group individuals into subpopulations using the geography
# this averages more individuals in estimating the minimum kinship
subpops <- ceiling( (1:n)/n*k )
table(subpops) # got k=10 subpops with 100 individuals each
# now estimate kinship using popkin
PhiHat <- popkin(X, subpops)
# replace diagonal with inbreeding coeffs. to match coancestry matrix
ThetaHat <- inbrDiag(PhiHat)

# Visualize the coancestry matrix using "popkin"!
# set outer margin for axis labels (left and right are non-zero)
par(oma=c(0,1.5,0,3))
# increase inner top margin for panel titles
par(mar=c(0,0,2.5,0)+0.2)
# now plot!
x <- list(Theta, ThetaHat)
titles <- c('Truth', 'Estimate')
plotPopkin(x, titles)

## ------------------------------------------------------------------------
# reuse the previous m,F,Q
pAnc <- rpanc(m) # draw ancestral AFs
B <- rpint(pAnc, F) # draw intermediate AFs
P <- rpiaf(B, Q) # draw IAFs (individual-specific AFs)
X <- rgeno(P) # draw genotypes

## ---- fig.width=4, fig.height=2, fig.align='center'----------------------
alpha <- 1/2 # this increases rare alleles
pAnc <- rbeta(m, alpha, alpha)
par(mar=c(4,4,0,0)+0.2) # shrink default margins for these figures
hist(pAnc, xlab='Ancestral AF', main='', xlim=c(0,1))

## ------------------------------------------------------------------------
# draw genotypes for one individual from the ancestral population
# use "cbind" to turn the vector pAnc into the column matrix "rgeno" expects
Xanc <- rgeno(cbind(pAnc))
# returns a column matrix:
dim(Xanc)
# draw genotypes from intermediate populations
# draws one individual per intermediate population
Xint <- rgeno(B)

## ------------------------------------------------------------------------
out <- rbnpsd(Q, F, m, lowMem=TRUE)
X <- out$X # genotypes
B <- out$B # intermediate AFs
pAnc <- out$Pa # ancestral AFs
# NOTE: out$P is not computed in this mode!

## ------------------------------------------------------------------------
X <- rgeno(B, Q, lowMem=TRUE)

## ------------------------------------------------------------------------
# reuse earlier (n,k) dimensions
n <- 100 # number of individuals
k <- 10 # number of intermediate subpops

# define population structure
F <- 1:k # subpopulation FST vector, up to a scalar
s <- 0.5 # desired bias coefficient
Fst <- 0.1 # desired FST for the admixed individuals
obj <- q1dc(n, k, s=s, F=F, Fst=Fst) # admixture proportions from *circular* 1D geography
Q <- obj$Q
F <- obj$F

# get pop structure parameters of the admixed individuals
Theta <- coanc(Q,F) # the coancestry matrix
# verify that we got the desired Fst!
fst(Q,F)

# verify that we got the desired s too!
mean(Theta)/Fst

## ---- fig.width=4, fig.height=1.2, fig.align='center'--------------------
# visualize the per-subpopulation inbreeding coefficients (FSTs)
par(mar=c(2.5,2.5,0.3,0)+0.2, lab=c(2,1,7), mgp=c(1.5,0.5,0)) # tweak margins/etc
colIS <- brewer.pal(k, "Paired") # indep. subpop. colors
barplot(F, col=colIS, names.arg=colnames(Q), xlab='Subpopulation', ylab='Inbr')

## ---- fig.width=4, fig.height=1, fig.align='center'----------------------
# visualize the admixture proportions
par(mar=c(1,4,0.4,0)+0.2, lab=c(2,2,7)) # tweak margins/etc
barplot(t(Q), col=colIS, border=NA, space=0, ylab='Admix prop')
mtext('Individuals', 1)

## ---- fig.width=3.1, fig.height=2, fig.align='center'--------------------
# Visualize the coancestry matrix using "popkin"!
par(oma=c(0,1.5,0,3), mar=c(0,0,0.4,0)+0.2) # tweak margins/etc
plotPopkin(Theta, nPretty=3)

## ------------------------------------------------------------------------
# define population structure
# we'll have k=3 subpopulations, each with these sizes:
k <- 3
n1 <- 100; n2 <- 50; n3 <- 20
# here's the labels (for simplicity, list all individuals of S1 first, then S2, then S3)
labs <- c( rep.int('S1', n1), rep.int('S2', n2), rep.int('S3', n3) )
# data dimensions infered from labs:
length(labs) # number of individuals "n"
length(unique(labs)) # number of subpopulations "k"

# desired admixture matrix ("is" stands for "Independent Subpopulations")
Q <- qis(labs)
# got a boolean matrix with a single TRUE value per row
# (denoting the sole subpopulation from which each individual draws its ancestry)
head(Q, 2)

# construct the intermediate subpopulation FST vector
Fst <- 0.2 # the desired final FST
F <- 1:k # subpopulation FST vector, unnormalized so far
F <- F/popkin::fst(F)*Fst # normalized to have the desired Fst
popkin::fst(F) # verify FST for the intermediate subpopulations

# get coancestry of the admixed individuals
Theta <- coanc(Q,F) # the coancestry matrix
# before getting FST for individuals, weigh then inversely proportional to subpop sizes
w <- weightsSubpops(labs) # function from `popkin` package
# verify Fst for individuals (same as for intermediate subpops for this pop structure)
fst(Q, F, w)

## ---- fig.width=4, fig.height=1.2, fig.align='center'--------------------
# visualize the per-subpopulation inbreeding coefficients (FSTs)
par(mar=c(2.5,2.5,0,0)+0.2, lab=c(2,1,7), mgp=c(1.5,0.5,0)) # tweak margins/etc
colIS <- brewer.pal(k, "Paired") # indep. subpop. colors
barplot(F, col=colIS, names.arg=colnames(Q), xlab='Subpopulation', ylab='Inbr')

## ---- fig.width=4, fig.height=1, fig.align='center'----------------------
# visualize the admixture proportions
par(mar=c(1,4,0.4,0)+0.2, lab=c(2,2,7)) # tweak margins/etc
barplot(t(Q), col=colIS, border=NA, space=0, ylab='Admix prop')
mtext('Individuals', 1)

## ---- fig.width=3.1, fig.height=2, fig.align='center'--------------------
# Visualize the coancestry matrix using "popkin"!
par(oma=c(0,1.5,0,3), mar=c(0,0,0.4,0)+0.2) # tweak margins/etc
plotPopkin(Theta, nPretty=3)

