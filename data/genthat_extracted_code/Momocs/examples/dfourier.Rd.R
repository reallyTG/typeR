library(Momocs)


### Name: dfourier
### Title: Discrete cosinus transform
### Aliases: dfourier dfourier.default dfourier.Opn dfourier.Coo

### ** Examples

## Not run: 
##D  # because it's long
##D od <- dfourier(olea)
##D od
##D op <- PCA(od)
##D plot(op, 1)
## End(Not run)
# dfourier and inverse dfourier
o <- olea[1]
o <- coo_bookstein(o)
coo_plot(o)
o.dfourier <- dfourier(o, nb.h=12)
o.dfourier
o.i <- dfourier_i(o.dfourier)
o.i <- coo_bookstein(o.i)
coo_draw(o.i, border='red')

#future calibrate_reconstructions
o <- olea[1]
h.range <- 2:13
coo <- list()
for (i in seq(along=h.range)){
coo[[i]] <- dfourier_i(dfourier(o, nb.h=h.range[i]))}
names(coo) <- paste0('h', h.range)
panel(Opn(coo), borders=col_india(12), names=TRUE)
title('Discrete Cosine Transforms')



