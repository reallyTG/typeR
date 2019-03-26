## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "rppo-vignette-"
)
library(rppo)

## ----term example, echo=TRUE, message=FALSE, warning=FALSE---------------
present_terms <- ppo_terms(present = TRUE)
# print the first five rows, with just the termIDs and labels
print(present_terms[1:5,c("termID","label")])

## ----data example, echo=TRUE, message=FALSE, warning=FALSE, paged.print=TRUE----
results <- ppo_data(genus = "Quercus", fromYear = 2013, toYear = 2013, fromDay = 100, toDay = 110, termID = 'obo:PPO_0002313', limit = 10)
df <- results$data
print(df[1:1,])

## ----readme results example----------------------------------------------
cat(results$readme)

## ----readme possible results example-------------------------------------
cat(results$number_possible)

## ----workting with terms and data example--------------------------------
###############################################################################
# Generate a frequency data frame showing the number of times each termID
# is populated for genus equals "Quercus" above latitude of 47
# Note that all latitude/longitude queries need to be in the format of a
# bounding box
###############################################################################
df <- ppo_data(
  genus = "Quercus", 
  bbox="47,-180,90,180")
# return just the termID column
t1 <- df$data[,c('termID')]
# paste each cell into one string
t2<-paste(t1, collapse = ",")
# split strings at ,
t3<-strsplit(t2, ",")
# create a frequency table as a data frame
freqFrame <- as.data.frame(table(t3))

# create a new data frame that we want to populate
resultFrame <- data.frame(
  label = character(), 
  frequency = integer(), 
  stringsAsFactors = FALSE)

###############################################################################
# Replace termIDs with labels in frequency frame
###############################################################################
# fetch "present" and "absent" terms using `ppo_terms`
termList <- ppo_terms(absent = TRUE, present = TRUE);

# loop all "present"" and "absent" terms
for (term in 1:nrow(termList)) {
  termListTermID<-termList[term,'termID'];
  termListLabel<-termList[term,'label'];
  # loop all rows that have a frequency generated
  for (row in 1:nrow(freqFrame)) {
    freqFrameTermID = freqFrame[row,'t3']
    freqFrameFrequency = freqFrame[row,'Freq']
    # Populate resultFrame with matching "present" or "absent" labels.
    # In this step, we will ignore "presence" terms
    # found in the frequency frame since the ppo_terms only returns
    # "present" and "absent" terms. 
    if (freqFrameTermID == termListTermID) {
      resultFrame[nrow(resultFrame)+1,] <- c(termListLabel,freqFrameFrequency)
    }
  }
}

# print results, showing term labels and a frequency count
print(resultFrame)

