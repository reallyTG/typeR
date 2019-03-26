library(polmineR)


### Name: cqp
### Title: Tools for CQP queries.
### Aliases: cqp is.cqp check_cqp_query as.cqp

### ** Examples

is.cqp("migration") # will return FALSE
is.cqp('"migration"') # will return TRUE
is.cqp('[pos = "ADJA"] "migration"') # will return TRUE

as.cqp("migration")
as.cqp(c("migration", "diversity"))
as.cqp(c("migration", "diversity"), collapse = TRUE)
as.cqp("migration", normalise.case = TRUE)


check_cqp_query('"Integration.*"') # TRUE, the query is ok
check_cqp_query('"Integration.*') # FALSE, closing quotation mark is missing
check_cqp_query("'Integration.*") # FALSE, closing quotation mark is missing
check_cqp_query(c("'Integration.*", '"Integration.*')) # FALSE too



