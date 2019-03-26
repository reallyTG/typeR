## ----Try it out----------------------------------------------------------
library(loadr)
loadrEnv("SV")

## ------------------------------------------------------------------------
eload(list(sampleData = rnorm(1e7, 0,1)))

## ------------------------------------------------------------------------
ls()
class(SV)

## ------------------------------------------------------------------------
ls(envir=SV)

## ------------------------------------------------------------------------
head(SV$sampleData)

## ------------------------------------------------------------------------
eload(list(x=5, y=7))

## ------------------------------------------------------------------------
eload(list(x=526, y=234))
SV$x
SV$y

## ------------------------------------------------------------------------
loadMyData = function() {
	filePath = system.file("extdata", "mydata.txt", package="loadr")
	myData = read.table(filePath)
	return(myData)
}

## ------------------------------------------------------------------------
eload(list(myvector=loadMyData()))
SV$myvector

## ------------------------------------------------------------------------
myLocalVar = 15
vload(myLocalVar)


## ------------------------------------------------------------------------
myLocalVar2 = 22
myLocalVar3 = 31
vload(myLocalVar2, myLocalVar3)

## ------------------------------------------------------------------------
myLocalVar4 = 15
vload(myLocalVar2, myLocalVar3, varNames=c("var1", "var2"))

## ------------------------------------------------------------------------
loadMyData = function(genome) {
	filePath = system.file("extdata", "mydata.txt", package="loadr")
	myData = read.table(filePath)
	return(myData)
}

## ------------------------------------------------------------------------
genome="hg19"
vload(loadMyData(genome), varNames=paste0("myvector_", genome))

genome="mm10"
vload(loadMyData(genome), varNames=paste0("myvector_", genome))

## ------------------------------------------------------------------------
genomes=c("hg19", "mm10")
res = lapply(genomes, function(genome) { 
	vload(loadMyData(genome), varNames=paste0("myvector_", genome))
	})

