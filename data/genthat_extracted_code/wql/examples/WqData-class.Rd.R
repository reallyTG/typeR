library(wql)


### Name: WqData-class
### Title: Class WqData
### Aliases: WqData-class WqData-class [,WqData-method
###   summary,WqData-method plot,WqData-method
### Keywords: classes

### ** Examples


showClass("WqData")
# Construct the WqData object sfb as shown in the wqData examples.
sfb <- wqData(sfbay, c(1,3,4), 5:12, site.order = TRUE, type = "wide", 
              time.format = "%m/%d/%Y")
# Summarize the data
summary(sfb)
# Create boxplot summary of data
plot(sfb, vars = c('chl', 'dox', 'spm'), num.col = 2)
# Extract some of the data as a WqData object
sfb[1:10,]  # first 10 observations
sfb[sfb$depth==20,]  # all observations at 20 m




