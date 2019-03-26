library(MOJOV)


### Name: MOJOV.read
### Title: Reading genotype and phenotype and generating a "MOJOV" class.
### Aliases: MOJOV.read

### ** Examples

  #Reading both genotype and phenotype files.
  file1<-system.file("data","geno.csv.gz",package="MOJOV")
  file2<-system.file("data","phen.csv.gz",package="MOJOV")
  x<-MOJOV.read(genofile=file1,phenofile=file2)
  
  #Reading phenotype and switch different phenotype column to analysis.
  x  #x is a existing "MOJOV" class. The phenotype is R_13_AREA.
  x<-MOJOV.read(x=x,phenofile=file2,column=2) #The phenotype is _13_BMD.



