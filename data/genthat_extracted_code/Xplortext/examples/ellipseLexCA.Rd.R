library(Xplortext)


### Name: ellipseLexCA
### Title: Confidence ellipses on textual correspondence analysis graphs
### Aliases: ellipseLexCA
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(open.question)
##D res.TD<-TextData(open.question, var.text=c(9,10), remov.number=TRUE, Fmin=10, Dmin=10,  
##D   stop.word.tm=TRUE, context.quali=c("Gender","Age_Group","Education"), 
##D   context.quanti=c("Age"))
##D res.LexCA<-LexCA(res.TD, graph=FALSE,ncp=8)
##D ellipseLexCA(res.LexCA, selWord="meta 1",selDoc=NULL, col.word="brown")
##D ellipseLexCA(res.LexCA, selWord="contrib 10",selDoc=NULL, col.word="brown")
##D ellipseLexCA(res.LexCA, selWord=c("work","job","money","comfortable"), selDoc=NULL,
##D   col.word="brown")
##D ellipseLexCA(res.LexCA, selWord="cos2 0.2", selDoc=NULL, col.word="brown")
## End(Not run)
## Not run: 
##D data(open.question)
##D res.TD<-TextData(base, var.text=c(9,10), var.agg="Sexe_Age", Fmin=10, Dmin=10,
##D   remov.number=TRUE, stop.word.tm=TRUE)
##D res.LexCA<-LexCA(res.TD, graph=FALSE)
##D ellipseLexCA(res.LexCA, selWord=NULL, col.doc="black")
##D ellipseLexCA(res.LexCA, selWord="meta 3", selDoc=NULL, col.word="brown")
##D ellipseLexCA(res.LexCA, selWord="contrib 10", selDoc=NULL, col.word="brown")
##D ellipseLexCA(res.LexCA, selWord=c("work","job","money","comfortable"), selDoc=NULL,
##D        col.word="brown")
##D ellipseLexCA(res.LexCA, selWord="cos2 0.2", selDoc=NULL, col.word="brown")    
##D 	
## End(Not run)



