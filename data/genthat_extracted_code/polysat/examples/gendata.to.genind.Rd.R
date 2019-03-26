library(polysat)


### Name: gendata.to.genind
### Title: Convert Data to genind Format
### Aliases: gendata.to.genind
### Keywords: manip

### ** Examples

# create a "genambig" object
mydata <- new("genambig", samples=c("a","b","c","d"), loci=c("e","f"))
PopNames(mydata) <- c("G","H")
PopInfo(mydata) <- c(1,1,2,2)
mydata <- reformatPloidies(mydata, output="one")
Ploidies(mydata) <- 3
Genotypes(mydata, loci="e") <- list(c(100),c(100,102),
                                    c(98,102,104),c(102,106))
Genotypes(mydata, loci="f") <- list(c(200,202,204),Missing(mydata),
                                    c(210,212),c(204,210,214))

# convert to "genind"
if(require("adegenet")){
  mydata2 <- gendata.to.genind(mydata)
  mydata2@tab
  locNames(mydata2)
  indNames(mydata2)
  popNames(mydata2)
  pop(mydata2)
}



