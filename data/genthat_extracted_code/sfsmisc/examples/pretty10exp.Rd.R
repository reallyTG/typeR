library(sfsmisc)


### Name: pretty10exp
### Title: Nice 10 ** k Label Expressions
### Aliases: pretty10exp
### Keywords: dplot

### ** Examples

pretty10exp(-1:3 * 1000)
pretty10exp(-1:3 * 1000, drop.1 = TRUE)
pretty10exp(c(1,2,5,10,20,50,100,200) * 1e3)
pretty10exp(c(1,2,5,10,20,50,100,200) * 1e3, drop.1 = TRUE)

set.seed(17); lx <- rlnorm(10, m=8, s=6)
pretty10exp(lx, digits = 3)
pretty10exp(lx, digits = 3, sub10 = 2)

unlist(pretty10exp(lx, digits = 3, lab.type="latex"))
unlist(pretty10exp(lx, digits = 3, lab.type="latex",
                   lab.sep="times", sub10=2))

## Don't show: 
stopifnot(identical(pretty10exp(numeric(0)), expression()))
## End(Don't show)
ax <- 10^(-6:0) - 2e-16
pretty10exp(ax, drop.1=TRUE) # nice for plotting
pretty10exp(ax, drop.1=TRUE, sub10=TRUE)
pretty10exp(ax, drop.1=TRUE, sub10=c(-2,2))

## in sfsmisc version <= 1.0-16, no 'digits',
## i.e., implicitly had  digits := #{double precision digits} ==
(dig. <- .Machine$double.digits * log10(2)) # 15.95
pretty10exp(ax, drop.1=TRUE, digits= dig.)  # ''ugly''



