library(googleVis)


### Name: Stock
### Title: Stock: googleVis example data set
### Aliases: Stock
### Keywords: datasets

### ** Examples

## Create data as used by Google in their annotated time line example

 Date <- as.Date(paste("2008-1-", 1:6, sep=""))
 Pencils <- c(3000, 14045, 5502, 75284, 41476, 333222)
 Pencils.titles <-c(rep(NA,4), 'Bought pencils', NA)
 Pencils.annotation <-c(rep(NA,4), 'Bought 200k pencils', NA)
 Pens <- c(40645, 20374, 50766, 14334, 66467, 39463)
 Pens.titles <- c(rep(NA, 3), 'Out of stock', NA, NA)
 Pens.annotation <- c(rep(NA, 3), 'Ran of out stock of pens at 4pm', NA, NA)

 original.df=data.frame(Date, Pencils, Pencils.titles,
                        Pencils.annotation, Pens, Pens.titles,
                        Pens.annotation)  


 Stock <- reshape(original.df, idvar="Date", times=c("Pencils", "Pens"), 
                  timevar="Device",
                  varying=list(c("Pencils", "Pens"),
                               c("Pencils.titles", "Pens.titles"),
                               c("Pencils.annotation", "Pens.annotation")), 
                   v.names=c("Value", "Title", "Annotation"),
                   direction="long")




