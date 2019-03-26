library(qtl)


### Name: addpair
### Title: Scan for an additional pair of QTL in a multiple-QTL model
### Aliases: addpair
### Keywords: models

### ** Examples

# A totally contrived example to show some of what you can do

# simulate backcross data with 3 chromosomes (names "17", "18", "19")
#   one QTL on chr 17 at 40 cM
#   one QTL on chr 18 at 30 cM
#   two QTL on chr 19, at 10 and 40 cM
data(map10)
model <- rbind(c(1,40,0), c(2,30,0), c(3,10,0), c(3,40,0))
## Not run: fakebc <- sim.cross(map10[17:19], model=model, type="bc", n.ind=250)
## Don't show: 
fakebc <- sim.cross(map10[17:19], model=model, type="bc", n.ind=25)
## End(Don't show)

# het at QTL on 17 and 1st QTL on 19 increases phenotype by 1 unit
# het at QTL on 18 and 2nd QTL on 19 decreases phenotype by 1 unit
qtlgeno <- fakebc$qtlgeno
phe <- rnorm(nind(fakebc))
w <- qtlgeno[,1]==2 & qtlgeno[,3]==2
phe[w] <- phe[w] + 1
w <- qtlgeno[,2]==2 & qtlgeno[,4]==2
phe[w] <- phe[w] - 1
fakebc$pheno[,1] <- phe

## Not run: fakebc <- calc.genoprob(fakebc, step=2, err=0.001)
## Don't show: 
fakebc <- calc.genoprob(fakebc, step=0, err=0.001)
## End(Don't show)

# base model has QTLs on chr 17 and 18
qtl <- makeqtl(fakebc, chr=c("17", "18"), pos=c(40,30), what="prob")

# scan for an additional pair of QTL, one interacting with the locus
#     on 17 and one interacting with the locus on 18
out.ap <- addpair(fakebc, qtl=qtl, formula = y~Q1*Q3 + Q2*Q4, method="hk")

max(out.ap)
summary(out.ap)
plot(out.ap)



