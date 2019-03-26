library(tempR)


### Name: tcata.line.plot
### Title: Temporal Check-All-That-Apply (TCATA) curve
### Aliases: tcata.line.plot

### ** Examples

# example using 'syrah' data set
low1 <- t(syrah[seq(3, 1026, by = 6), -c(1:4)])
colnames(low1) <- 10:180
tcata.line.plot(get.smooth(low1), lwd = 2, main = "Low-ethanol wine (Sip 1)")

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
p.1.declutter <- matrix(get.decluttered(x = unlist(p.1.checked), n.x = p.1.eval,
                                        y = unlist(p.not1.checked), n.y = p.not1.eval),
                        nrow = nrow(p.1.checked))
times <- get.times(colnames(x)[-c(1:2)])
attributes <- unique(x$attribute)
palettes <- make.palettes(length(attributes))
tcata.line.plot(p.1.checked, n = p.1.eval, attributes = attributes, times = times,
                reference = p.1.refline, ref.lty = 3, declutter = p.1.declutter,
                highlight = TRUE, highlight.lwd = 4,
                line.col = palettes$pal, highlight.col = palettes$pal.light,
                main = "Sample 1", height = 7, width = 11, legend.cex = 0.7)



