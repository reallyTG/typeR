library(OutbreakTools)


### Name: get.incidence
### Title: Compute incidence
### Aliases: get.incidence get.incidence,Date-method get.incidence.Date
###   get.incidence,obkSequences-method get.incidence.obkSequences
###   get.incidence,obkContacts-method get.incidence.obkContacts
###   get.incidence,obkData-method get.incidence.obkData
### Keywords: classes

### ** Examples


## SIMPLE EXAMPLE ##
dates <- as.Date("2001-01-01") + c(0,1,2,1,1,4)
get.incidence(dates)
get.incidence(dates, interval=2)
get.incidence(dates, interval=2, from="2001-01-03")

## OBKDATA/OBKCONTACTS/OBKSEQUENCES OBJECTS ##
data(ToyOutbreak)

## incidence of DNA sequences collection
get.incidence(ToyOutbreak, "dna")
plot(get.incidence(ToyOutbreak, "dna"), type="s",
     main="Incidence of DNA sequences collection")

## incidence of contacts
get.incidence(ToyOutbreak, "contacts")
plot(get.incidence(ToyOutbreak, "contacts"), type="s",
     main="Incidence of contact occurence")


## incidence of temperature measurements
get.incidence(ToyOutbreak, "temperature")

## same, keeping temperatures above 39
get.incidence(ToyOutbreak, "temperature", val.min=39)
plot(get.incidence(ToyOutbreak, "temperature", val.min=39),
     type="s", main="Incidence: temperature>=39")

## same, temperature>40, interval=2days
inc <- get.incidence(ToyOutbreak, "temperature", val.min=40, interval=2)
plot(inc, type="s", main="Incidence: temperature>=40")




