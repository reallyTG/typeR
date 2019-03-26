library(RFishBC)


### Name: RFBCoptions
### Title: See or set arguments for common RFishBC functions
### Aliases: RFBCoptions

### ** Examples

## Show all options
RFBCoptions()

## Show how to see and set one option
RFBCoptions()$makeTransect
RFBCoptions(makeTransect=FALSE)
RFBCoptions()$makeTransect
RFBCoptions(reset=TRUE)
RFBCoptions()$makeTransect

## Multiple options can also be set at once
RFBCoptions(pch.show=3,col.show="blue",cex.show=3)




