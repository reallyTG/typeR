library(genetics)


### Name: locus
### Title: Create and Manipulate Locus, Gene, and Marker Objects
### Aliases: locus gene marker is.gene is.locus is.marker print.gene
###   print.locus print.marker as.character.locus as.character.gene
###   as.character.marker getlocus getmarker getgene locus<- marker<-
###   gene<-
### Keywords: misc

### ** Examples

ar2  <- gene("AR2",chromosome=7,arm="q",index.start=35)
ar2

par  <- locus(name="AR2 Psedogene",
              chromosome=1,
              arm="q",
              index.start=32,
              index.end=42)
par

c109t  <- marker(name="C-109T",
                 type="SNP",
                 locus.name="AR2",
                 chromosome=7,
                 arm="q",
                 index.start=35,
                 bp.start=-109,
                 relative.to="start of coding region")
c109t

c109t  <- marker(name="C-109T",
                 type="SNP",
                 locus=ar2,
                 bp.start=-109,
                 relative.to="start of coding region")
c109t




example.data   <- c("D/D","D/I","D/D","I/I","D/D",
                    "D/D","D/D","D/D","I/I","")
g1  <- genotype(example.data, locus=ar2)
g1

getlocus(g1)

summary(g1)
HWE.test(g1)

g2  <- genotype(example.data, locus=c109t)
summary(g2)

getlocus(g2)

heterozygote(g2)
homozygote(g1)

allele(g1,1)

carrier(g1,"I")

heterozygote(g2)



