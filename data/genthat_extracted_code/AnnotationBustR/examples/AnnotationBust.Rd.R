library(AnnotationBustR)


### Name: AnnotationBust
### Title: Breaks up genbank sequences into their annotated components
###   based on a set of search terms and writes each subsequence of
###   interest to a FASTA for each accession number supplied.
### Aliases: AnnotationBust

### ** Examples

## Not run: 
##D #Create vector of three NCBI accessions of rDNA toget subsequences of and load rDNA terms.
##D ncbi.accessions<-c("FJ706295","FJ706343","FJ706292")
##D data(rDNAterms)#load rDNA search terms from AnnotationBustR
##D #Run AnnotationBustR and write files to working directory
##D my.sequences<-AnnotationBust(ncbi.accessions, rDNAterms, DuplicateSpecies=TRUE, 
##D Prefix="Example1")
##D my.sequences#Return the accession table for each species.
##D 
##D ###Example With matK CDS and trnK Introns/Exons##
##D #Subset out matK from cpDNAterms
##D cds.terms<-subset(cpDNAterms,cpDNAterms$Locus=="matK")
##D #Create a vecotr of NA so we can merge with the search terms for introns and exons
##D cds.terms<-cbind(cds.terms,(rep(NA,length(cds.terms$Locus))))
##D colnames(cds.terms)[4]<-"IntronExonNumber"
##D 
##D #Prepare a search term table for the intron and exons to remove
##D #We can start with the cpDNAterms for trnK
##D IntronExon.terms<-subset(cpDNAterms,cpDNAterms$Locus=="trnK")
##D #As we want to go for two exons, we will want the synonyms repeated as we are doing and intron 
##D #and an exon
##D IntronExon.terms<-rbind(IntronExon.terms,IntronExon.terms)#duplicate the terms
##D #rep the sequence type we want to extract
##D IntronExon.terms$Type<-rep(c("Intron","Intron","Exon","Exon"))
##D IntronExon.terms$Locus<-rep(c("trnK_Intron","trnK_Exon2"),each=2)
##D IntronExon.terms<-cbind(IntronExon.terms,rep(c(1,1,2,2)))#Add intron/exon number info
##D #change column name for number info for IntronExon name
##D colnames(IntronExon.terms)[4]<-"IntronExonNumber"
##D #We can then merge everything together with MergeSearchTerms terms
##D IntronExonExampleTerms<-MergeSearchTerms(IntronExon.terms,cds.terms)
##D 
##D #Run AnnotationBust
##D IntronExon.example<-AnnotationBust(Accessions=c("KX687911.1", "KX687910.1"), 
##D Terms=IntronExonExampleTerms, Prefix="DemoIntronExon")
## End(Not run)



