library(kinship2)


### Name: pedigree.unrelated
### Title: Determine set of maximum number of unrelated available subjects
###   from a pedigree
### Aliases: pedigree.unrelated

### ** Examples

data(sample.ped)
fam1 <- sample.ped[sample.ped$ped==1,]


ped1 <- pedigree(fam1$id, fam1$father, fam1$mother,
                 fam1$sex, fam1$affected, fam1$avail)

## to see plot:
## plot.pedigree(ped1, align=FALSE)
id1 <- pedigree.unrelated(ped1, avail=fam1$avail)

id1
## some possible vectors
##[1] "110" "113" "133" "109"
##[1] "113" "118" "141" "109" 
##[1] "113" "118" "140" "109" 
##[1] "110" "113" "116" "109" 
##[1] "113" "133" "141" "109" 

 
fam2 <- sample.ped[sample.ped$ped==2,]

ped2 <- pedigree(fam2$id, fam2$father, fam2$mother,
               fam2$sex, fam2$affected, fam2$avail)

## to see plot:
## plot.pedigree(ped2, align=FALSE)

id2 <- pedigree.unrelated(ped2, avail=fam2$avail)

## some possible vectors
##[1] "203" "207"
##[1] "203" "204"
##[1] "201" "203"
##[1] "214" "203"
id2




