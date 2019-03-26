library(LeafArea)


### Name: readtext.ij
### Title: File management
### Aliases: readtext.ij
### Keywords: ~kwd1 ~kwd2

### ** Examples

#prepare example files
data(leafdata)
tf <- paste(tempdir(),"/",sep="")
for (i in 1:7){
	write.table(leafdata[[i]],paste(tf,names(leafdata)[i],sep=""),sep="\t")
}

#list of files
list.files(tf)

readtext.ij(tf)

unlink(list.files(tf))



