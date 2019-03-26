library(SoundexBR)


### Encoding: UTF-8

### Name: soundexBR
### Title: Phonetic-Coding For Portuguese
### Aliases: soundexBR
### Keywords: Soundex

### ** Examples


#### A silly example:
names <- c('Ana Karolina Kuhnen', 'Ana Carolina Kuhnen', 'Ana Karolina','João Souza',
'João Souza', 'Dilma Vana Rousseff', 'Dilma Rousef','Aécio Neves', 'Aecio Neves')

soundexBR(names)

# Example with RecordLinkage:
#Some data:
data1 <- data.frame(list(
fname=c('Ricardo','Maria','Tereza','Pedro','José','Rubens'),
lname=c('Cunha','Andrade','Silva','Soares','Silva','Lima'),
age=c(67,89,78,65,68,67),
birth=c(1945,1923,1934,1947,1944,1945),
date=c(20120907,20120703,20120301,20120805,20121004,20121209)
))

data2<-data.frame( list( fname=c('Maria','Lúcia','Paulo','Marcos','Ricardo','Rubem'),
lname=c('Andrada','Silva','Soares','Pereira','Cunha','Lima'),
age=c(67,88,78,60,67,80),
birth=c(1945,1924,1934,1952,1945,1932),
date=c(20121208,20121103,20120302,20120105,20120907,20121209)
))

# Must call RecordLinkage package

## Not run: 
##D pairs<-compare.linkage(data1, data2,
##D blockfld=list(c(1,2,4),c(1,2)),
##D phonetic<-c(1,2), phonfun = soundexBR, strcmp = FALSE,
##D strcmpfun<-jarowinkler, exclude=FALSE,identity1 = NA,
##D identity2=NA, n_match <- NA, n_non_match = NA)
##D 
##D print(pairs)
##D 
##D editMatch(pairs)
##D 
##D # To access information in the object:
##D weights <- epiWeights(pairs, e = 0.01, f = pairs$frequencies)
##D hist(weights$Wdata, plot = FALSE) # Plot TRUE
##D getPairs(pairs, max.weight = Inf, min.weight = -Inf)
##D 	
## End(Not run)



