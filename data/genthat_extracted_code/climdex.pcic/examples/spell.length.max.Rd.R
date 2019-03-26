library(climdex.pcic)


### Name: spell.length.max
### Title: Maximum spell length
### Aliases: spell.length.max
### Keywords: climate ts

### ** Examples


prec.dat <- c(0.1, 3.0, 4.3, 1.9, 1.3, 6.0, 0, 0, 4.0, 1)
phony.date.factor <- factor(rep(1:2, each=5))

## With spells spanning years...
cwd <- spell.length.max(prec.dat, phony.date.factor, 1, ">=", TRUE)

## Without spells spanning years...
altcwd <- spell.length.max(prec.dat, phony.date.factor, 1, ">=", FALSE)




