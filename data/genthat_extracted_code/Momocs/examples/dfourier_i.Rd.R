library(Momocs)


### Name: dfourier_i
### Title: Investe discrete cosinus transform
### Aliases: dfourier_i

### ** Examples

# dfourier and inverse dfourier
o <- olea[1]
o <- coo_bookstein(o)
coo_plot(o)
o.dfourier <- dfourier(o, nb.h=12)
o.dfourier
o.i <- dfourier_i(o.dfourier)
o.i <- coo_bookstein(o.i)
coo_draw(o.i, border='red')

o <- olea[1]
h.range <- 2:13
coo <- list()
for (i in seq(along=h.range)){
coo[[i]] <- dfourier_i(dfourier(o, nb.h=h.range[i]))}
names(coo) <- paste0('h', h.range)
panel(Opn(coo), borders=col_india(12), names=TRUE)
title('Discrete Cosine Transforms')



