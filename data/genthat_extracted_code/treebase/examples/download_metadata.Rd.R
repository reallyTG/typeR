library(treebase)


### Name: download_metadata
### Title: Download the metadata on treebase using the OAI-MPH interface
### Aliases: download_metadata

### ** Examples

## Not run: 
##D Near <- search_treebase("Near", "author", max_trees=1)
##D  metadata(Near[[1]]$S.id)
##D ## or manualy give a sudy id
##D metadata("2377")
##D 
##D ### get all trees from a certain depostition date forwards ##
##D m <- download_metadata("2009-01-01", by="until")
##D ## extract any metadata, e.g. publication date:
##D dates <- sapply(m, function(x) as.numeric(x$date))
##D hist(dates, main="TreeBase growth", xlab="Year")
##D 
##D ### show authors with most tree submissions in that date range 
##D authors <- sapply(m, function(x){
##D    index <- grep( "creator", names(x))
##D      x[index] 
##D })
##D a <- as.factor(unlist(authors))
##D head(summary(a))
##D 
##D ## Show growth of TreeBASE 
##D all <- download_metadata("", by="all")
##D dates <- sapply(all, function(x) as.numeric(x$date))
##D hist(dates, main="TreeBase growth", xlab="Year")
##D 
##D ## make a barplot submission volume by journals
##D journals <- sapply(all, function(x) x$publisher)
##D J <- tail(sort(table(as.factor(unlist(journals)))),5)
##D b<- barplot(as.numeric(J))
##D text(b, names(J), srt=70, pos=4, xpd=T)
## End(Not run)



