library(StatMatch)


### Name: Frechet.bounds.cat
### Title: Frechet bounds of cells in a contingency table
### Aliases: Frechet.bounds.cat
### Keywords: multivariate

### ** Examples


data(quine, package="MASS") #loads quine from MASS
str(quine)

# split quine in two subsets
set.seed(7654)
lab.A <- sample(nrow(quine), 70, replace=TRUE)
quine.A <- quine[lab.A, 1:3]
quine.B <- quine[-lab.A, 2:4]

# compute the tables required by Frechet.bounds.cat()
freq.x <- xtabs(~Sex+Age, data=quine.A)
freq.xy <- xtabs(~Sex+Age+Eth, data=quine.A)
freq.xz <- xtabs(~Sex+Age+Lrn, data=quine.B)

# apply Frechet.bounds.cat()
bounds.yz <- Frechet.bounds.cat(tab.x=freq.x, tab.xy=freq.xy,
        tab.xz=freq.xz, print.f="data.frame")
bounds.yz

#compare marg. distribution of Xs in A and B
comp.prop(p1=margin.table(freq.xy,c(1,2)), p2=margin.table(freq.xz,c(1,2)), 
          n1=nrow(quine.A), n2=nrow(quine.B))

# harmonize distr. of Sex vs. Age before applying
# Frechet.bounds.cat()

N <- nrow(quine)
quine.A$pop <- N
quine.A$f <- N/70 # reciprocal sampling fraction
quine.B$pop <- N
quine.B$f <- N/(N-70)

# derive the table of Sex vs. Age related to the whole data set
tot.sex.age <- colSums(model.matrix(~Sex*Age-1, data=quine))
tot.sex.age

# use hamonize.x() to harmonize the Sex vs. Age between
# quine.A and quine.B

# create svydesign objects
require(survey)
svy.qA <- svydesign(~1, weights=~f, fpc=~pop, data=quine.A)
svy.qB <- svydesign(~1, weights=~f, fpc=~pop, data=quine.B)

# apply harmonize.x 
out.hz <- harmonize.x(svy.A=svy.qA, svy.B=svy.qB, form.x=~Sex*Age-1, x.tot=tot.sex.age)

# compute the new tables required by Frechet.bounds.cat()
freq.x <- xtabs(out.hz$weights.A~Sex+Age, data=quine.A)
freq.xy <- xtabs(out.hz$weights.A~Sex+Age+Eth, data=quine.A)
freq.xz <- xtabs(out.hz$weights.B~Sex+Age+Lrn, data=quine.B)

#compare marg. distribution of Xs in A and B
comp.prop(p1=margin.table(freq.xy,c(1,2)), p2=margin.table(freq.xz,c(1,2)), 
          n1=nrow(quine.A), n2=nrow(quine.B))

# apply Frechet.bounds.cat()
bounds.yz <- Frechet.bounds.cat(tab.x=freq.x, tab.xy=freq.xy,
        tab.xz=freq.xz, print.f="data.frame")
bounds.yz




