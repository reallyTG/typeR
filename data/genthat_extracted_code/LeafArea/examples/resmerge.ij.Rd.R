library(LeafArea)


### Name: resmerge.ij
### Title: File management
### Aliases: resmerge.ij
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

#combine multiple tab-delimited text files with a leaf area value 
#(one text file for each original JPEG image file) that share the same
#filename 'prefix', defined as the part of the filename preceding the first 
#hyphen (-) or period (.).
resmerge.ij(tf)

##combine multiple tab-delimited text files with a leaf area value 
#(one text file for each original JPEG image file) that share the same
#filename 'prefix', defined as the part of the filename preceding the first 
#'.txt'.
resmerge.ij(tf,prefix=".txt")

unlink(list.files(tf))



