### R code from vignette source 'rxSeq.Rnw'

###################################################
### code chunk number 1: initialize
###################################################
library(rxSeq)


###################################################
### code chunk number 2: rxSeq.Rnw:32-33
###################################################
options(width = 80)

###################################################
### code chunk number 3: rxSeq.Rnw:32-33
###################################################
rcA = readCounts(index=data.A$index, y=data.A$y[1:2,], n=data.A$n[1:2,], n0B=data.A$n0B[1:2,], 
                 kappas=data.A$kappas, geneids=data.A$geneids[1:2])
rcX = readCounts(index=data.X$index, y=data.X$y[1:2,], n=data.X$n[1:2,], n0B=data.X$n0B[1:2,], 
                 kappas=data.X$kappas, geneids=data.X$geneids[1:2], tausB=data.X$tausB, chrom="X")

###################################################
### code chunk number 4: rxSeq.Rnw:70-74
###################################################
#fit trecase autosome genes:
trecase.A.out = process(rcA)


###################################################
### code chunk number 5: rxSeq.Rnw:82-86
###################################################
#fit trecase X chromosome genes:
trecase.X.out = process(rcX)


###################################################
### code chunk number 6: rxSeq.Rnw:91-95
###################################################
names(trecase.A.out)
trecase.A.out$pval[,1:2]
names(trecase.X.out)
trecase.X.out$pval[,1:2]

###################################################
### code chunk number 7: rxSeq.Rnw:91-95
###################################################
nLogLik(res=trecase.A.out, rc=rcA, genei=1)$nll
nLogLik(res=trecase.X.out, rc=rcX, genei=1)$nll

###################################################
### code chunk number 8: rxSeq.Rnw:109-114
###################################################
#fit trec autosome genes
rcA$model = "short"
trec.A.out = process(rcA)
names(trec.A.out)
trec.A.out$pval[,1:2]


###################################################
### code chunk number 9: rxSeq.Rnw:119-125
###################################################
#fit trec X chromosome genes
rcX$model = "short"
trec.X.out = process(rcX)
names(trec.X.out)
trec.X.out$pval[,1:2]

###################################################
### code chunk number 10: rxSeq.Rnw:136-138
###################################################
nLogLik(res=trec.A.out, rc=rcA, genei=1)$nll
nLogLik(res=trec.X.out, rc=rcX, genei=1)$nll

###################################################
### code chunk number 11: rxSeq.Rnw:136-138
###################################################
get.tausB(n=data.X$n, n0B=data.X$n0B, geneids=data.X$geneids,
          Xist.ID="ENSMUSG00000086503")


###################################################
### code chunk number 12: rxSeq.Rnw:152-153
###################################################
data.X$tausB


###################################################
### code chunk number 13: rxSeq.Rnw:160-161
###################################################
get.tausB(n=data.X$n, n0B=data.X$n0B, geneids=data.X$geneids, Xist.ID = "")


###################################################
### code chunk number 14: rxSeq.Rnw:168-173
###################################################
dat.A = simRX(b0f=.5, b0m=.6, b1f=.3, b1m=.4, beta_sex=.1, beta_dom=.1, n.simu=1E1)
names(dat.A)
dat.X = simRX(b0f=.5, b0m=.6, b1f=.3, b1m=.4, beta_sex=.1, beta_dom=.1, n.simu=1E1,
             is.X=TRUE, tauB=.3)
names(dat.X)


