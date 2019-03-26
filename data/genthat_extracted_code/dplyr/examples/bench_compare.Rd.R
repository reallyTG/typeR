library(dplyr)


### Name: bench_compare
### Title: Evaluate, compare, benchmark operations of a set of srcs.
### Aliases: bench_compare bench_tbls compare_tbls compare_tbls2 eval_tbls
###   eval_tbls2
### Keywords: internal

### ** Examples

## Not run: 
##D if (require("microbenchmark") && has_lahman()) {
##D lahman_local <- lahman_srcs("df", "sqlite")
##D teams <- lapply(lahman_local, function(x) x %>% tbl("Teams"))
##D 
##D compare_tbls(teams, function(x) x %>% filter(yearID == 2010))
##D bench_tbls(teams, function(x) x %>% filter(yearID == 2010))
##D 
##D # You can also supply arbitrary additional arguments to bench_tbls
##D # if there are other operations you'd like to compare.
##D bench_tbls(teams, function(x) x %>% filter(yearID == 2010),
##D    base = subset(Lahman::Teams, yearID == 2010))
##D 
##D # A more complicated example using multiple tables
##D setup <- function(src) {
##D   list(
##D     src %>% tbl("Batting") %>% filter(stint == 1) %>% select(playerID:H),
##D     src %>% tbl("Master") %>% select(playerID, birthYear)
##D   )
##D }
##D two_tables <- lapply(lahman_local, setup)
##D 
##D op <- function(tbls) {
##D   semi_join(tbls[[1]], tbls[[2]], by = "playerID")
##D }
##D # compare_tbls(two_tables, op)
##D bench_tbls(two_tables, op, times = 2)
##D 
##D }
## End(Not run)



