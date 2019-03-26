library(agop)


### Name: index_rp
### Title: The r_p-index
### Aliases: index.rp index_rp

### ** Examples

x <- runif(100, 0, 100);
index.rp(x);            # the r_oo-index
floor(index.rp(x));     # the h-index
index.rp(floor(x), 1);  # the w-index



