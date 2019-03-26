library(AnnotationBustR)


### Name: MergeSearchTerms
### Title: Merging of two tables containing search terms to expand search
###   term database for the AnnotationBust function.
### Aliases: MergeSearchTerms

### ** Examples

#load the list of search terms for mitochondrial genes
data(mtDNAterms) 

#Make a data.frame of new terms to add.
#This is a dummy example for a non-real annoation of COI, but lets pretend it is real.
add.name<-data.frame("COI","CDS", "CX1")

# make the column names the same for combination.
colnames(add.name)<-colnames(mtDNAterms)

#Run the merge search term function without sorting based on gene name.
new.terms<-MergeSearchTerms(add.name, mtDNAterms, SortGenes=FALSE)

#Run the merge search term function with sorting based on gene name.
new.terms<-MergeSearchTerms(add.name, mtDNAterms, SortGenes=TRUE)

#Merge search terms and create an additional column for introns and/or exons to
#In this example, add the trnK intron to the terms
#create empty IntornExonNumber column for non-intron/exons
cp.terms<-cbind(cpDNAterms,rep(NA,length(cpDNAterms$Name)))
colnames(cp.terms)[4]<-"IntronExonNumber"#Name the column IntronExonNumber
trnK.intron.terms<-subset(cpDNAterms,cpDNAterms$Locus=="trnK")#subset trnK
#Create a vector of 1's the same length as the number of rows for trnK
trnK.terms<-cbind(trnK.intron.terms,rep(1,length(trnK.intron.terms$Name)))
colnames(trnK.terms)[4]<-"IntronExonNumber"#Name the column IntronExonNumber
#Use MergeSearchTerms to merge the modified cpDNAterms and new intron terms
all.terms<-MergeSearchTerms(cp.terms,trnK.terms)



