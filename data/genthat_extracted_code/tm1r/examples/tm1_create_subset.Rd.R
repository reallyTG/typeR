library(tm1r)


### Name: tm1_create_subset
### Title: TM1 Create New Subset to a Dimension
### Aliases: tm1_create_subset

### ** Examples

## Not run: 
##D tm1_create_subset(tm1_connection("localhost", "8881", "admin", "apple"),
##D "month", "Q1Months", element = "Jan|Feb|Mar")
##D 
##D con_obj <- tm1_connection("localhost", "8881", "admin", "apple")
##D tm1_create_element(con_obj, "month", "all", mdx = "[month].MEMBERS")
## End(Not run)



