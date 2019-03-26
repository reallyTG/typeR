library(pedantics)


### Name: fixPedigree
### Title: Manipulating pedigrees to prepare them for requirements of
###   subsequent analyses
### Aliases: fixPedigree
### Keywords: manip

### ** Examples

##  a valid pedigree, i.e., no loops, no bisexuality, etc.,
## but where not all parents have a record line, and where 
## parents do not necessarily occur before their offspring:
pedigree<-as.data.frame(matrix(c(
  10,1,2,
  11,1,2,
  12,1,3,
  13,1,3,
  14,4,5,
  15,6,7,
  4,NA,NA,
  5,NA,NA,
  6,NA,NA,
  7,NA,NA),10,3,byrow=TRUE))
names(pedigree)<-c("id","dam","sire")
pedigree
fixedPedigree<-fixPedigree(Ped=pedigree)
fixedPedigree



