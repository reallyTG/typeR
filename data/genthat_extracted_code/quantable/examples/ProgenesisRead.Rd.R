library(quantable)


### Name: ProgenesisRead
### Title: reads file exportet from progenesis ProgenesisRead
### Aliases: ProgenesisRead

### ** Examples



if(0){
print("example does not run because can't ship large files")
file = file.path(path.package("quantable"),"extdata/PG/PeptideMeasurement_inclSingleHits_hi3.csv" )
tmp <- ProgenesisRead(file)
colnames(tmp)
head(tmp)

file = file.path(path.package("quantable"),"extdata/PG/ProteinMeasurement_inclSingleHits_hi3.csv" )
tmp <- ProgenesisRead(file)
colnames(tmp)
head(tmp)
}




