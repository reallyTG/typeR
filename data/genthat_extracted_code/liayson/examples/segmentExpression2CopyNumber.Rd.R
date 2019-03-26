library(liayson)


### Name: segmentExpression2CopyNumber
### Title: Calling CNVs.
### Aliases: segmentExpression2CopyNumber

### ** Examples

##Calculate number of genes expressed per each cell:
data(epg)
gpc = apply(epg>0, 2, sum)

##Call function:
data(eps)
data(segments)
cn=segments[rownames(eps),"CN_Estimate"]
#cnps = segmentExpression2CopyNumber(eps, gpc, cn, seed=0.5, nCores=2, stdOUT="log")
#head(eps[,1:3]); ##Expression of first three cells
#head(cnps[,1:3]); ##Copy number of first three cells



