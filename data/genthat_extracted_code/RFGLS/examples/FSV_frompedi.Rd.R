library(RFGLS)


### Name: FSV.frompedi
### Title: Family-Structure Variables from Pedigree File
### Aliases: FSV.frompedi

### ** Examples

data(pheno)
data(pedigree)
table(pheno$FTYPE) ##<--Frequencies of correct family types.


fsvtest1 <- FSV.frompedi(pedi.dat=pedigree,
  phen.dat=data.frame(ID=pheno[,2])) ##<--Bare minimum phenotype file.
table(fsvtest1$FTYPE) ##<--Not correct, because pedigree file
                      ##doesn't have enough additional info
                      ##to recover the actual family-types
                      ##and individual codes.

#Create "ZYGOSITY" column:
pedigree$ZYGOSITY <- NA
pedigree$ZYGOSITY[pheno$FTYPE==1 & pheno$INDIV<3] <- 1
pedigree$ZYGOSITY[pheno$FTYPE==2 & pheno$INDIV<3] <- 2

fsvtest2 <- FSV.frompedi(pedi.dat=pedigree,phen.dat=data.frame(ID=pheno[,2]))
table(fsvtest2$FTYPE) ##<--Still not right, because pedigree file
                      ##lacks info about adoptees.
                      
#Create "ADOPTED" column:
pedigree$ADOPTED <- 0
pedigree$ADOPTED[pheno$FTYPE==3 & pheno$INDIV<3] <- 1
pedigree$ADOPTED[pheno$FTYPE==5 & pheno$INDIV==2] <- 1
fsvtest3 <- FSV.frompedi(pedi.dat=pedigree,phen.dat=data.frame(ID=pheno[,2]))
table(fsvtest3$FTYPE) ##<--Almost there.

#Create "INDEP" column:
pedigree$INDEP <- 0
pedigree$INDEP[pheno$FTYPE==6] <- 1
fsvtest4 <- FSV.frompedi(pedi.dat=pedigree,phen.dat=data.frame(ID=pheno[,2]))
table(fsvtest4$FTYPE) ##<--Correct family types have been recovered.
table(pheno$FTYPE) ##<--Compare.
all(pheno$FTYPE==fsvtest4$FTYPE) ##<--TRUE.



