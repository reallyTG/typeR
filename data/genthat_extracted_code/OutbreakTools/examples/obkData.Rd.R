library(OutbreakTools)


### Name: obkData-class
### Title: Formal class "obkData"
### Aliases: obkData obkData-class initialize,obkData-method
###   summary,obkData-method summary.obkData show,obkData-method
###   get.locus,obkData-method get.locus.obkData get.nlocus,obkData-method
###   get.nlocus.obkData get.dna,obkData-method get.dna.obkData
###   get.sequences,obkData-method get.sequences.obkData
###   get.nsequences,obkData-method get.nsequences.obkData get.context
###   get.context,obkData-method get.context.obkData get.ncontext
###   get.ncontext,obkData-method get.ncontext.obkData get.records
###   get.records,obkData-method get.records.obkData get.nrecords
###   get.nrecords,obkData-method get.nrecords.obkData
###   get.contacts,obkData-method get.contacts.obkData
###   get.ncontacts,obkData-method get.ncontacts.obkData head.obkData
###   head,obkData-method tail.obkData tail,obkData-method get.trees
###   get.ntrees get.trees,obkData-method get.trees.obkData
###   get.ntrees,obkData-method get.ntrees.obkData
### Keywords: classes

### ** Examples

## LOAD DATA ##
data(ToyOutbreakRaw)
attach(ToyOutbreakRaw)

## CONSTRUCTING AN OBKDATA OBJECT ##
x <- new ("obkData", individuals=individuals, records=records,
          contacts=contacts, contacts.start=contacts.start,
          contacts.end=contacts.end, dna=dna,
          dna.individualID=dna.info$individualID,
          dna.date=dna.info$date, sample=dna.info$sample, trees=trees)

detach(ToyOutbreakRaw)


## EXAMINING THE OBJECT ##
head(x@individuals)
names(x@records)
lapply(x@records, head)
x@contacts
x@dna
x@trees


## HEAD, TAIL, SUMMARY ##
head(x)
tail(x)
summary(x)


##  ACCESSORS
get.nlocus(x)
get.locus(x)
get.nindividuals(x)
head(get.individuals(x))
get.individuals(x, data="contacts")
get.nsequences(x)
get.dna(x, locus="gene2")
get.dna(x, locus=1)
head(get.data(x, "Fever"))
head(get.data(x, "Age", showSource=TRUE))
head(get.data(x, c("Age","Sex", "infector"), showSource=TRUE))


## GRAPHICS ##
## default plot (timeline of information) ##
plot(x)
plot(x, colorBy='Sex')
plot(x, colorBy='Sex', orderBy='Sex')
plot(subset(x, 1:50), colorBy='Sex', size=4)

## plot contacts ##
plot(x, "contacts", main="Contacts")

## Not run: 
##D ## visualize data on a map ##
##D plot(x,'geo',location=c('lon','lat'),zoom=15,colorBy='Sex')
##D 
##D ## plot the tree ##
##D plotggphy(x)
##D plotggphy(subset(x, 1:50), tip.color="Sex", color.pal="Set1")
## End(Not run)



