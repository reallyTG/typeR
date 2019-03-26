library(yasp)


### Name: p
### Title: paste variants
### Aliases: p ps pss psu psh psnl p0 pc pcs pcc pcnl pcsc pc_and pc_or

### ** Examples

x <- head(letters, 3)
y <- tail(letters, 3)
# paste
p(x, y)
p0(x, y)
# paste + collapse
pc(x)
pc(x, y)
pcs(x)
pcc(x)
pcc(x, y)
pcsc(x)
pcnl(x)
pc_and(x[1:2])
pc_and(x[1:3])
pc_or(x[1:2])
pc_or(x[1:3])
pc_and(x, y)
pc_and(x, y, sep = "-")
pc_and(x[1])
pc_and(x[0])



