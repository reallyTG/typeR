library(agricolae)


### Name: design.lsd
### Title: Latin Square Design
### Aliases: design.lsd
### Keywords: design

### ** Examples

library(agricolae)
varieties<-c("perricholi","yungay","maria bonita","tomasa")
outdesign <-design.lsd(varieties,serie=2,seed=23)
lsd <- outdesign$book 
print(outdesign$sketch)
print(lsd) # field book.
plots <-as.numeric(lsd[,1])
print(matrix(plots,byrow = TRUE, ncol = 4))
# Write on hard disk.
# write.table(lsd,"lsd.txt", row.names=FALSE, sep="\t")
# file.show("lsd.txt")



