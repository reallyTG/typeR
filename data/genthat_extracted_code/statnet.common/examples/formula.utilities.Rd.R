library(statnet.common)


### Name: formula.utilities
### Title: Functions for Querying, Validating and Extracting from Formulas
###   A suite of utilities for handling model formulas of the style used in
###   Statnet packages.
### Aliases: formula.utilities append_rhs.formula append.rhs.formula
###   filter_rhs.formula nonsimp_update.formula nonsimp.update.formula
###   term.list.formula list_summands.call list_rhs.formula
###   eval_lhs.formula

### ** Examples


## append_rhs.formula

(f1 <- append_rhs.formula(y~x,list(as.name("z1"),as.name("z2"))))
(f2 <- append_rhs.formula(~y,list(as.name("z"))))
(f3 <- append_rhs.formula(~y+x,structure(list(as.name("z")),sign=-1)))
(f4 <- append_rhs.formula(~y,list(as.name("z")),TRUE))
(f5 <- append_rhs.formula(y~x,~z1-z2))

## Don't show: 
stopifnot(f1 == (y~x+z1+z2))
stopifnot(f2 == (y~z))
stopifnot(f3 == (y+x~-z))
stopifnot(f4 == (~y+z))
stopifnot(f5 == (y~x+z1-z2))
## End(Don't show)

## filter_rhs.formula
(f1 <- filter_rhs.formula(~a-b+c, `!=`, "a"))
(f2 <- filter_rhs.formula(~-a+b-c, `!=`, "a"))
(f3 <- filter_rhs.formula(~a-b+c, `!=`, "b"))
(f4 <- filter_rhs.formula(~-a+b-c, `!=`, "b"))
(f5 <- filter_rhs.formula(~a-b+c, `!=`, "c"))
(f6 <- filter_rhs.formula(~-a+b-c, `!=`, "c"))
(f7 <- filter_rhs.formula(~c-a+b-c(a),
                          function(x) (if(is.call(x)) x[[1]] else x)!="c"))


## Don't show: 
stopifnot(f1 == ~-b+c)
stopifnot(f2 == ~b-c)
stopifnot(f3 == ~a+c)
stopifnot(f4 == ~-a-c)
stopifnot(f5 == ~a-b)
stopifnot(f6 == ~-a+b)
stopifnot(f7 == ~-a+b)
## End(Don't show)

## eval_lhs.formula

(result <- eval_lhs.formula((2+2)~1))

stopifnot(identical(result,4))



