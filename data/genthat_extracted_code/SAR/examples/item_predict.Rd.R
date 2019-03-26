library(SAR)


### Name: item_predict
### Title: Get item-to-item recommendations from a SAR model
### Aliases: item_predict

### ** Examples


data(ms_usage)
mod <- sar(ms_usage)

# item recomendations for a set of item IDs
items <- unique(ms_usage$item)[1:5]
item_predict(mod, items=items)




