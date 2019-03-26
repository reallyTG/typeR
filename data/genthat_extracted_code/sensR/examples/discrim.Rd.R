library(sensR)


### Name: discrim
### Title: Sensory discrimination analysis
### Aliases: discrim print.discrim
### Keywords: models

### ** Examples

## Running the simple discrimination (difference) tests:
discrim(10, 15, method = "twoAFC")
discrim(10, 15, method = "threeAFC", statistic = "likelihood")
discrim(10, 15, method = "tetrad", statistic = "likelihood")
discrim(10, 15, method = "duotrio", conf.level = 0.90)
discrim(10, 15, method = "triangle", statistic = "score")

# Example of double duotrio discrimination test from Bi (2001):
discrim(35, 100, method = "duotrio", double=TRUE, statistic = "exact")
# Critical value for a sample size of 100 and a guessing probability of 1/4:
findcr(100, p0=1/4) # 33


## plot the distributions of sensory intensity:
m1 <- discrim(10, 15, method = "twoAFC")
plot(m1)

## A similarity test where less than chance successes are obtained:
discrim(22, 75, method = "triangle", d.prime0 = 1, test = "similarity")
## Don't show: 
## Testing stability of results:
fm1 <- discrim(10, 15, method = "twoAFC")
fm2 <- discrim(10, 15, method = "threeAFC", statistic = "likelihood")
fm3 <- discrim(10, 15, method = "tetrad", statistic = "likelihood")
fm4 <- discrim(10, 15, method = "duotrio", conf.level = 0.90)
fm5 <- discrim(10, 15, method = "triangle", statistic = "score")
fm6 <- discrim(20, 75, method = "triangle", pd0 = .2, test = "similarity")

## str(fm1)
nm <- c("coefficients", "p.value")
mlist <- list(fm1, fm2, fm3, fm4, fm5, fm6)
x <- lapply(mlist, function(m) as.vector(unlist(m[nm])))
## xres := dput(x)
xres <- list(c(0.666666666666667, 0.333333333333333, 0.609140388347971,
0.121716123890037, 0.243432247780074, 0.473412265776244, 0.5,
0, 0, 0.881758896633119, 0.763517793266238, 1.67418186000377,
0.15087890625), c(0.666666666666667, 0.5, 1.11590231648908, 0.121716123890037,
0.182574185835055, 0.435915308196464, 0.415453723121119, 0.123180584681679,
0.280277592554894, 0.865219389059262, 0.797829083588893, 1.99667785632887,
0.00423459825376749), c(0.666666666666667, 0.5, 1.58778376949614,
0.121716123890037, 0.182574185835055, 0.419305544967608, 0.415453723121119,
0.123180584681679, 0.690727050515248, 0.865219389059262, 0.797829083588893,
2.41533835643047, 0.00423459825376749), c(0.666666666666667,
0.333333333333333, 1.51885152352487, 0.121716123890037, 0.243432247780074,
0.71586308378571, 0.5, 0, 0, 0.858336028357847, 0.716672056715693,
2.8242468406221, 0.15087890625), c(0.666666666666667, 0.5, 2.32136197974359,
0.121716123890037, 0.182574185835055, 0.651036422864387, 0.386865453268331,
0.0802981799024962, 0.782701393792843, 0.870121962915835, 0.805182944373752,
3.70692782369343, 0.00308494966027208), c(0.333333333333333,
0, 0, NA, NA, NA, 0.333333333333333, 0, 0, 0.381372720482923,
0.0720590807243847, 0.739487700025965, 0.000306144022107533))

for(i in 1:length(x)) stopifnot(isTRUE(all.equal(x[[1]], xres[[1]])))

stopifnot(findcr(100, p0=1/4) == 33,
          discrim(35, 100, method = "duotrio", double=TRUE, statistic = "exact")$p.value < 0.05)

## End(Don't show)



