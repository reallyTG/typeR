library(ProTrackR)


### Name: signedIntToNybble
### Title: Convert a signed integer to a nybble in raw data.
### Aliases: signedIntToNybble

### ** Examples

## generate some integers in the right range:

dati <- sample(-8:7, 100, replace = TRUE)

## Set the low nybbles of rawl based on dati:

rawl <- signedIntToNybble(dati)

## Set the high nybbles of rawl based on dati:

rawh <- signedIntToNybble(dati, "high")



