library(bulletcp)


### Name: get_grooves_bcp
### Title: Conforming get_grooves_"name" function.
### Aliases: get_grooves_bcp

### ** Examples

data("example_data")
head(raw_data)
raw_data <- raw_data[seq(from = 1, to = nrow(raw_data), by = 30),]
cp_gibbs3 <- get_grooves_bcp(x = raw_data$x,
    value = raw_data$value,
    adjust = 10,
    iter = 300,
    warmup = 100)



