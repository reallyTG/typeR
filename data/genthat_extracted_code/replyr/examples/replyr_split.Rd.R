library(replyr)


### Name: replyr_split
### Title: split a data item by values in a column.
### Aliases: replyr_split

### ** Examples


d <- data.frame(group=c(1,1,2,2,2),
                order=c(.1,.2,.3,.4,.5),
                values=c(10,20,2,4,8))
dSplit <- replyr_split(d, 'group', partitionMethod='extract')
dApp <- lapply(dSplit, function(di) data.frame(as.list(colMeans(di))))
replyr_bind_rows(dApp)




