library(seqMeta)


### Name: SNPInfo
### Title: Illumina HumanExome BeadChip SNP Information file
### Aliases: SNPInfo
### Keywords: datasets

### ** Examples

data(SNPInfo)

##summary of the data set:
summary(as.numeric(table(SNPInfo$SKATgene)))
hist(table(SNPInfo$SKATgene),nclass = 300,xlim=c(0,50),
	main = "SNPs per gene", xlab ="#SNPs", ylab = "#Genes")



