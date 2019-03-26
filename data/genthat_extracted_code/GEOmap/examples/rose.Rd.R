library(GEOmap)


### Name: rose
### Title: Rose Diagram
### Aliases: rose
### Keywords: misc

### ** Examples


ff=c(23,27,53,58,64,83,85,88,93,99,100,
  105,113,113,114,117,121,123,125,126,
  126,126,127,127,128,128,129,132,132,
  132,134,135,137,144,145,145,146,153,
  155,155,155,157,163,165,171,172,179,181,186,190,212)




rose((ff-90)*pi/180, 50, x=0, y=0, LABS = c("N", "S", "W", "E"), 
annot=TRUE,border='white',LABangle=135, siz =sqrt(2), SYM=FALSE)

rose((ff-90)*pi/180, 50, x=0, y=0, LABS = c("N", "S", "W", "E"), 
annot=TRUE,border='white',LABangle=135, siz =sqrt(2), SYM=TRUE)








