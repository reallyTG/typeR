library(Momocs)


### Name: opoly_i
### Title: Calculates shape from a polynomial model
### Aliases: opoly_i npoly_i

### ** Examples

data(olea)
o <- olea[5]
coo_plot(o)
for (i in 2:7){
x <- opoly_i(opoly(o, i))
coo_draw(x, border=col_summer(7)[i], points=FALSE)  }



