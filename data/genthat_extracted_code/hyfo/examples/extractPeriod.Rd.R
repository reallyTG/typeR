library(hyfo)


### Name: extractPeriod
### Title: Extract period from list or dataframe.
### Aliases: extractPeriod extractPeriod,data.frame-method
###   extractPeriod,list-method

### ** Examples

# Generate timeseries datalist. Each data frame consists of a Date and a value.

AAA <- data.frame(
# date column
Date = seq(as.Date('1990-10-28'),as.Date('1997-4-1'),1),
 # value column
AAA = sample(1:100,length(seq(as.Date('1990-10-28'),as.Date('1997-4-1'),1)), repl = TRUE))

BBB <- data.frame(
Date = seq(as.Date('1993-3-28'),as.Date('1999-1-1'),1), 
BBB = sample(1:100,length(seq(as.Date('1993-3-28'),as.Date('1999-1-1'),1)), repl = TRUE))
 
CCC <- data.frame(
Date = seq(as.Date('1988-2-2'),as.Date('1996-1-1'),1), 
CCC = sample(1:100,length(seq(as.Date('1988-2-2'),as.Date('1996-1-1'),1)), repl = TRUE)) 

list <- list(AAA, BBB, CCC)# dput() and dget() can be used to save and load list file.

list_com <- extractPeriod(list, commonPeriod = TRUE)

# list_com is the extracted datalist.
str(list_com)

# If startDate and endDate is provided, the record between them will be extracted.
# make sure startDate is later than any startDate in each dataframe and endDate is 
# earlier than any endDate in each dataframe.

data(testdl)
datalist_com1 <- extractPeriod(testdl, startDate = '1994-1-1', endDate = '1995-10-1')


dataframe <- list2Dataframe(datalist_com1)
# now we have a dataframe to extract certain months and years.
dataframe_new <- extractPeriod(dataframe, month = c(1,2,3))
dataframe_new <- extractPeriod(dataframe, month = c(12,1,2), year = 1995)


# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




