library(Familias)


### Name: FamiliasPosterior
### Title: Calculates posterior probabilities and likelihoods for pedigrees
### Aliases: FamiliasPosterior

### ** Examples

#Example 1
#Data is available for "mother", "daughter" and "AF" for two loci (systems). 
#Three pedigrees are defined, with "mother" being the mother of "daughter" 
#in all cases. "AF" may be the father (ped1), unrelated (ped1) or
#uncle (ped3). The posterior probabilities for the pedigrees are calculated 
#and likelihoods are also given so that
#likelihood ratios can be computed. Compared to the windows version of Familias 2.0, 
#it is easy to plot pedigrees and define arbitrary priors for the three alternative pedigrees.
#The below implementation uses the R package kinship2 to define and plot pedigrees

persons <- c("mother", "daughter", "AF")
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA, "AF", NA), momid=c(NA, "mother", NA), 
sex=c("female", "female", "male"))
ped2 <- FamiliasPedigree(id=c(persons, "TF"), dadid=c(NA, "TF", NA, NA), 
momid=c(NA, "mother", NA, NA), 
sex=c("female", "female", "male", "male"))
ped3 <- FamiliasPedigree(id=c(persons, "TF", "gf", "gm"), dadid = c(NA, "TF", "gf", "gf", NA, NA), 
momid=c(NA, "mother", "gm", "gm", NA, NA), 
sex=c("female", "female", "male", "male", "male", "female"))
par(mfrow=c(3,1))
plot(ped1);title("ped1, i.e., AF is father")
plot(ped2);title("ped2, i.e., AF is unrelated")
plot(ped3);title("ped3, i.e., AF is uncle")
par(mfrow=c(1,1))
mypedigrees <- list(isFather = ped1, unrelated=ped2, isUncle = ped3)
locus1 <- FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4), 
allelenames= c("A", "B", "C", "D"), name="locus1")
locus2 <- FamiliasLocus(c(0.2, 0.3, 0.5), c(17, 18, 19), "loc2", femaleMutationRate = 0.05)
myloci <- list(locus1, locus2)
datamatrix <- data.frame(locus1.1=c("A", "A", "A"), locus1.2=c("B", "B", "C"), 
locus2.1=c(17, 19, 19), locus2.2=c(18, 18, 18))
rownames(datamatrix) <- persons
result=FamiliasPosterior(mypedigrees, myloci, datamatrix,ref=2)

#Example 2. Example 1 continued.
#Below commands (from scratch) are based on paramlink to prepare pedigrees
persons <- c("AF","mother", "daughter")
ped1=swapSex(nuclearPed(1),3)
ped1=as.data.frame(ped1)
ped1.c=ConvertPed(ped1,persons)$ped
plot(ped1.c,main="ped1")

ped1=swapSex(nuclearPed(1),3)
AF=singleton(4)
ped2=rbind(as.data.frame(ped1),as.data.frame(AF))
persons <- c("TF","mother", "daughter","AF")
ped2.c=ConvertPed(ped2,persons)$ped
plot(ped2.c,main="ped2")

ped=nuclearPed(2)
ped=addOffspring(ped,father=4,noff=1,sex=2)
persons=c("gf","gm","AF","TF","mother","daughter")
plot(ped,id.labels=persons,main="ped3")
ped=as.data.frame(ped)
ped3.c=ConvertPed(ped,persons)$ped
mypedigrees <- list(isFather = ped1.c, unrelated=ped2.c, isUncle = ped3.c)

locus1 <- FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4),
allelenames= c("A", "B", "C", "D"), name="locus1")
locus2 <- FamiliasLocus(c(0.2, 0.3, 0.5), c(17, 18, 19), "loc2", 
femaleMutationRate = 0.05)
myloci <- list(locus1, locus2)
datamatrix <- data.frame(locus1.1=c("A", "A", "A"), locus1.2=c("B", "B", "C"), 
locus2.1=c(17, 19, 19), locus2.2=c(18, 18, 18))
rownames(datamatrix) <- c("mother", "daughter", "AF")
result=FamiliasPosterior(mypedigrees, myloci, datamatrix, ref=2)

#Example 3. Example 2 continued
#Below commands (from scratch) are based on paramlink to prepare pedigrees and datamatrix.
#The handling of datamatrix is artificial in *this* example; alternatively genotypes can be provided
#in other, perhaps more natural ways.
persons <- c("AF","mother", "daughter") 
#Names in paramlink are integers 1:length(persons)={1,2,3}
ped1=swapSex(nuclearPed(1),3)
dat <- data.frame(locus1.1=c("A", "A", "A"), locus1.2=c("C","B", "B"), 
locus2.1=c(19,17, 19), locus2.2=c(18, 18, 18)) #Consistent with persons above
ped1=cbind(as.data.frame(ped1),dat)
foo=ConvertPed(ped1,persons)
ped1.c=foo$ped
datamatrix=foo$datamatrix

ped1=swapSex(nuclearPed(1),3)
AF=singleton(4)
ped2=rbind(as.data.frame(ped1),as.data.frame(AF))
persons <- c("TF","mother", "daughter","AF")
ped2.c=ConvertPed(ped2,persons)$ped

ped=nuclearPed(2)
ped=addOffspring(ped,father=4,noff=1,sex=2)
persons=c("gf","gm","AF","TF","mother","daughter")
ped=as.data.frame(ped)
ped3.c=ConvertPed(ped,persons)$ped
mypedigrees <- list(isFather = ped1.c, unrelated=ped2.c, isUncle = ped3.c)

locus1 <- FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4),
allelenames= c("A", "B", "C", "D"), name="locus1")
locus2 <- FamiliasLocus(c(0.2, 0.3, 0.5), c(17, 18, 19), "loc2", femaleMutationRate = 0.05)
myloci <- list(locus1, locus2)

result=FamiliasPosterior(mypedigrees, myloci, datamatrix, ref=2)

#Example 4: Using FamiliasPedigree
persons <- c("person", "AF")
sex <- c("male", "male")
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA, NA), momid=c(NA, NA), sex=sex)
ped2 <- FamiliasPedigree(id=persons, dadid=c("AF", NA), momid=c(NA, NA), sex=sex)
mypedigrees <- list(unrelated = ped1, isFather=ped2)
locus1 <- FamiliasLocus(c(0.1, 0.2, 0.3, 0.4), c("A", "B", "C", "D"), "locus1", 
   maleMutationModel = "Equal", maleMutationRate = 0.005)
locus2 <- FamiliasLocus(c(0.2, 0.3, 0.5), c(17, 18, 19), "locus2", 
   maleMutationModel = "Equal", maleMutationRate = 0.005) 
myloci <- list(locus1, locus2)
datamatrix <- data.frame(locus1.1=c("A", "A"), locus1.2=c("B", "B"), 
locus2.1=c(17, 19), locus2.2=c(18, 18))
rownames(datamatrix) <- persons
result <- FamiliasPosterior(mypedigrees, myloci, datamatrix)

#Example 5: User-specified mutation matrices
persons <- c("son", "mother", "AF")
sex <- c("male", "female", "male")
ped1 <- FamiliasPedigree(id=persons, dadid=c(NA, NA, NA), momid=c("mother", NA, NA), sex=sex)
ped2 <- FamiliasPedigree(id=persons, dadid=c("AF", NA, NA), momid=c("mother", NA, NA), sex=sex)
mypedigrees <- list(unrelated = ped1, isFather=ped2)
locus1 <- FamiliasLocus(c(0.1, 0.2, 0.3, 0.4), c("A", "B", "C", "D"), "locus1", 
   maleMutationModel = "Custom", maleMutationMatrix = matrix(
   c(0.99, 0.005, 0.003, 0.002, 
     0.004, 0.99, 0.004, 0.002, 
     0.002, 0.004, 0.99, 0.004, 
     0.002, 0.003, 0.005, 0.99), 
   4, 4, byrow=TRUE), femaleMutationModel = "Custom", femaleMutationMatrix = matrix(
   c(0.99, 0.005, 0.003, 0.002, 
     0.004, 0.99, 0.004, 0.002, 
     0.002, 0.004, 0.99, 0.004, 
     0.002, 0.003, 0.005, 0.99), 
   4, 4, byrow=TRUE))
datamatrix <- data.frame(locus1.1=c("A", "A", "C"), locus1.2=c("B", "A", "C"))
rownames(datamatrix) <- persons
result <- FamiliasPosterior(mypedigrees, locus1, datamatrix)


#Example 6: Using kinship: 
persons <- c("AF","mother", "daughter")
ped1=swapSex(nuclearPed(1),3)
locus1=marker(ped1,1,c(1,1),2,c(2,2),3,c(1,2))
ped1=addMarker(ped1,locus1)
plot(ped1,marker=1,id.labels=persons,main="ped1") #plot function of paramlink
ped1=as.data.frame(ped1) 
foo=ConvertPed(ped1,persons)
ped1.c=foo$ped
datamatrix=foo$datamatrix
locus1 <- FamiliasLocus(frequencies=c(0.1, 0.2, 0.3, 0.4), allelenames= 1:4, name="locus1")
FamiliasPosterior(ped1.c, locus1, datamatrix) #likelihood=0.1^2*0.2^2=4e-04
th=0.03;FamiliasPosterior(ped1.c, locus1, datamatrix,kinship=th) #Formula below
((th+(1-th)*0.1)*(1-th)*0.1*(th*0.2+(1-th)*0.2^2))/((1+2*th)*(1+th)) #OK

# Example 7: Exercise S11 Silent allele
# See http://arken.umb.no/~theg/alcala/familiasExercises.pdf
ped1=nuclearPed(1)
persons <- c("AF","mother", "child")
locus1=marker(ped1,1,c("B","B"),2,c("A","A"),3,c("A","A"),alleles=c("A","B","C"))
ped1=as.data.frame(addMarker(ped1,locus1))
foo=ConvertPed(ped1,persons)
ped1.c=foo$ped
datamatrix=foo$datamatrix

ped2=nuclearPed(1)
ped2=relabel(ped2,old=c(1,2,3),new=c(4,2,3))
AF=singleton(1)
ped2=rbind(as.data.frame(AF),as.data.frame(ped2))
persons <- c("AF","mother", "child","TF")
ped2.c=ConvertPed(ped2,persons)$ped
mypedigrees=list(ped1.c,ped2.c)
locus1 <- FamiliasLocus(frequencies=c(0.1, 0.1,0.75, 0.05),
allelenames= c("A","B","C", "silent"), name="locus1")
result=FamiliasPosterior(mypedigrees, locus1, datamatrix, ref=2) #LR=1.36 OK



