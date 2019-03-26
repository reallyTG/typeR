library(rehh)


### Name: data2haplohh
### Title: Converting data into an object of class haplohh
### Aliases: data2haplohh

### ** Examples

#Copy example files in the current working directory.
make.example.files()
#using the fastPHASE output haplotype example file
hap<-data2haplohh(hap_file="bta12_hapguess_switch.out",map_file="map.inp",
min_maf=0.05,popsel=7,chr.name=12,recode.allele=TRUE)
#using the standard output haplotype example file
hap<-data2haplohh(hap_file="bta12_cgu.hap",map_file="map.inp",
min_maf=0.05,chr.name=12,recode.allele=TRUE)



