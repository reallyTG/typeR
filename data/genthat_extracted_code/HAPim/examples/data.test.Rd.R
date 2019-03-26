library(HAPim)


### Name: data.test
### Title: data.test
### Aliases: data.test
### Keywords: datasets

### ** Examples


data(data.test)

#distance between two consecutive markers on the chromosome
 map=data.test[[1]]
 map

#haplotype transmitted by dams
#son information (lines) are ordered following genea[,1]
 hap.trans.mere=data.test[[2]]
 hap.trans.mere

#haplotype transmitted by sires
#son information (lines) are ordered following genea[,1]
 hap.trans.pere=data.test[[3]]
 hap.trans.pere

#haplotype of the first chromosome for each sire
#sire information (lines) are ordered following unique(genea[,2])
 hap.chrom1.pere=data.test[[4]]
 hap.chrom1.pere

#haplotype of the second chromosome for each sire
#sire information (lines) are ordered following unique(genea[,2])
 hap.chrom2.pere=data.test[[5]]
 hap.chrom2.pere

#performances of sons
#son information are ordered following genea[,1]
 perf=data.test[[6]]
 perf

#CD of sons
#son information are ordered following genea[,1]
 CD=data.test[[7]]
 CD

#transmission probabilities of sons for each test position
#son information (lines) are ordered following genea[,1]
 PLA=data.test[[8]]
 PLA

#son index and  index of his father
 genea=data.test[[9]]
 genea




