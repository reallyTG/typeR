library(plotfunctions)


### Name: group_sort
### Title: Sort split by grouping predictor.
### Aliases: group_sort

### ** Examples

# example InsectSprays from R datasets
InsectSprays$Type <- ifelse(InsectSprays$spray %in% c("A","B", "F"), 1, 2)

ind <- group_sort(InsectSprays$count, 
    group=list(Spray=InsectSprays$spray, Type=InsectSprays$Type))
InsectSprays[ind,]
InsectSprays



