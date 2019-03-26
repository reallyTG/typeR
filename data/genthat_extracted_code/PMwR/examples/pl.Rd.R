library(PMwR)


### Name: pl
### Title: Profit and Loss
### Aliases: pl .pl pl.data.frame pl.default pl.journal pl.pl print.pl
###   as.data.frame.pl

### ** Examples

J <- journal(timestamp = c(  1,   2,   3),
             amount    = c(  1,   1,  -2),
             price     = c(100, 102, 101))
pl(J)
pl(c(1, 1, -2), c(100,102, 101))  ## without a 'journal'


J <- journal(timestamp  = c(  1,   2,   3,   1,   2,   3),
             amount     = c(  1,   1,  -2,   1,   1,  -2),
             price      = c(100, 102, 101, 100, 102, 105),
             instrument = c(rep("Bond A", 3), rep("Bond B", 3)))

pl(J)
## Bond A
##   P/L total       0
##   average buy   101
##   average sell  101
##   cum. volume     4
##
## Bond B
##   P/L total       8
##   average buy   101
##   average sell  105
##   cum. volume     4
##
## 'P/L total' is in units of instrument;
## 'volume' is sum of /absolute/ amounts.

as.data.frame(pl(J))
##        pl buy sell volume
## Bond A  0 101  101      4
## Bond B  8 101  105      4

pl(pl(J))  ## P/L as a numeric vector




## Example for 'vprice'
instrument  <- c(rep("Bond A", 2), rep("Bond B", 2))
amount <- c(1, -2, 2, -1)
price <- c(100, 101, 100, 105)

## ... no p/l because positions not closed:
pl(amount, price, instrument = instrument, do.warn = FALSE)

## ... but with vprice specified, p/l is computed:
pl(amount, price, instrument = instrument,
   vprice = c("Bond A" = 103, "Bond B" = 100))

### ... and is, except for volume, the same as here:
instrument  <- c(rep("Bond A", 3), rep("Bond B", 3))
amount <- c(1, -2, 1, 2, -1, -1)
price <- c(100, 101, 103, 100, 105, 100)
pl(amount, price, instrument = instrument)



## p/l over time: example for 'along.timestamp' and 'vprice'
j <- journal(amount = c(1, -1),
             price = c(100, 101),
             timestamp  = as.Date(c("2017-07-05", "2017-07-06")))
pl(j)

pl(j,
   along.timestamp = TRUE)

pl(j,
   along.timestamp = seq(from = as.Date("2017-07-04"),
                         to = as.Date("2017-07-07"),
                         by = "1 day"),
   vprice = 101:104)



## Example for 'multiplier'
jnl <- read.table(text =
"instrument, price, amount
 FGBL MAR 16, 165.20,  1
 FGBL MAR 16, 165.37, -1
 FGBL JUN 16, 164.12,  1
 FGBL JUN 16, 164.13, -1
 FESX JUN 16,   2910,  5
 FESX JUN 16,   2905, -5",
header = TRUE, stringsAsFactors = FALSE, sep = ",")


jnl <- as.journal(jnl)
pl(jnl,  multiplier.regexp = TRUE, ## regexp matching is case sensitive
   multiplier = c("FGBL" = 1000, "FESX" = 10))



## use package 'crayon'
## Not run: 
##D ## on Windows, you may also need 'options(crayon.enabled = TRUE)'
##D options(PMwR.use.crayon = FALSE)
##D pl(amount = c(1, -1), price = c(1, 2))
##D options(PMwR.use.crayon = TRUE)
##D pl(amount = c(1, -1), price = c(1, 2))
## End(Not run)




