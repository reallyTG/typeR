library(plotfunctions)


### Name: dotplot_error
### Title: Utility function
### Aliases: dotplot_error

### ** Examples


# example InsectSprays from R datasets
avg <- aggregate(count ~ spray, data=InsectSprays, mean)
avg <- merge(avg, 
    aggregate(count ~ spray, data=InsectSprays, sd),
    by="spray", all=TRUE)

dotplot_error(avg$count.x, se.val=avg$count.y, labels=avg$spray)

# we could add the type of spray to the averages:
avg$type <- c(1,1,2,2,2,1)
dotplot_error(avg$count.x, se.val=avg$count.y, groups=avg$type, labels=avg$spray) 




