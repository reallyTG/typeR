library(oii)


### Name: oii.summary
### Title: Print summary statistics for a numeric variable
### Aliases: oii.summary

### ** Examples


#Generate data from a normal distribution with mean 0 and sd 1
#store the result in a variable called tmp
tmp<-rnorm(500,mean=0,sd=1)

#Print the summary statistics about tmp
oii.summary(tmp)
#Print even more summary statistics about tmp
oii.summary(tmp,extended=TRUE)



