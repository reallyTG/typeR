library(paleotree)


### Name: SongZhangDicrano
### Title: Cladistic Data for Dicranograptid Graptolites from Song and
###   Zhang (2014)
### Aliases: SongZhangDicrano charMatDicrano cladogramDicranoX12
###   cladogramDicranoX13
### Keywords: datasets

### ** Examples


data(SongZhangDicrano)

# Examining morphospace with a distance matrix

# calculate a distance matrix from the morph character data
char <- charMatDicrano[,-22]	# remove strat character
charDist <- matrix(,nrow(char),nrow(char))
rownames(charDist) <- colnames(charDist) <- rownames(char)
for(i in 1:nrow(char)){for(j in 1:nrow(char)){
	charDiff <- logical()
	for(k in 1:ncol(char)){
		selectPair <- char[c(i,j),k]
		if(all(!is.na(selectPair))){
			#drop states that are missing			
			isSame <- identical(selectPair[1],selectPair[2])
			charDiff <- c(charDiff,isSame)
			}
		}
	charDist[i,j] <- 1-sum(charDiff)/length(charDiff)
	}}

#####
# PCO of character distance matrix

#can apply PCO (use lingoes correction to account for negative values
   #resulting from non-euclidean matrix
pco_res <- pcoa(charDist,correction = "lingoes")

#relative corrected eigenvalues
rel_corr_eig <- pco_res$values$Rel_corr_eig
layout(1:2)
plot(rel_corr_eig)
#cumulative
plot(cumsum(rel_corr_eig))

#well let's look at those PCO axes anyway
layout(1)
pco_axes <- pco_res$vectors
plot(pco_axes[,1],pco_axes[,2],pch = 16,
   xlab = paste("PCO Axis 1, Rel. Corr. Eigenvalue  = ",round(rel_corr_eig[1],3)),
   ylab = paste("PCO Axis 2, Rel. Corr. Eigenvalue  = ",round(rel_corr_eig[2],3)))

#######

# plot 12 taxon majority rule tree from Song and Zhang
plot(cladogramDicranoX12,
main = "MajRule_24charX12Taxa_wBiostratChar")

# plot 13 taxon MPT
plot(cladogramDicranoX13,
main = "MPT_24charX13Taxa_wBiostratChar")

##############

## Not run: 
##D # Data was generated with following script:
##D require(ape)
##D require(phylobase)
##D 
##D charMatDicrano <- readNexus(file.choose(),type = "data",SYMBOLS = " 0 1 2")
##D 
##D cladogramDicranoX12 <- read.tree(file.choose())
##D cladogramDicranoX13 <- read.nexus(file.choose())
##D 
##D cladogramDicranoX13$tip.label <- rownames(
##D 	 charMatDicrano)[c(13,8,7,9,12,10,1,4,6,2,3,11,5)]
##D 
##D save(charMatDicrano,cladogramDicranoX12,file = "SongZhangDicrano.rdata")
## End(Not run)



