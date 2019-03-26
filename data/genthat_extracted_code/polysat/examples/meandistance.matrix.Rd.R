library(polysat)


### Name: meandistance.matrix
### Title: Mean Pairwise Distance Matrix
### Aliases: meandistance.matrix meandistance.matrix2
### Keywords: array arith

### ** Examples

# create a list of genotype data
mygendata <- new("genambig", samples = c("ind1","ind2","ind3","ind4"),
                 loci = c("locus1","locus2","locus3","locus4"))
Genotypes(mygendata) <-
  array(list(c(124,128,138),c(122,130,140,142),c(122,132,136),c(122,134,140),
             c(203,212,218),c(197,206,221),c(215),c(200,218),
             c(140,144,148,150),c(-9),c(146,150),c(152,154,158),
             c(233,236,280),c(-9),c(-9),c(-9)))
Usatnts(mygendata) <- c(2,3,2,1)

# make index vectors of data to use
myloci <- c("locus1","locus2","locus3")
mysamples <- c("ind1","ind2","ind4")

# calculate array and matrix
mymat <- meandistance.matrix(mygendata, mysamples, myloci,
                             all.distances=TRUE)
# view the results
mymat[[1]]["locus1",,]
mymat[[1]]["locus2",,]
mymat[[1]]["locus3",,]
mymat[[2]]

# add addtional info needed for meandistance.matrix2
mygendata <- reformatPloidies(mygendata, output="one")
Ploidies(mygendata) <- 4
PopInfo(mygendata) <- c(1,1,1,1)

# calculate distances taking allele freqs into account
mymat2 <- meandistance.matrix2(mygendata, mysamples, myloci)
mymat2
# now do the same under selfing
mymat3 <- meandistance.matrix2(mygendata, mysamples, myloci, self=0.3)
mymat3



