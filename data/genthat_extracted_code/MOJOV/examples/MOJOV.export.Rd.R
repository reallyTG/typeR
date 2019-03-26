library(MOJOV)


### Name: MOJOV.export
### Title: Export test result from a MOJOV class to file.
### Aliases: MOJOV.export

### ** Examples

  file1<-system.file("data","geno.csv.gz",package="MOJOV")
  file2<-system.file("data","phen.csv.gz",package="MOJOV")
  x<-MOJOV.read(genofile=file1,phenofile=file2)
  x<-MOJOV.phenotype(x=x)
  x<-MOJOV.analysis(x=x)
  MOJOV.export(x=x,file="example.result.csv",p=0.05)



