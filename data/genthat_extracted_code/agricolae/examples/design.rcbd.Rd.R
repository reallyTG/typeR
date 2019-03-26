library(agricolae)


### Name: design.rcbd
### Title: Randomized Complete Block Design
### Aliases: design.rcbd
### Keywords: design

### ** Examples

library(agricolae)
# 5 treatments and 6 blocks
trt<-c("A","B","C","D","E")
outdesign <-design.rcbd(trt,6,serie=2,986,"Wichmann-Hill") # seed = 986
book <-outdesign$book # field book
# write in hard disk
# write.table(book,"rcbd.txt", row.names=FALSE, sep="\t")
# file.show("rcbd.txt")
# Plots in field model ZIGZAG
fieldbook <- zigzag(outdesign)
print(outdesign$sketch)
print(matrix(fieldbook[,1],byrow=TRUE,ncol=5))
# continuous numbering of plot
outdesign <-design.rcbd(trt,6,serie=0,continue=TRUE)
head(outdesign$book)



