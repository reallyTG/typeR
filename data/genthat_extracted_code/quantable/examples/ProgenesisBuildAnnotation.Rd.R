library(quantable)


### Name: ProgenesisBuildAnnotation
### Title: build annotation from column names
### Aliases: ProgenesisBuildAnnotation

### ** Examples


if(0){
file = file.path(path.package("quantable"),"extdata/PG/ProteinMeasurement_inclSingleHits_hi3.csv" )
tmp <- ProgenesisRead(file)
colnames(tmp)
xx <- ProgenesisBuildAnnotation(tmp)
head(xx$anno)
colnames(xx$data)
colnames(tmp)
}



