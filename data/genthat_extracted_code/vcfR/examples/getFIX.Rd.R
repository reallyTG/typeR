library(vcfR)


### Name: getFIX
### Title: Get elements from the fixed region of a VCF file
### Aliases: getFIX getFIX,chromR-method getFIX,vcfR-method getCHROM
###   getCHROM,chromR-method getCHROM,vcfR-method getPOS
###   getPOS,chromR-method getPOS,vcfR-method getQUAL getQUAL,chromR-method
###   getQUAL,vcfR-method getALT getALT,chromR-method getALT,vcfR-method
###   getREF getREF,chromR-method getREF,vcfR-method getID
###   getID,chromR-method getID,vcfR-method getFILTER
###   getFILTER,chromR-method getFILTER,vcfR-method getINFO
###   getINFO,chromR-method getINFO,vcfR-method

### ** Examples

library("vcfR")
data("vcfR_example")
data("chromR_example")
getFIX(vcf) %>% head
getFIX(chrom) %>% head

getCHROM(vcf) %>% head
getCHROM(chrom) %>% head

getPOS(vcf) %>% head
getPOS(chrom) %>% head

getID(vcf) %>% head
getID(chrom) %>% head

getREF(vcf) %>% head
getREF(chrom) %>% head

getALT(vcf) %>% head
getALT(chrom) %>% head

getQUAL(vcf) %>% head
getQUAL(chrom) %>% head

getFILTER(vcf) %>% head
getFILTER(chrom) %>% head

getINFO(vcf) %>% head
getINFO(chrom) %>% head




