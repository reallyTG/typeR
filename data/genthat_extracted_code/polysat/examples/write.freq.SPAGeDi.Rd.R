library(polysat)


### Name: write.freq.SPAGeDi
### Title: Create a File of Allele Frequencies for SPAGeDi
### Aliases: write.freq.SPAGeDi
### Keywords: file array

### ** Examples

## Not run: 
##D # set up a genambig object to use in this example
##D mygen <- new("genambig", samples=c(paste("G", 1:30, sep=""),
##D                                    paste("R", 1:50, sep="")),
##D              loci=c("afrY", "ggP"))
##D PopNames(mygen) <- c("G", "R")
##D PopInfo(mygen) <- c(rep(1, 30), rep(2, 50))
##D mygen <- reformatPloidies(mygen, output="one")
##D Ploidies(mygen) <- 4
##D Usatnts(mygen) <- c(2, 2)
##D 
##D # randomly create genotypes according to pre-set allele frequencies
##D for(s in Samples(mygen, populations=1)){
##D     Genotype(mygen, s, "afrY") <-
##D         unique(sample(c(140, 142, 146, 150, 152), 4, TRUE,
##D                       c(.30, .12, .26, .08, .24)))
##D     Genotype(mygen, s, "ggP") <-
##D         unique(sample(c(210, 214, 218, 220, 222), 4, TRUE,
##D                       c(.21, .13, .27, .07, .32)))
##D }
##D for(s in Samples(mygen, populations=2)){
##D     Genotype(mygen, s, "afrY") <-
##D         unique(sample(c(140, 142, 144, 150, 152), 4, TRUE,
##D                       c(.05, .26, .17, .33, .19)))
##D     Genotype(mygen, s, "ggP") <-
##D         unique(sample(c(212, 214, 220, 222, 224), 4, TRUE,
##D                       c(.14, .04, .36, .20, .26)))
##D }
##D 
##D # write a SPAGeDi file
##D write.SPAGeDi(mygen, file="SPAGdataFreqExample.txt")
##D 
##D # calculate allele frequenies
##D myfreq <- deSilvaFreq(mygen, self = 0.05)
##D 
##D # write allele frequencies file
##D write.freq.SPAGeDi(myfreq, usatnts=Usatnts(mygen),
##D file="SPAGfreqExample.txt")
## End(Not run)
## Don't show: 
# a shorter example for R CMD check
myfreq2 <- data.frame(row.names=c("G","R"), Genomes=c(120,200),
             abc.130=c(0.13, 0.2), abc.132=c(0.34, 0.5),
             abc.134=c(0.53, 0.3))
myusatnts <- as.integer(2)
names(myusatnts) <- "abc"
write.freq.SPAGeDi(myfreq2, usatnts=myusatnts, file="SPAGfreqExample2.txt")
## End(Don't show)




