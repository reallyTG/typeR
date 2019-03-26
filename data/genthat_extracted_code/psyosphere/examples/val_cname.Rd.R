library(psyosphere)


### Name: val_cname
### Title: Validate the column name of a data frame
### Aliases: val_cname

### ** Examples
## No test: 
data(psyo)

# Test t_id
t1 <- psyo
t_id <- "id"
e <- val_cname(t1, t_id, size = 15, type = "numeric"); if (e != "") {stop(e)}

# Be aware that id column is saved as "factor" and therefore mode() returns
# numeric.

t2 <- psyo
t_id <- 1
e <- val_cname(t2, t_id); if (e != "") {stop(e)}

t3 <- psyo
t_id <- "id"
e <- val_cname(t3, t_id, size = 15, type = "character"); if (e != "") {stop(e)}

t4 <- psyo
t_id <- "id"
e <- val_cname(t4, t_id, size = 20); if (e != "") {stop(e)}

t5 <- psyo
t_id <- "id"
e <- val_cname(t5, t_id, size = "20"); if (e != "") {stop(e)}
## End(No test)


