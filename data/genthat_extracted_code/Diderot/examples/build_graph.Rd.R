library(Diderot)


### Name: build_graph
### Title: Builds a citation graph.
### Aliases: build_graph 'Citation Graph Building'
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Don't show: 
# Generate corpora
corp1<-data.frame(Authors=paste("Author",round(runif(45,1,20)),sep=""),Title=paste("Title",seq(1,45), sep=""), Year=round(runif(45,1990,2018)), References=NA,stringsAsFactors=FALSE)
corp2<-data.frame(Authors=paste("Author",round(runif(65,15,35)),sep=""),Title=paste("Title",seq(46,110), sep=""), Year=round(runif(65,1990,2018)), References=NA, stringsAsFactors=FALSE)

len1<-length(corp1$Authors)
len2<-length(corp2$Authors)
lnall<-len1+len2

for (i in seq(1:lnall)) {
  str<-""
  for (j in seq(1:round(runif(1,1,4)))) {
    rn<-round(runif(1,1,lnall))
    if (rn > len1) { 
      str<-sprintf("%s %s. %d. %s;", str, corp2$Authors[rn-len1], corp2$Year[rn-len1], corp2$Title[rn-len1])
    } else str<-sprintf("%s %s. %d. %s;", str, corp1$Authors[rn], corp1$Year[rn], corp1$Title[rn])
  }
  if (i>len1) {
    corp2$References[i-len1]<-str
  } else corp1$References[i]<-str
}

# Create joint references
for (i in seq(1:5)) {
  corp1<-rbind(corp1, corp2[runif(1,1,len2),])
  corp2<-rbind(corp2, corp1[runif(1,1,len1),])
}

# Add duplicate entry
corp1<-rbind(corp1, corp1[1,])

tempfi1<-file.path(tempdir(),"corpus1.csv")
tempfi2<-file.path(tempdir(),"corpus2.csv")
write.csv(corp1, tempfi1)
write.csv(corp2, tempfi2)
## End(Don't show)

labels<-c("Corpus1","Corpus2")

# Build a bibliographical dataset from Scopus exports
db<-create_bibliography(corpora_files=c(tempfi1,tempfi2), 
                        labels=labels, keywords=NA)
## Don't show: 
unlink(c(tempfi1, tempfi2))
## End(Don't show)

# Build graph
gr<-build_graph(db=db,small.year.mismatch=TRUE, attrs=c("Corpus","Year","Authors"), nb.cores=1)




