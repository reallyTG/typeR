library(Momocs)


### Name: npoly
### Title: Calculate natural polynomial fits on open outlines
### Aliases: npoly npoly.default npoly.Opn

### ** Examples

data(olea)
o <- olea[1]
op <- opoly(o, degree=4)
op
# shape reconstruction
opi <- opoly_i(op)
coo_plot(o)
coo_draw(opi, border="red")
# R2 for degree 1 to 10
r <- numeric()
for (i in 1:10) { r[i] <- npoly(o, degree=i)$r2 }
plot(2:10, r[2:10], type='b', pch=20, col='red', main='R2 / degree')



