library(haplo.stats)


### Name: setupGeno
### Title: Create a group of locus objects from a genotype matrix, assign
###   to 'model.matrix' class.
### Aliases: setupGeno

### ** Examples

# Create some loci to work with
a1 <- 1:6
a2 <- 7:12

b1 <- c("A","A","B","C","E","D")
b2 <-c("A","A","C","E","F","G")

c1 <- c("101","10","115","132","21","112")
c2 <- c("100","101","0","100","21","110")

myGeno <- data.frame(a1,a2,b1,b2,c1,c2)
myGeno <- setupGeno(myGeno)
myGeno

attributes(myGeno)$unique.alleles



