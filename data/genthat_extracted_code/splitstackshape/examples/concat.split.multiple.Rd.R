library(splitstackshape)


### Name: concat.split.multiple
### Title: Split Concatenated Cells and Optionally Reshape the Output
### Aliases: concat.split.multiple

### ** Examples


## Not run: 
##D temp <- head(concat.test)
##D concat.split.multiple(temp, split.cols = c("Likes", "Hates", "Siblings"),
##D                       seps = c(",", ";", ","))
##D concat.split.multiple(temp, split.cols = c("Likes", "Siblings"),
##D                       seps = ",", direction = "long")
## End(Not run)




