library(epiphy)


### Name: spatial_hier
### Title: Spatial hierarchy analysis.
### Aliases: spatial_hier

### ** Examples

my_data_low <- incidence(tomato_tswv$field_1929)
my_data_low <- clump(my_data_low, c(x = 3, y = 3))
my_data_high <- my_data_low
my_data_high$data$n <- 1
my_data_high$data$i <- ifelse(my_data_high$data$i > 0, 1, 0)
my_data_low  <- split(my_data_low, by = "t")
my_data_high <- split(my_data_high, by = "t")
res <- spatial_hier(my_data_low, my_data_high)

res
summary(res)
plot(res)




