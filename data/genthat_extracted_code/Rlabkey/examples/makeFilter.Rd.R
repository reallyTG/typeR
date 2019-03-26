library(Rlabkey)


### Name: makeFilter
### Title: Builds filters to be used in labkey.selectRows and getRows
### Aliases: makeFilter
### Keywords: file

### ** Examples


# library(Rlabkey)

## Two filters, ANDed together
makeFilter(c("TextFld","CONTAINS","h"),
    c("BooleanFld","EQUAL","TRUE"))

## Using "in" operator:
makeFilter(c("RowId","IN","2;3;6"))

## Using "missing" operator:
makeFilter(c("IntFld","MISSING",""))




