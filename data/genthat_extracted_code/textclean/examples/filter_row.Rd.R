library(textclean)


### Name: filter_row
### Title: Remove Rows That Contain Markers
### Aliases: filter_row filter_empty_row filter_NA

### ** Examples

## Not run: 
##D ## filter_row EXAMPLE:
##D filter_row(DATA, "person", c("sam", "greg"))
##D filter_row(DATA, 1, c("sam", "greg"))
##D filter_row(DATA, "state", c("Comp"))
##D filter_row(DATA, "state", c("I "))
##D filter_row(DATA, "state", c("you"), ignore.case=TRUE)
##D 
##D ## filter_empty_row EXAMPLE:
##D (dat <- rbind.data.frame(DATA[, c(1, 4)], matrix(rep(" ", 4), 
##D    ncol =2, dimnames=list(12:13, colnames(DATA)[c(1, 4)]))))
##D filter_empty_row(dat)
##D 
##D ## filter_NA EXAMPLE:
##D DATA[1:3, "state"] <- NA
##D filter_NA(DATA)
## End(Not run)



