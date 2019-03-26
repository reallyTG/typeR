library(GESTr)


### Name: TranSAM
### Title: Gene Expression State Transformed Significance Analysis of
###   Microarrays
### Aliases: TranSAM

### ** Examples

## load data and run GESTr on a subset of this to create transformed data
data(GESTr)
selected.columns <- sort(c(sample(1:ncol(ABIdata),30),which(colnames(ABIdata) %in% c("GSM194513","GSM194514","GSM194515","GSM194516","GSM194517","GSM194518"))))
transformed.x <- GESTr(ABIdata[1:20,selected.columns])

## choose samples for analysis
thy.adult <- which(colnames(transformed.x) %in% c("GSM194513","GSM194514","GSM194515"))
thy.fetal <- which(colnames(transformed.x) %in% c("GSM194516","GSM194517","GSM194518"))

## run TranSAM on selected samples
ts.out <- TranSAM(transformed.x[,c(thy.adult,thy.fetal)],samples1=1:3,samples2=4:6)




