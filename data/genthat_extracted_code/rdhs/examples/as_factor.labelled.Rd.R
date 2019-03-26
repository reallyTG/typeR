library(rdhs)


### Name: as_factor.labelled
### Title: Archived dataset capable as_factor
### Aliases: as_factor.labelled

### ** Examples

## Not run: 
##D # create a data.frame using the new haven_labelled class
##D df1 <- data.frame(
##D area = haven::labelled(c(1L, 2L, 3L), c("reg 1"=1,"reg 2"=2,"reg 3"=3)),
##D climate = haven::labelled(c(0L, 1L, 1L), c("cold"=0,"hot"=1))
##D )
##D 
##D # manually change it to the old style
##D class(df1$area) <- "labelled"
##D class(df1$climate) <- "labelled"
##D 
##D # with rdhs attached, i.e. library(rdhs), we can now do the following
##D haven::as_factor(df1$area)
##D 
##D # we can also use this on the data.frame by using the only_labelled argument
##D haven::as_factor(df1, only_labelled = TRUE)
## End(Not run)



