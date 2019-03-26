library(MOJOV)


### Name: MOJOV.analysis
### Title: Analysis between rare variants and quantatitive traits using
###   CMC.
### Aliases: MOJOV.analysis

### ** Examples

  file1<-system.file("data","geno.csv.gz",package="MOJOV")
  file2<-system.file("data","phen.csv.gz",package="MOJOV")
  x<-MOJOV.read(genofile=file1,phenofile=file2)
  x<-MOJOV.phenotype(x=x)
  x<-MOJOV.analysis(x=x)
  


