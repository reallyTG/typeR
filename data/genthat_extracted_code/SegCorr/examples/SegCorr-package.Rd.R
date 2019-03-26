library(SegCorr)


### Name: SegCorr-package
### Title: Detecting Correlated Genomic Regions
### Aliases: SegCorr-package
### Keywords: package

### ** Examples

#data.sets = c('SNP','EXP_raw')
## Each gene corresponds to one SNP probe ##
#Position_EXP = matrix(1:1000,nrow=500,byrow=TRUE)
#Position_SNP = seq(2,1000,by=2)
#data(list=data.sets)
#CHR = rep(1,dim(EXP_raw)[1])
#SNP.CHR = rep(1,dim(SNP)[1])

#results = SegCorr(CHR = CHR, EXP = EXP_raw, CNV = TRUE, SNPSMOOTH=TRUE,
#Position.EXP = Position_EXP, SNP.CHR = SNP.CHR, SNP=SNP , Position.SNP = Position_SNP)

################drawing the heatmap for one region ###########################
#tau = results$Region.List[1,2]: results$Region.List[1,3]
#EXP.CNV =  results$EXP.corrected
#heatmap(EXP.CNV[tau,])




