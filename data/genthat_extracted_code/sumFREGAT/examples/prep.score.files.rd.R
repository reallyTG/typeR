library(sumFREGAT)


### Name: prep.score.files
### Title: Prepare score files
### Aliases: prep.score.files

### ** Examples


input.file <- system.file("testfiles/CFH.full.input.dat", package = "sumFREGAT")
prep.score.files(input.file, output.file.prefix = "CFH.scores.full")

## Not run: 
##D 
##D # requires reference file "ref1KG.MAC5.EUR_AF.RData" (can be downloaded
##D # at http://mga.bionet.nsc.ru/sumFREGAT/)
##D 
##D input.file <- system.file("testfiles/CFH.dat", package = "sumFREGAT")
##D prep.score.files(input.file, reference = "ref1KG.MAC5.EUR_AF.RData",
##D 	output.file.prefix = "CFH.scores")
##D 
##D input.file <- system.file("testfiles/CFH.full.input.dat", package = "sumFREGAT")
##D prep.score.files(input.file, reference = "ref1KG.MAC5.EUR_AF.RData",
##D 	output.file.prefix = "CFH.scores.full.ref")
##D 
## End(Not run)



