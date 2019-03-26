library(rPref)


### Name: pred_succ
### Title: Predecessor and Successor Functions
### Aliases: all_pred all_succ hasse_pred hasse_succ init_pred_succ
###   pred_succ

### ** Examples


# preference on mtcars for high mpg and low weight
p <- high(mpg) * low(wt)
init_pred_succ(p, mtcars)

# helper to show mpg/hp values
show_vals <- function(x) mtcars[x,c('mpg','wt')]

# pick some tuple "in the middle"
show_vals(10)

# show (direct) predecessors/successors of tuple 10
show_vals(hasse_pred(p, 10)) # Next better car
show_vals(hasse_succ(p, 10)) # Next worse car
show_vals(all_pred(p, 10))   # All better cars
show_vals(all_succ(p, 10))   # All worse cars



