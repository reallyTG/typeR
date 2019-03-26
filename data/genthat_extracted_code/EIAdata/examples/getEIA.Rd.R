library(EIAdata)


### Name: getEIA
### Title: A function to download data from the Energy Information
###   Administration's (EIA's) API.
### Aliases: getEIA

### ** Examples

## The function is currently defined as
function (ID, key) 
{
    switch(.last_char(ID), A = .getAnnEIA(ID, key = key), Q = .getQEIA(ID, 
        key = key), M = .getMonEIA(ID, key = key), W = .getWDEIA(ID, 
        key = key), D = .getWDEIA(ID, key = key),
        print("ERROR: The last
        character of your ID is not one of the possible sampling
        frequencies (A, Q, M, W, or D)"))
  }



