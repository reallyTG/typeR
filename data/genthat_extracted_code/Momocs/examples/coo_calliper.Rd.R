library(Momocs)


### Name: coo_calliper
### Title: Calculates the calliper length
### Aliases: coo_calliper

### ** Examples

b <- bot[1]
coo_calliper(b)
p <- coo_calliper(b, arr.ind=TRUE)
p
p$length
ids <- p$arr_ind[[1]]
coo_plot(b)
segments(b[ids[1], 1], b[ids[1], 2], b[ids[2], 1], b[ids[2], 2], lty=2)

# on a Coo
bot %>%
coo_sample(32) %>% # for speed sake
coo_calliper()

bot %>%
coo_sample(32) %>% # for speed sake
coo_calliper(arr.ind=TRUE)




