library(dataMaid)


### Name: summarize
### Title: Summarize a variable/dataset
### Aliases: summarize

### ** Examples

#Default summary for a character vector:
   charV <- c("a", "b", "c", "a", "a", NA, "b", "0")
   summarize(charV)

#Inspect default character summary functions:
   defaultCharacterSummaries()

#Define a new summary function and add it to the summary for character vectors:
   countZeros <- function(v, ...) {
     res <- length(which(v == 0))
     summaryResult(list(feature="No. zeros", result = res, value = res))
   }
   summarize(charV, 
     summaries = setSummaries(character = defaultCharacterSummaries(add = "countZeros")))

 #Does nothing, as intV is not affected by characterSummaries
   intV <- c(0:10)
   summarize(intV, 
     summaries = setSummaries(character = defaultCharacterSummaries(add = "countZeros")))

 #But supplying the argument for integer variables changes the summary:
   summarize(intV, summaries = setSummaries(integer = "countZeros"))
   
 #Summarize a full dataset:
  data(cars)
  summarize(cars)
  
 #Summarize a variable and obtain report-style output (formatted for markdown)
  summarize(charV, reportstyleOutput = TRUE)




