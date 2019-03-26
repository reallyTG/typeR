library(lessR)


### Name: Write
### Title: Write the Contents of a Data Frame to an External File
### Aliases: Write wrt wrt.r
### Keywords: write csv

### ** Examples

# create data frame called d
n <- 12
X <- sample(c("Group1","Group2"), size=n, replace=TRUE)
Y <- rnorm(n=n, mean=50, sd=10)
d <- data.frame(X,Y)

# write the current contents of default data frame d to GoodData.csv
Write("GoodData")
# short name
# write the default data frame d to the R data file d.rda
wrt.r()

# write the data as an Excel data table in an Excel file
# do not include row names in the output Excel files
Write("GoodData", format="Excel", row.names=FALSE)

# access the R data frame warpbreaks
data(warpbreaks)
# write the file warpbreaks.rda
wrt.r(data=warpbreaks)




