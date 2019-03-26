library(EpiContactTrace)


### Name: Contacts-class
### Title: Class '"Contacts"'
### Aliases: Contacts-class
### Keywords: classes

### ** Examples


## Load data
data(transfers)

## Perform contact tracing
contactTrace <- Trace(movements = transfers,
                      root = 2645,
                      tEnd = '2005-10-31',
                      days = 90)

## Show structure of ingoing contacts
str(contactTrace@ingoingContacts)

## Show structure of ougoing contacts
str(contactTrace@outgoingContacts)




