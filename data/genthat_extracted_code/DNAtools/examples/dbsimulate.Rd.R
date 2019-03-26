library(DNAtools)


### Name: dbSimulate
### Title: Simulate a DNA database
### Aliases: dbSimulate

### ** Examples

  ## Not run: 
##D   ## Simulate some allele frequencies:
##D                                                                                 
##D   freq <-  replicate(10, { g = rgamma(n=10,scale=4,shape=3); g/sum(g)},
##D              simplify=FALSE)
##D   ## Simulate a single database with 5000 DNA profiles:
##D   simdb <- dbSimulate(freq,theta=0,n=5000)
##D   ## Simulate a number of databases, say N=50. For each database compute
##D   ## the summary statistic using dbCompare:
##D   N <- 50
##D   Msummary <- matrix(0,N,(length(freq)+1)*(length(freq)+2)/2)
##D   for(i in 1:N)
##D     Msummary[i,] <- dbCompare(dbSimulate(freq,theta=0,n=1000),
##D                       vector=TRUE,trace=FALSE)$m
##D   ## Give the columns  representative names:
##D   dimnames(Msummary)[[2]] <- DNAtools:::dbCats(length(freq),vector=TRUE)
##D   ## Plot the simulations using a boxplot
##D   boxplot(log10(Msummary))
##D   ## There might come some warnings due to taking log10 to zero-values (no counts)
##D   ## Add the expected number to the plot:
##D   points(1:ncol(Msummary),log10(dbExpect(freq,theta=0,n=1000,vector=TRUE)),
##D          col=2,pch=16)
##D   
## End(Not run)



