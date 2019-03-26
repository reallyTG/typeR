library(cytofan)


### Name: do_fan
### Title: Compute summary statistics for 'stat_fan'
### Aliases: do_fan

### ** Examples

FanEuStockMarkets <- lapply(colnames(EuStockMarkets),function(id) {
    res <- do_fan(EuStockMarkets[,id])
    res$id <- id
    return(res)
})
FanEuStockMarkets <- do.call(rbind,FanEuStockMarkets)




