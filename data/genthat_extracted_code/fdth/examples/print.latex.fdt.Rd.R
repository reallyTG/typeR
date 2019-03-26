library(fdth)


### Name: print
### Title: Print method for latex.fdt and latex.fdt_cat objects
### Aliases: print.latex.fdt
### Keywords: latex, fdt

### ** Examples

library(fdth)

##Example 1: The simplest possible
t1 <- fdt(rnorm(n=1e3,
                mean=10,
                sd=2))

t1x <- latex.fdt(t1)

t1x


## Example 2
(t1x <- latex.fdt(t1,
                  replace.breaks=FALSE,
                  columns=c(1:2, 4, 6)))


## Example 3
t2 <- fdt(rnorm(n=1e3,
                mean=10,
                sd=2),
          right=TRUE)

t2x <- latex.fdt(t2,
                 algtable='\\centering',
                 caption='Frequency distribution table 2',
                 label='tbl-2',
                 pattern='%.1f')

t2x


## Example 4
t3 <- fdt(rnorm(n=1e3,
                mean=10,
                sd=2))

t3x <- latex.fdt(t3,
                 algtable='\\flushright',
                 caption='Frequency distribution table 3',
                 label='tbl-3',
                 pattern='%.1e')

t3x



