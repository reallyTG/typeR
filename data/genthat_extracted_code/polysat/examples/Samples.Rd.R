library(polysat)


### Name: Accessors
### Title: Accessor and Replacement Functions for "gendata" Objects
### Aliases: Samples Samples<- Loci Loci<- PopInfo PopInfo<- PopNames
###   PopNames<- Ploidies Ploidies<- Usatnts Usatnts<- Description
###   Description<- Missing Missing<- Genotype Genotype<- Genotypes
###   Genotypes<- PopNum PopNum<- Present Present<- Absent Absent<-
### Keywords: methods

### ** Examples

# create a new genambig (subclass of gendata) object to manipulate
mygen <- new("genambig", samples=c("a", "b", "c"), loci=c("locG",
"locH"))

# retrieve the sample and locus names
Samples(mygen)
Loci(mygen)

# change some of the sample and locus names
Loci(mygen) <- c("lG", "lH")
Samples(mygen)[2] <- "b1"

# describe the dataset
Description(mygen) <- "Example dataset for documentation."

# name some populations and assign samples to them
PopNames(mygen) <- c("PopL", "PopK")
PopInfo(mygen) <- c(1,1,2)
# now we can retrieve samples by population
Samples(mygen, populations="PopL")
# we can also adjust the numbers if we want to make them
# match another dataset
PopNum(mygen, "PopK") <- 3
PopNames(mygen)
PopInfo(mygen)
# change the population identity of just one sample
PopInfo(mygen)["b1"] <- 3

# indicate that both loci are dinucleotide repeats
Usatnts(mygen) <- c(2,2)

# indicate that all samples are tetraploid
Ploidies(mygen) <- 4
# or
Ploidies(mygen) <- rep(4, times = length(Samples(mygen)) * length(Loci(mygen)))
# actually, one sample is triploid
Ploidies(mygen)["c",] <- 3
# view ploidies
Ploidies(mygen)

# view the genotype array as it currently is: filled with missing
# values
Genotypes(mygen)
# fill in the genotypes
Genotypes(mygen, loci="lG") <- list(c(120, 124, 130, 136), c(122, 120),
                                    c(128, 130, 134))
Genotypes(mygen, loci="lH") <- list(c(200, 202, 210), c(206, 208, 210,
                                                        214),
                                    c(208))
# genotypes can also be edited or retrieved by sample
Genotypes(mygen, samples="a")
# fix a single genotype
Genotype(mygen, "a", "lH") <- c(200, 204, 210)
# retrieve a single genotype
Genotype(mygen, "c", "lG")

# change a genotype to being missing
Genotype(mygen, "c", "lH") <- Missing(mygen)
# show the current missing data symbol
Missing(mygen)
# an example of genotypes where one contains the missing data symbol
Genotypes(mygen, samples="c")
# change the missing data symbol
Missing(mygen) <- as.integer(-1)
# now look at the genotypes
Genotypes(mygen, samples="c")




