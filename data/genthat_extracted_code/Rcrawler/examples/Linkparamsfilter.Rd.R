library(Rcrawler)


### Name: Linkparamsfilter
### Title: Link parameters filter
### Aliases: Linkparamsfilter

### ** Examples

#remove ord and tmp parameters from the URL
url<-"http://www.glogile.com/index.php?name=jake&age=23&tmp=2&ord=1"
url<-Linkparamsfilter(url,c("ord","tmp"))
#remove all URL parameters
Linkparamsfilter(url,removeAllparams = TRUE)




