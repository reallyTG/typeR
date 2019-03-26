library(updog)


### Name: mupdog
### Title: Multi-SNP updog.
### Aliases: mupdog

### ** Examples

## No test: 
data(uitdewilligen)
mout <- mupdog(refmat = uitdewilligen$refmat,
               sizemat = uitdewilligen$sizemat,
               ploidy = uitdewilligen$ploidy,
               verbose = FALSE,
               control = list(obj_tol = 10^-4))

## Summaries of output
plot(mout, 4)
hist(mout$bias)
hist(mout$seq)
hist(mout$od)
hist(mout$inbreeding)
hist(mout$allele_freq)

## mupdog can correctly estimate ploidy to be 4
mout2 <- mupdog(refmat = uitdewilligen$refmat,
                sizemat = uitdewilligen$sizemat,
                ploidy = 2,
                verbose = FALSE,
                control = list(obj_tol = 10^-4))

mout6 <- mupdog(refmat = uitdewilligen$refmat,
                sizemat = uitdewilligen$sizemat,
                ploidy = 6,
                verbose = FALSE,
                control = list(obj_tol = 10^-4))

mout8 <- mupdog(refmat = uitdewilligen$refmat,
                sizemat = uitdewilligen$sizemat,
                ploidy = 8,
                verbose = FALSE,
                control = list(obj_tol = 10^-4))

y <- c(mout2$obj, mout$obj, mout6$obj, mout8$obj)
x <- seq(2, 8, by = 2)
plot(x, y, type = "l", xlab = "ploidy", ylab = "objective")
## End(No test)





