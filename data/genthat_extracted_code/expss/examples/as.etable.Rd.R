library(expss)


### Name: as.etable
### Title: Convert data.frame/matrix to object of class 'etable'
### Aliases: as.etable is.etable

### ** Examples

data(mtcars)
etable_mtcars = as.etable(mtcars)
is.etable(etable_mtcars) #TRUE

etable_mtcars #another 'print' method is used

cor(mtcars) %>% as.etable()



