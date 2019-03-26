library(Diderot)


### Name: create_bibliography
### Title: Function to create a bibliographic dataset
### Aliases: create_bibliography 'Bibliographic Network Creation' 'Citation
###   Graph Creation'
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
    } else {
      str<-sprintf("%s %s. %d. %s;", str, corp1$Authors[rn], corp1$Year[rn], corp1$Title[rn])
    }
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

labels<-c("Corpus1","Corpus2")

# Build a bibliographical dataset from Scopus exports
db<-create_bibliography(corpora_files=c(tempfi1,tempfi2), 
                        labels=labels, keywords=NA)
unlink(c(tempfi1, tempfi2))
## End(Don't show)
## Not run: 
##D   # Two corpora on individual-based modelling (IBM) and agent-based modelling (ABM)
##D   # were downloaded from Scopus. The structure of each corpus is as follows:
##D   tt<-read.csv("IBMmerged.csv", stringsAsFactors=FALSE)
##D   str(tt,strict.width="cut")
##D   ### 'data.frame':  3184 obs. of  9 variables:
##D   ### $ Authors        : chr  "Chen J., Marathe A., Marathe M." "Van Dijk D., Sl"..
##D   ### $ Title          : chr  "Coevolution of epidemics, social networks, and in"..
##D   ### $ Year           : int  2010 2010 2010 2010 2010 2010 2010 2010 2010 2010 ...
##D   ### $ DOI            : chr  "10.1007/978-3-642-12079-4_28" "10.1016/j.procs.20"..
##D   ### $ Link           : chr  "http://www.scopus.com/inward/record.url?eid=2-s2."..
##D   ### $ Abstract       : chr  "This research shows how a limited supply of antiv"..
##D   ### $ Author.Keywords: chr  "Antiviral; Behavioral economics; Epidemic; Microe"..
##D   ### $ Index.Keywords : chr  "Antiviral; Behavioral economics; Epidemic; Microe"..
##D   ### $ References     : chr  "(2009) Centre Approves Restricted Retail Sale of "..
##D   
##D   # Define the name of corpora (labels) and specific keywords to identify relevant
##D   # publications (keys).
##D   labels<-c("IBM","ABM")
##D   keys<-c("individual-based model|individual based model", 
##D           "agent-based model|agent based model")
##D   
##D   # Build the IBM-ABM bibliographical dataset from Scopus exports
##D   db<-create_bibliography(corpora_files=c("IBMmerged.csv","ABMmerged.csv"), 
##D                           labels=labels, keywords=keys)
##D   ### [1] "File IBMmerged.csv contains 3184 records"
##D   ### [1] "File ABMmerged.csv contains 9641 records"
##D   
##D   # Processed output. Note the field name changes (for standardization with ISI Web 
##D   # of Knowledge format) and addition of the "Corpus" field (with identification of
##D   # joint "IBM | ABM" publications based on keywords).
##D   str(db, strict.width="cut")
##D   ### 'data.frame':  12504 obs. of  10 variables:
##D   ### $ Authors         : chr  "Chen J., Marathe A., Marathe M." "Van Dijk D., Sloot "..
##D   ### $ Cite Me As      : chr  "Coevolution of epidemics, social networks, and indivi"..
##D   ### $ Year            : int  2010 2010 2010 2010 2010 2010 2010 2010 2010 2010 ...
##D   ### $ DOI             : chr  "10.1007/978-3-642-12079-4_28" "10.1016/j.procs.2010.0"..
##D   ### $ Link            : chr  "http://www.scopus.com/inward/record.url?eid=2-s2.0-78"..
##D   ### $ Abstract        : chr  "This research shows how a limited supply of antiviral"..
##D   ### $ Author.Keywords : chr  "Antiviral; Behavioral economics; Epidemic; Microecono"..
##D   ### $ Index.Keywords  : chr  "Antiviral; Behavioral economics; Epidemic; Microecono"..
##D   ### $ Cited References: chr  "(2009) Centre Approves Restricted Retail Sale of Tami"..
##D   ### $ Corpus          : chr  "IBM" "IBM | ABM" "IBM | ABM" "IBM" ...
## End(Not run)



