library(tempR)


### Name: get.decluttered
### Title: Get decluttering matrix indicating where to show/hide reference
###   lines
### Aliases: get.decluttered

### ** Examples

# example using 'ojtcata' data set
data(ojtcata)
x <- aggregate(ojtcata[, -c(1:4)], list(samp = ojtcata$samp, attribute = ojtcata$attribute), sum)
p.1.checked <- x[x$samp == 1, -c(1:2)]
p.1.eval <- length(unique(ojtcata$cons))
p.not1.checked <- aggregate(x[, -c(1:2)], list(attribute = x$attribute), sum)[, -1]
p.not1.eval <- length(unique(ojtcata$cons)) * (length(unique(ojtcata$samp)) - 1)

# reference lines for contrast products
p.1.refline <- p.not1.checked / p.not1.eval
# decluttering matrix corresponds to the dimensions of p.1.refline
p.1.declutter <- get.decluttered(x = unlist(p.1.checked), n.x = p.1.eval,
                                        y = unlist(p.not1.checked), n.y = p.not1.eval)
(p.1.declutter <- matrix(p.1.declutter, nrow = nrow(p.1.checked)))



