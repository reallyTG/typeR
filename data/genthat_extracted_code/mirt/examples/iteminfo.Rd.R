library(mirt)


### Name: iteminfo
### Title: Function to calculate item information
### Aliases: iteminfo
### Keywords: information

### ** Examples


mod <- mirt(Science, 1)
extr.2 <- extract.item(mod, 2)
Theta <- matrix(seq(-4,4, by = .1))
info.2 <- iteminfo(extr.2, Theta)

#do something with the info?
plot(Theta, info.2, type = 'l', main = 'Item information')

## Not run: 
##D 
##D #category information curves
##D cat.info <- iteminfo(extr.2, Theta, total.info = FALSE)
##D plot(Theta, cat.info[,1], type = 'l', ylim = c(0, max(cat.info)),
##D      ylab = 'info', main = 'Category information')
##D for(i in 2:ncol(cat.info))
##D    lines(Theta, cat.info[,i], col = i)
##D 
##D ## Customized test information plot
##D T1 <- T2 <- 0
##D dat <- expand.table(LSAT7)
##D mod1 <- mirt(dat, 1)
##D mod2 <- mirt(dat, 1, 'Rasch')
##D for(i in 1:5){
##D   T1 <- T1 + iteminfo(extract.item(mod1, i), Theta)
##D   T2 <- T2 + iteminfo(extract.item(mod2, i), Theta)
##D }
##D plot(Theta, T2/T1, type = 'l', ylab = 'Relative Test Information', las = 1)
##D lines(Theta, T1/T1, col = 'red')
##D 
##D # multidimensional
##D mod <- mirt(dat, 2, TOL=1e-2)
##D ii <- extract.item(mod, 1)
##D Theta <- as.matrix(expand.grid(-4:4, -4:4))
##D 
##D iteminfo(ii, Theta, degrees=c(45,45)) # equal angle
##D iteminfo(ii, Theta, degrees=c(90,0)) # first dimension only
##D 
##D # information matrices
##D iteminfo(ii, Theta, multidim_matrix = TRUE)
##D iteminfo(ii, Theta[1, , drop=FALSE], multidim_matrix = TRUE)
##D 
## End(Not run)



