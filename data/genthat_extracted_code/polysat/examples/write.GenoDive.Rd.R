library(polysat)


### Name: write.GenoDive
### Title: Write a File in GenoDive Format
### Aliases: write.GenoDive
### Keywords: file

### ** Examples

# set up the genotype object (usually done by reading a file)
mysamples <- c("Mal", "Inara", "Kaylee", "Simon", "River", "Zoe",
               "Wash", "Jayne", "Book")
myloci <- c("loc1", "loc2")
mygendata <- new("genambig", samples=mysamples, loci=myloci)
mygendata <- reformatPloidies(mygendata, output="sample")
Genotypes(mygendata, loci="loc1") <- list(c(304,306), c(302,310),
                                          c(306), c(312,314),
    c(312,314), c(308,310), c(312), c(302,308,310), c(-9))
Genotypes(mygendata, loci="loc2") <- list(c(118,133), c(121,130),
                                          c(122,139), c(124,133),
    c(118,124), c(121,127), c(124,136), c(124,127,136), c(121,130))
Usatnts(mygendata) <- c(2,3)
PopNames(mygendata) <- c("Core","Outer Rim")
PopInfo(mygendata) <- c(2,1,2,1,1,2,2,2,1)
Ploidies(mygendata) <- c(2,2,2,2,2,2,2,3,2)
Description(mygendata) <- "Serenity crew"

# write files (use file="" to write to the console instead)
write.GenoDive(mygendata, digits=2, file="testGenoDive2.txt")
write.GenoDive(mygendata, digits=3, file="testGenoDive3.txt")



