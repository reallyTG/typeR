library(hsphase)


### Name: pogc
### Title: Parent Offspring Group Constructor
### Aliases: pogc
### Keywords: pedigree parentage

### ** Examples

set.seed(100)
chr <- list()
sire <- list()
set.seed(1)
chr <- list()
for(i in 1:5)
{
	chr[[i]] <- .simulateHalfsib(numInd = 20, numSNP = 5000, recbound = 1:10)
	sire[[i]] <- ssp(bmh(chr[[i]]), chr[[i]])
	sire[[i]] <- sire[[i]][1,] + sire[[i]][2,]
	sire[[i]][sire[[i]] == 18] <- 9
}

Genotype <- do.call(rbind, chr)
rownames(Genotype) <- 6:(nrow(Genotype) + 5)
sire <- do.call(rbind, sire)
rownames(sire) <- 1:5
Genotype <- rbind(sire, Genotype)
oh <- ohg(Genotype)  # creating the Opposing Homozygote matrix
pogc(oh, 5)



