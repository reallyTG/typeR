library(berryFunctions)


### Name: nameSample
### Title: Nonrandom character sequence with sample
### Aliases: nameSample
### Keywords: character

### ** Examples


## Not run in RCMD check as they're very time consuming
## Not run: 
##D nameSample("berry")  # After that, you can send the result to colleagues:
##D # Kind regards from
##D set.seed(1248272); paste(sample(letters,5,TRUE), collapse='')
##D 
##D # calculation time
##D                                        # on my slow laptop:   # on PC
##D system.time(nameSample("berr"))        # 25 s # berry: 57 s     10  23
##D system.time(nameSample("berr", FALSE)) # 23 s          53 s      9  20
##D 
##D # let <- sapply(1:4, function(n) apply(replicate(n, letters[sample(15)]), 1, paste, collapse=""))
##D # calctime <- sapply(let, function(x) system.time(nameSample(x, progress=F))[3])
##D # write.table(calctime, "calctime_nameSample.txt")
##D ctfile  <- system.file("extdata/calctime_nameSample.txt",  package="berryFunctions")
##D ctfile2 <- system.file("extdata/calctime_nameSample2.txt", package="berryFunctions")
##D calctime <- read.table(ctfile)
##D # regression result in hours:
##D expReg(nchar(rownames(calctime))-8, calctime[,1], xlim=c(1,7), ylim=c(-3,4),
##D        predict=7)/3600
##D 
##D # For my 3 times faster computer:
##D calctime <- read.table(ctfile2)
##D expReg(nchar(rownames(calctime))-8, calctime[,1], xlim=c(1,7), ylim=c(-3,4),
##D        predict=c(4,7))/c(1,3600)
##D # 4 sec for 4 letters are expected to be 10 hours for 7 letters...
##D 
## End(Not run)




