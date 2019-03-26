library(pedantics)


### Name: rpederr
### Title: Permutes a pedigree to create a plausible complete pedigree
### Aliases: rpederr
### Keywords: datagen

### ** Examples

id<-   c("a1","a2","a3","a4","a5","a6","a7","a8","a9")
dam<-  c(NA,NA,NA,"a1","a1","a1","a4","a4","a4")
sire<- c(NA,NA,NA,NA,NA,NA,"a5","a5","a5")
found<-c(1,1,1,0,0,0,0,0,0)
samp<- c(1,1,1,1,1,1,1,1,1)
sex<-  c(1,0,0,1,0,0,1,0,0)
dade<- rep(0,9)
mume<- rep(0,9)
dads<- rep(1,9)
mums<- rep(1,9)
cohort<-c(1,1,1,2,2,2,3,3,3)
first<-c(2,2,2,3,3,3,4,4,4)
last<-c(2,2,2,3,3,3,4,4,4)
pedigree<-as.data.frame(cbind(id,sire,dam))

### don't simulate any errors, just fill in the missing sires
rpederr(assumedPedigree=pedigree,founders=found,sex=sex,
                  samp=samp,cohort=cohort,first=first,last=last)

## fill in the missing sires, and additionally simulate a problem 
## with the second maternal sibship note that it is probabilistic, 
## so this example may need to be run a couple of times before the
## error comes up, given the very small example dataset
fatherErrors<-c(0,0,0,0,0,0,0.8,0.8,0.8)
rpederr(assumedPedigree=pedigree,founders=found,sex=sex,samp=samp,
           sireE=fatherErrors,cohort=cohort,first=first,last=last)



