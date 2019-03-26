library(textir)


### Name: corr
### Title: 2nd momments of sparse matrices
### Aliases: corr sdev

### ** Examples

# some congress examples
data(congress109)
r <- corr(congress109Counts, congress109Ideology$repshare)
## 20 terms for Democrats
sort(r[,1])[1:20]
## 20 terms for Republicans
sort(r[,1], decreasing=TRUE)[1:20]
## 20 high variance terms
colnames(congress109Counts)[
	order(-sdev(congress109Counts))[1:20]]
 
 


