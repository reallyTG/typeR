library(OutbreakTools)


### Name: obkContacts-class
### Title: Formal class "obkContacts"
### Aliases: obkContacts obkContacts-class obkContactsOrNULL
###   obkContactsOrNULL-class initialize,obkContacts-method
###   show,obkContacts-method show.obkContacts print.obkContacts
###   plot,obkContacts-method plot,obkContacts,ANY-method plot.obkContacts
###   get.ncontacts,obkContacts-method get.ncontacts.obkContacts
###   get.contacts get.contacts,obkContacts-method get.contacts.obkContacts
###   get.ncontacts get.ncontacts,obkContacts-method
###   get.ncontacts.obkContacts network-class networkDynamic-class
###   networkDynamicOrNetwork-class networkDynamicOrNetworkOrNULL-class
###   as.matrix,obkContacts-method as.matrix.obkContacts
###   as.data.frame,obkContacts-method as.data.frame.obkContacts
### Keywords: classes

### ** Examples


## THIS IS A TOY EXAMPLE ##
cf <- c("a", "b", "a", "c", "d")
ct <- c("b", "c", "c", "d", "b")
onset <- c(1, 2, 3, 4, 5)
terminus <- c(1.2, 4, 3.5, 4.1, 6)
oc.static <- new("obkContacts",cf,ct,FALSE) # static network
oc.dynamic <- new("obkContacts",cf,ct,FALSE,onset,terminus)
oc.static
oc.dynamic

plot(oc.static, main="Contact network")



## PLOTTING A DYNAMIC CONTACT NETWORK ##
## LOAD DATA
data(ToyOutbreak) # ToyOutbreak includes a dynamic contact network

## PLOT THE STATIC NETWORK
plot(ToyOutbreak@contacts)

## PLOT THE DYNAMIC NETWORK OVER THE FIRST 4 DAYS OF THE OUTBREAK
par(mfrow=c(2,2))

plot(ToyOutbreak@contacts)

plot(get.contacts(ToyOutbreak, from=0, to=2), displaylabels=TRUE,
     main="Contact network - days 1-2")

plot(get.contacts(ToyOutbreak, from=2.9, to=3.1), displaylabels=TRUE,
     main="Contact network - day 3")

plot(get.contacts(ToyOutbreak, from=3.9, to=4.1), displaylabels=TRUE,
     main="Contact network - day 4")

par(mfrow=c(1,1))

# extract matrices of adjacency, incidence, or edge list
as.matrix(ToyOutbreak@contacts)
as.matrix(ToyOutbreak@contacts, "incidence")
as.matrix(ToyOutbreak@contacts, "edgelist")

as.data.frame(ToyOutbreak@contacts)




