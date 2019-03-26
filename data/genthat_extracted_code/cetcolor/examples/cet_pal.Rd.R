library(cetcolor)


### Name: cet_pal
### Title: CET Perceptually Uniform Color Maps
### Aliases: cet_pal

### ** Examples

# Grab 8 colors from rainbow or rainbow_bgyr_35-85_c73_n256
colors = cet_pal(8)
plot(1:8, 1:8, col=colors, pch=19, cex=3, xlab="", ylab="")

# Grab 25 colors from coolwarm or diverging_bwr_40-95_c42_n256
colors = cet_pal(25, name = "coolwarm")
plot(1:25, 1:25, col=colors, pch=19, cex=3, xlab="", ylab="")




