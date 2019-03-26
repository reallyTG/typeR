library(textclean)


### Name: drop_row
### Title: Filter Rows That Contain Markers
### Aliases: drop_row keep_row drop_empty_row drop_NA

### ** Examples

## Not run: 
##D ## drop_row EXAMPLE:
##D drop_row(DATA, "person", c("sam", "greg"))
##D keep_row(DATA, "person", c("sam", "greg"))
##D drop_row(DATA, 1, c("sam", "greg"))
##D drop_row(DATA, "state", c("Comp"))
##D drop_row(DATA, "state", c("I "))
##D drop_row(DATA, "state", c("you"), ignore.case=TRUE)
##D 
##D ## drop_empty_row EXAMPLE:
##D (dat <- rbind.data.frame(DATA[, c(1, 4)], matrix(rep(" ", 4), 
##D    ncol =2, dimnames=list(12:13, colnames(DATA)[c(1, 4)]))))
##D drop_empty_row(dat)
##D 
##D ## drop_NA EXAMPLE:
##D DATA[1:3, "state"] <- NA
##D drop_NA(DATA)
## End(Not run)



