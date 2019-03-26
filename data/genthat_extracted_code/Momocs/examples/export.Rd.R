library(Momocs)


### Name: export
### Title: Exports Coe objects and shapes
### Aliases: export

### ** Examples

## Not run: 
##D # Will write files on your machine!
##D bf <- efourier(bot, 6)
##D # Export Coe (here Fourier coefficients)
##D export(bf) # data.txt which can be opened by every software including MS Excel
##D 
##D # If you come from a country that uses comma as decimal separator (not recommended, but...)
##D export(bf, dec=',')
##D export(bf, file='data.xls', dec=',')
##D 
##D # Export PCA scores
##D bf %>% PCA %>% export()
##D 
##D # for shapes (matrices)
##D  export(bot[1], file='bot1.txt')
##D 
##D  # remove these files from your machine
##D  file.remove("coefficients.txt", "data.xls", "scores.txt")
## End(Not run)



