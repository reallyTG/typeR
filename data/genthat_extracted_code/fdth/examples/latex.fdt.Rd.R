library(fdth)


### Name: latex.fdt
### Title: LaTeX table of the frequency distribution table
### Aliases: latex.fdt latex.fdt_cat latex.fdt_cat.multiple
### Keywords: multivariate, table, latex, fdt

### ** Examples


library(fdth)

# +++++ Quantitative data

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

# +++++ Qualitative data

## Example 5
t4 <- fdt_cat(sample(LETTERS[1:3], 
                     replace=TRUE,
                     size=30))

t4x <- latex.fdt_cat(t4,
                     caption='Frequency distribution table 4',
                     label='tbl-4')
t4x

t5 <- fdt_cat(data.frame(c1=sample(LETTERS[1:3],
                                   replace=TRUE,
                                   size=10),
                         c2=sample(letters[4:5],
                                   replace=TRUE,
                                   size=10)))

caption <- c('Frequency distribution table 5',
             'Frequency distribution table 6')

t5x <- latex.fdt_cat.multiple(t5,
                              caption=caption,
                              algtable='\\flushleft')
t5x



