library(qdap)


### Name: rm_row
### Title: Remove Rows That Contain Markers
### Aliases: rm_row rm_empty_row

### ** Examples

## Not run: 
##D #rm_row EXAMPLE:
##D rm_row(DATA, "person", c("sam", "greg"))
##D rm_row(DATA, 1, c("sam", "greg"))
##D rm_row(DATA, "state", c("Comp"))
##D rm_row(DATA, "state", c("I "))
##D rm_row(DATA, "state", c("you"), contains = TRUE, ignore.case=TRUE)
##D 
##D #rm_empty_row EXAMPLE:
##D (dat <- rbind.data.frame(DATA[, c(1, 4)], matrix(rep(" ", 4), 
##D    ncol =2, dimnames=list(12:13, colnames(DATA)[c(1, 4)]))))
##D rm_empty_row(dat)
## End(Not run)



