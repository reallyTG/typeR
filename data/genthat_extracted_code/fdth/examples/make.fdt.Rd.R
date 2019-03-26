library(fdth)


### Name: make.fdt
### Title: Frequency distribution table for continuous and categorical
###   variables
### Aliases: make.fdt make.fdt_cat

### ** Examples

## Numeric
## Making one reference fdt
set.seed(33)
x <- rnorm(1e3, 
           20, 
           2)

(tb.r <- fdt(x))

## Making a brand new
(tb.n  <- make.fdt(f=tb.r$table$f,
                   start=13.711,
                   end=27.229))   # Huumm ..., good, but ... Can it be better? 

summary(tb.n,
        format=TRUE,
        pattern='%.3f')           # Is it nice now?


## Categorical
x <- sample(letters[1:5], 
            1e3, 
            rep=TRUE)

## Making one reference fdt
(tb.r <- fdt_cat(x))

## Making a brand new
(tb.n <- make.fdt_cat(f=tb.r$f,
                      categ=tb.r$Category))



