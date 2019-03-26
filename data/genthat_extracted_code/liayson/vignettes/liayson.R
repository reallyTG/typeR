### R code from vignette source 'liayson.Rnw'

###################################################
### code chunk number 1: liayson.Rnw:30-43
###################################################
library(liayson)
## Load data and map genes onto segments
data(epg)
data(segments)
X=aggregateSegmentExpression(epg, segments, mingps=20, GRCh=38)
head(X$eps[,1:3]); ##Aggregate expression of first three cells
## Calculate number of expressed genes per cell
data(epg)
gpc = apply(epg>0, 2, sum)
## Calculate copy number from expression
cn=segments[rownames(X$eps),"CN_Estimate"]
cnps = segmentExpression2CopyNumber(X$eps, gpc, cn, nCores=1)
head(cnps[,1:3]); ##Copy number of first three cells


###################################################
### code chunk number 2: liayson.Rnw:48-49
###################################################
outc = clusterCells(cnps, h=0.05)


