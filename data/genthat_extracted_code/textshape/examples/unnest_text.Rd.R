library(textshape)


### Name: unnest_text
### Title: Un-nest Nested Text Columns
### Aliases: unnest_text

### ** Examples

dat <- DATA

## Add a nested/list text column
dat$split <- lapply(dat$state, function(x) {
    unlist(strsplit(x, '(?<=[?!.])\\s+', perl = TRUE))
})

unnest_text(dat)
unnest_text(dat, integer.rownames = FALSE)

## Add a second nested integer column
dat$d <- lapply(dat$split, nchar)
## Not run: 
##D unnest_text(dat) # causes error, must supply column explicitly
## End(Not run)
unnest_text(dat, 'split')

## As a data.table
library(data.table)
dt_dat <- data.table::as.data.table(data.table::copy(dat))
unnest_text(dt_dat, 'split')
## Not run: 
##D unnest_text(dt_dat, 'd')
## End(Not run)

## Not run: 
##D ## As a tibble
##D library(tibble)
##D t_dat <- tibble:::as_tibble(dat)
##D unnest_text(t_dat, 'split')
## End(Not run)



