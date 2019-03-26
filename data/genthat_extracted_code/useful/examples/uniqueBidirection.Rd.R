library(useful)


### Name: uniqueBidirection
### Title: uniqueBidirection
### Aliases: uniqueBidirection

### ** Examples


ex <- data.frame(One=c('a', 'c', 'a', 'd', 'd', 'c', 'b'), 
Two=c('b', 'd', 'b', 'e', 'c', 'd', 'a'),
stringsAsFactors=FALSE)

# make a bigger version
exBig <- ex
for(i in 1:1000)
{
    exBig <- rbind(exBig, ex)
}

dim(exBig)

uniqueBidirection(ex)
uniqueBidirection(exBig)

ex3 <- dplyr::bind_cols(ex, dplyr::data_frame(Three=rep('a', nrow(ex))))
uniqueBidirection(ex3)




