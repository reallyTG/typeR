library(OutbreakTools)


### Name: ToyOutbreakRaw
### Title: Raw simulated outbreak dataset
### Aliases: ToyOutbreakRaw
### Keywords: dataset

### ** Examples

## Load data ##
data(ToyOutbreakRaw)
attach(ToyOutbreakRaw)

## Constructing an obkData object ##
x <- new ("obkData", individuals=individuals, records=records,
          contacts=contacts, contacts.start=contacts.start,
          contacts.end=contacts.end, dna=dna,
          dna.individualID=dna.info$individualID,
          dna.date=dna.info$date, sample=dna.info$sample, trees=trees)

detach(ToyOutbreakRaw)


## Examining the object ##
summary(x)

head(x@individuals)
head(x@records)
names(x@records)
head(x@records$Fever)
x@contacts
x@dna
x@trees

## Plotting the dynamic contact network ##
par(mfrow=c(2,2))
plot(get.contacts(x),main="Contact network - days 0-3",displaylabels=TRUE)
plot(get.contacts(x, from=0, to=1.1), main="Contact network - days 0-1",
     displaylabels=TRUE)
plot(get.contacts(x, from=2, to=2.1), main="Contact network - day 2",
     displaylabels=TRUE)
plot(get.contacts(x, from=3, to=3.1), main="Contact network - day 3",
     displaylabels=TRUE)

## Mapping the outbreak (by sex) ##
plot(x,'geo',location=c('lon','lat'),zoom=13,colorBy='Sex')




