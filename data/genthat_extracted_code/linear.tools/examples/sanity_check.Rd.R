library(linear.tools)


### Name: sanity_check
### Title: check x with various characters
### Aliases: sanity_check
### Keywords: internal

### ** Examples


###_____ unit test ____


data = ggplot2::diamonds
# sanity_check(dasfdfdsfsgre)
null_checl = NULL ;
tryCatch( sanity_check(null_checl),
          error = function(err) print(err))
tryCatch( sanity_check(null_checl,NULL_allowed = TRUE),
          error = function(err) print(err))


tryCatch( sanity_check(c('x','y'),min_oberserv = 3),
          error = function(err) print(err))
tryCatch( sanity_check(c('x','y'),min_oberserv = 2),
          error = function(err) print(err))

tryCatch( sanity_check(data,Class = 'data.frame2'),
          error = function(err) print(err))
tryCatch( sanity_check(data,min_oberserv = 3000000),
          error = function(err) print(err))

tryCatch( sanity_check(data,exact_length = ncol(data) ),
          error = function(err) print(err))
tryCatch( sanity_check(
  data.frame(data,NA,stringsAsFactors = FALSE)[1:10,],
                       complete_cases = TRUE ),
          error = function(err) print(err))


colnames(data)
tryCatch( sanity_check(x= c('carat') ,exact_in_match = data),
          error = function(err) print(err))
tryCatch( sanity_check(x= c('carat') ,exact_in_match = colnames(data)) ,
          error = function(err) print(err))
tryCatch( sanity_check(x= c('carat2') ,exact_in_match = data),
          error = function(err) print(err))
tryCatch(  sanity_check(x= c('carat','carat2') ,exact_in_match = data),
           error = function(err) print(err))

tryCatch(  sanity_check(x=colnames(data),exact_in_match = c('carat')),
           error = function(err) print(err))

tryCatch(   sanity_check(x=data,exact_in_match = c('carat2')),
            error = function(err) print(err))




