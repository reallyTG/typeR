library(maditr)


### Name: dcast
### Title: Convert data between wide and long forms.
### Aliases: dcast melt guess

### ** Examples

# examples from 'tidyr' package
stocks = data.frame(
    time = as.Date('2009-01-01') + 0:9,
    X = rnorm(10, 0, 1),
    Y = rnorm(10, 0, 2),
    Z = rnorm(10, 0, 4)
)
stocksm = stocks %>%
    melt(id.vars = "time", variable.name = "stock", value.name = "price")
stocksm %>% dcast(time ~ stock)
stocksm %>% dcast(stock ~ time)

# dcast and melt are complements
df = data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df %>%
    dcast(z ~ x, value.var = "y") %>%
    melt(id.vars = "z", variable.name = "x", value.name = "y", na.rm = TRUE)



