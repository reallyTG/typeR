library(data.table)


### Name: :=
### Title: Assignment by reference
### Aliases: := set
### Keywords: data

### ** Examples

DT = data.table(a = LETTERS[c(3L,1:3)], b = 4:7)
DT[, c := 8]                # add a numeric column, 8 for all rows
DT[, d := 9L]               # add an integer column, 9L for all rows
DT[, c := NULL]             # remove column c
DT[2, d := -8L]             # subassign by reference to d; 2nd row is -8L now
DT                          # DT changed by reference
DT[2, d := 10L][]           # shorthand for update and print

DT[b > 4, b := d * 2L]      # subassign to b with d*2L on those rows where b > 4 is TRUE
DT[b > 4][, b := d * 2L]    # different from above. [, := ] is performed on the subset
                            # which is an new (ephemeral) data.table. Result needs to be
                            # assigned to a variable (using `<-`).

DT[, e := mean(d), by = a]  # add new column by group by reference
DT["A", b := 0L, on = "a"]  # ad-hoc update of column b for group "A" using
			    # joins-as-subsets with binary search and 'on='
# same as above but using keys
setkey(DT, a)
DT["A", b := 0L]            # binary search for group "A" and set column b using keys
DT["B", f := mean(d)]       # subassign to new column, NA initialized

# Adding multiple columns
## by name
DT[ , c('sin_d', 'log_e', 'cos_d') :=
   .(sin(d), log(e), cos(d))]
## by patterned name
DT[ , paste(c('sin', 'cos'), 'b', sep = '_') :=
   .(sin(b), cos(b))]
## using lapply & .SD
DT[ , paste0('tan_', c('b', 'd', 'e')) :=
   lapply(.SD, tan), .SDcols = c('b', 'd', 'e')]
## using forced evaluation to disambguate a vector of names
##   and overwrite existing columns with their squares
sq_cols = c('b', 'd', 'e')
DT[ , (sq_cols) := lapply(.SD, `^`, 2L), .SDcols = sq_cols]
## by integer (NB: for robustness, it is not recommended
##   to use explicit integers to update/define columns)
DT[ , c(2L, 3L, 4L) := .(sqrt(b), sqrt(d), sqrt(e))]
## by implicit integer
DT[ , grep('a$', names(DT)) := tolower(a)]
## by implicit integer, using forced evaluation
sq_col_idx = grep('d$', names(DT))
DT[ , (sq_col_idx) := lapply(.SD, dnorm),
   .SDcols = sq_col_idx]

## Not run: 
##D # Speed example:
##D 
##D m = matrix(1, nrow = 2e6L, ncol = 100L)
##D DF = as.data.frame(m)
##D DT = as.data.table(m)
##D 
##D system.time(for (i in 1:1000) DF[i, 1] = i)
##D # 15.856 seconds
##D system.time(for (i in 1:1000) DT[i, V1 := i])
##D # 0.279 seconds  (57 times faster)
##D system.time(for (i in 1:1000) set(DT, i, 1L, i))
##D # 0.002 seconds  (7930 times faster, overhead of [.data.table is avoided)
##D 
##D # However, normally, we call [.data.table *once* on *large* data, not many times on small data.
##D # The above is to demonstrate overhead, not to recommend looping in this way. But the option
##D # of set() is there if you need it.
## End(Not run)




