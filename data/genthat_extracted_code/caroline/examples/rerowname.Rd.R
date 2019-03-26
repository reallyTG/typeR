library(caroline)


### Name: rerowname
### Title: Rename select rows of a dataframe
### Aliases: rerowname
### Keywords: manip

### ** Examples


df <- data.frame(a=c(1,2,3), b=c('x','y','z'), c=c(5,3,2))
rownames(df) <- c('p','q','NA')
rerowname(df)




