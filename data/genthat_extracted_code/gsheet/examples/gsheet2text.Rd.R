library(gsheet)


### Name: gsheet2text
### Title: Download Google sheet as text.
### Aliases: gsheet2text

### ** Examples


url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
a <- gsheet2text(url)
b <- read.csv(text=a)




