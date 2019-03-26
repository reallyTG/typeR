library(EstMix)


### Name: est_mixture
### Title: It is a function that takes the LRR obtained from SNP array data
###   and returns the estimated tumor and normal proportions. Currently,
###   the function can performs the proportion estimations by assuming the
###   number of tumor clones to be 1 or 2 or 3. The normalization step is
###   not required and the normalization constant will be returned by this
###   function. The function will output two sets of solutions
###   corresponding to the top 2 optimal solutions based on the posterior
###   distribution. You can choose according to your expertise the one that
###   is more reasonable.
### Aliases: est_mixture

### ** Examples

##########################################################
##
## short example
##
#########################################################
## first load the data
BAF <- example_data$BAF
LRR <- example_data$LRR ## In practice, the orignal LRR should be devided by 0.55
chr <- example_data$chr
loc <- example_data$x
GT <- example_data$GT
gt = (GT=='BB')*2+(GT=='AB')*1.5+(GT=='AA')-1;gt[gt==(-1)]=NA

## then perform segmentation
gaps = PSCBS::findLargeGaps(x=loc,minLength=5e6,chromosome=chr)
if(!is.null(gaps)) knownSegments = PSCBS::gapsToSegments(gaps)
p <- 0.0001
fit <- PSCBS::segmentByPairedPSCBS(CT=2*2^LRR,betaT=BAF,muN=gt,chrom=chr,
knownSegments=knownSegments,tbn=FALSE,x=loc,seed=1, alphaTCN=p*.9,alphaDH=p*.1)
seg_eg = fit$output

## then perform tumor mixture estimation by assuming 1 tumor clones
out = est_mixture(BAF, LRR, chr, loc, GT, num_tumor = 1, seg_raw = seg_eg)
out$sol1_pct
out$sol1_scale
## References: Quantification of multiple tumor clones using gene array and sequencing data.
## Y Cheng, JY Dai, TG Paulson, X Wang, X Li, BJ Reid, C Kooperberg.
## Annals of Applied Statistics 11 (2), 967-991
## Segmentation-based detection of allelic imbalance and loss-of-heterozygosity
## in cancer cells using whole genome SNP arrays.
## J Staaf, D Lindgren, J Vallon-Christersson, A Isaksson, H Goransson, G Juliusson,
## R Rosenquist, M H, A Borg, and M Ringner



