library(radiant.data)


### Name: filter_data
### Title: Filter data with user-specified expression
### Aliases: filter_data

### ** Examples

select(diamonds, 1:3) %>% filter_data(filt = "price > max(.$price) - 100")
select(diamonds, 1:3) %>% filter_data(filt = "runif(nrow(.)) > .995")



