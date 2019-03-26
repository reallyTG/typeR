library(TriMatch)


### Name: as.data.frame.list
### Title: Convert a list of vectors to a data frame.
### Aliases: as.data.frame.list

### ** Examples

    test1 <- list( c(a='a',b='b',c='c'), c(a='d',b='e',c='f'))
    as.data.frame(test1)
    
    test2 <- list( c('a','b','c'), c(a='d',b='e',c='f'))
    as.data.frame(test2)
    
    test3 <- list('Row1'=c(a='a',b='b',c='c'), 'Row2'=c(var1='d',var2='e',var3='f'))
    as.data.frame(test3)
    
    ## Not run: 
##D     #This will print a warning.
##D     test4 <- list('Row1'=letters[1:5], 'Row2'=letters[1:7], 'Row3'=letters[8:14])
##D     as.data.frame(test4)
##D     
## End(Not run)
    
    test5 <- list(letters[1:10], letters[11:20])
    as.data.frame(test5)
    
    ## Not run: 
##D     #This will throw an error.
##D     test6 <- list(list(letters), letters)
##D     as.data.frame(test6)
##D     
## End(Not run)



