library(catcont)


### Name: mutate_if_cat
### Title: mutate_if_cat, mutate_if_cont
### Aliases: mutate_if_cat mutate_if_cat.default mutate_if_cat.data.table
###   mutate_if_cont mutate_if_cont.default mutate_if_cont.data.table

### ** Examples


 data(iris)

## Not run: 
##D   iris %>% mutate_if_cat( as.character )
##D 
##D   library(data.table)
##D   setDT(iris)
##D   class(iris$Species)
##D   iris %>% mutate_if_cat( as.character )
##D   class(iris1$Species)  # character
##D   class(iris2)
##D 
##D   iris %>% mutate_if_cont( add, 2 )
## End(Not run)




