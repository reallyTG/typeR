library(anchors)


### Name: insert
### Title: Insert DIF-corrected variable into original data frame
### Aliases: insert
### Keywords: manip

### ** Examples


data(freedom)
ra <- anchors(self ~ vign1 + vign3 + vign6, data = freedom, method="B")
freedom <- insert(freedom, ra ) 
names(freedom)




