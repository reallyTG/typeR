library(genetics)


### Name: genotype
### Title: Genotype or Haplotype Objects.
### Aliases: genotype haplotype is.genotype is.haplotype as.genotype
###   as.haplotype print.genotype ==.genotype ==.haplotype %in%
###   %in%.default %in%.genotype %in%.haplotype [.genotype [.haplotype
###   [<-.genotype [<-.haplotype heterozygote.genotype homozygote.genotype
###   print.allele.count print.allele.genotype allele.count.genotype
###   as.genotype.allele.count as.genotype.character as.genotype.default
###   as.genotype.factor as.genotype.genotype as.genotype.haplotype
###   as.genotype.table nallele
### Keywords: misc

### ** Examples

# several examples of genotype data in different formats
example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data)
g1

example.data2  <- c("C-C","C-T","C-C","T-T","C-C",
                    "C-C","C-C","C-C","T-T","")
g2  <- genotype(example.data2,sep="-")
g2


example.nosep  <- c("DD", "DI", "DD", "II", "DD",
                    "DD", "DD", "DD", "II", "")
g3  <- genotype(example.nosep,sep="")
g3

example.a1 <- c("D",  "D",  "D",  "I",  "D",  "D",  "D",  "D",  "I",  "")
example.a2 <- c("D",  "I",  "D",  "I",  "D",  "D",  "D",  "D",  "I",  "")
g4  <- genotype(example.a1,example.a2)
g4

example.mat <- cbind(a1=example.a1, a1=example.a2)
g5  <- genotype(example.mat)
g5

example.data5  <- c("D   /   D","D   /   I","D   /   D","I   /   I",
                    "D   /   D","D   /   D","D   /   D","D   /   D",
                    "I   /   I","")
g5  <- genotype(example.data5,rem=TRUE)
g5

# show how genotype and haplotype differ
data1 <- c("C/C", "C/T", "T/C")
data2 <- c("C/C", "T/C", "T/C")

test1  <- genotype( data1 )
test2  <- genotype( data2 )

test3  <-  haplotype( data1 )
test4  <-  haplotype( data2 )

test1==test2
test3==test4

test1=="C/T"
test1=="T/C"

test3=="C/T"
test3=="T/C"

## also
test1 
test1 
test3 

test1 
test1 

test3 
test3 

## "Messy" example

m3  <-  c("D D/\t   D D","D\tD/   I",  "D D/   D D","I/   I",
          "D D/   D D","D D/   D D","D D/   D D","D D/   D D",
          "I/   I","/   ","/I")

genotype(m3)
summary(genotype(m3))

m4  <-  c("D D","D I","D D","I I",
          "D D","D D","D D","D D",
          "I I","   ","  I")

genotype(m4,sep=1)
genotype(m4,sep=" ",remove.spaces=FALSE)
summary(genotype(m4,sep=" ",remove.spaces=FALSE))

m5  <-  c("DD","DI","DD","II",
          "DD","DD","DD","DD",
          "II","   "," I")
genotype(m5,sep=1)
haplotype(m5,sep=1,remove.spaces=FALSE)

g5  <- genotype(m5,sep="")
h5  <- haplotype(m5,sep="")

heterozygote(g5)
homozygote(g5)
carrier(g5,"D")

g5[9:10]  <- haplotype(m4,sep=" ",remove=FALSE)[1:2]
g5

g5[9:10]
allele(g5[9:10],1)
allele(g5,1)[9:10]

# drop unused alleles
g5[9:10,drop=TRUE]
h5[9:10,drop=TRUE]

# Convert allele.counts into genotype

x <- c(0,1,2,1,1,2,NA,1,2,1,2,2,2)
g <- as.genotype.allele.count(x, alleles=c("C","T") )
g

# Use of genotypeOrder
example.data   <- c("D/D","D/I","I/D","I/I","D/D",
                    "D/D","D/I","I/D","I/I","")
summary(genotype(example.data))
genotypeOrder(genotype(example.data))

summary(genotype(example.data, genotypeOrder=c("D/D", "I/I", "D/I")))
summary(genotype(example.data, genotypeOrder=c(              "D/I")))
summary(haplotype(example.data, genotypeOrder=c(             "I/D", "D/I")))
example.data <- genotype(example.data)
genotypeOrder(example.data) <- c("D/D", "I/I", "D/I")
genotypeOrder(example.data)




