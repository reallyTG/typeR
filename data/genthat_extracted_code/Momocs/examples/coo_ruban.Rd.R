library(Momocs)


### Name: coo_ruban
### Title: Plots differences as (colored) segments aka a ruban
### Aliases: coo_ruban

### ** Examples

ms <- mshapes(efourier(bot , 10), "type")
b <- ms$shp$beer
w <- ms$shp$whisky
# we obtain the mean shape, then euclidean distances between points
m <- mshapes(list(b, w))
d <- edm(b, w)
# First plot
coo_plot(m, plot=FALSE)
coo_draw(b)
coo_draw(w)
coo_ruban(m, d, lwd=5)

#Another example
coo_plot(m, plot=FALSE)
coo_ruban(m, d, palette=col_summer2, lwd=5)

#If you want linewidth rather than color
coo_plot(m, plot=FALSE)
coo_ruban(m, d, palette=col_black)



