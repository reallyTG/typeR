library(StratigrapheR)


### Name: simp.lim
### Title: Joins and orders adjacent or overlapping lim objects of same ID
### Aliases: simp.lim

### ** Examples

l   <- c(50,2,4,6,50,8,50,51,50,80)
r   <- c(50,5,6,9,8,2,51,51,50,80)
id  <- c("i1", "i1", "i1", "i1", "i2","i2","i2","i2","i2","i2")
b   <- c("[]", "][", "][", "]]", "][","[[","][","][","][","][")

simp.lim(l = l, r = r, id = id, b = b)




