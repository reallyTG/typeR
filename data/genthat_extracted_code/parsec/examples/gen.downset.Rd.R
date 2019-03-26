library(parsec)


### Name: gen.downset
### Title: Antichain generating a given downset
### Aliases: gen.downset

### ** Examples

lv <- c(2, 3, 2)
prof <- var2prof(varlen = lv)

z <- getzeta(prof)
down <- c("111", "211", "112", "212")
gen <- gen.downset(z, down)

plot(z, lwd = 1 + (rownames(prof$profiles)%in%down), col = 1 + gen,
sub = "bold = the downset, red = the antichain generating the downset")



