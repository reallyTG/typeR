library(parsec)


### Name: gen.upset
### Title: Antichain generating a given upset
### Aliases: gen.upset

### ** Examples

lv <- c(2, 3, 2)
prof <- var2prof(varlen = lv)

z <- getzeta(prof)
up <- c("221", "131", "231", "222", "132", "232")
gen <- gen.upset(z, up)

plot(z, lwd = 1 + (rownames(prof$profiles)%in%up), col = 1 + gen,
sub = "bold = the upset, red = the antichain generating the upset")



