library(decoder)


### Name: as.keyvalue.list
### Title: Coerce a list to keyvalue object
### Aliases: as.keyvalue.list

### ** Examples


ex <- list(
 fruit  = c("banana", "orange", "kiwi"),
 car    = c("SAAB", "Volvo", "taxi", "truck"),
 animal = c("elefant")
)
as.keyvalue(ex)
is.keyvalue(ex)

## No test: 
# An invalid list (non unique names; not because of silly classification)
ex2 <- list(
 fruit  = c("banana", "orange", "kiwi"),
 car    = c("SAAB", "Volvo", "taxi", "truck"),
 animal = c("elefant"),
 fruit  = c("President_Obama")
)
as.keyvalue(ex2)

# An invalid list (non unique keys; kiwi appear twice)
ex3 <- list(
 fruit  = c("banana", "orange", "kiwi"),
 car    = c("SAAB", "Volvo", "taxi", "truck"),
 animal = c("elefant", "kiwi")
)
as.keyvalue(ex3)
## End(No test)



