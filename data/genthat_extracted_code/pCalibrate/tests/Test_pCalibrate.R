
library("pCalibrate")

p1 <- c(10^{-15}, 10^{-10}, 10^{-5}, 10^{-4}, 10^{-3})
p2 <- exp(seq(from=log(0.005), to=0, by=0.2))
p <- c(p1, p2)

pCalibrate(p, alternative="noninformative")
pCalibrate(p, alternative="informative")

pCalibrate(p, alternative="noninformative", transform="log")
pCalibrate(p, alternative="informative", transform="log2")

zCalibrate(p, type="one.sided", alternative="simple")
zCalibrate(p, type="one.sided", alternative="normal")
zCalibrate(p, type="one.sided", alternative="local")

zCalibrate(p, type="two.sided", alternative="normal")
zCalibrate(p, type="two.sided", alternative="simple")
zCalibrate(p, type="two.sided", alternative="local")

zCalibrate(p, type="one.sided", alternative="simple", transform="log")
zCalibrate(p, type="two.sided", alternative="normal", transform="log2")

zCalibrate(p=c(0.001, 0.01), type="one.sided", alternative="normal")
zCalibrate(p=c(0.001, 0.01), type="two.sided", alternative="normal")
zCalibrate(p=c(0.001, 0.01), type="one.sided", alternative="local")
zCalibrate(p=c(0.001, 0.01), type="two.sided", alternative="local")


###########################################################
n <- 20
 
  tCalibrate(p, n=n, type="one.sided", alternative="simple")
  tCalibrate(p, n=n, type="two.sided", alternative="simple")
  tCalibrate(p, n=n, type="two.sided", alternative="normal")

  tCalibrate(p, n=n, type="one.sided", alternative="simple", transform="log2")
  tCalibrate(p, n=n, type="two.sided", alternative="simple", transform="log10")


n <- c(5, 10, 20 ,50, 100, 1000)

 tCalibrate(p, n=n, type="two.sided", alternative="normal")
 tCalibrate(p, n=n, type="two.sided", alternative="simple")
 tCalibrate(p, n=n, type="two.sided", alternative="normal")

 tCalibrate(p=c(0.001,0.01), n=30, type="one.sided", alternative="normal")
 tCalibrate(p=c(0.001,0.01), n=30, type="two.sided", alternative="normal")

##############################################################
d <- 2
n <- c( 10, 20 ,50, 100)


 FCalibrate(p, n=n, d=d, alternative="simple")
 FCalibrate(p, n=n, d=d, alternative="chi.squared")

 FCalibrate(p, n=n, d=d, alternative="simple", intercept=FALSE)
 FCalibrate(p, n=n, d=d, alternative="chi.squared", intercept=FALSE)



d <- 10
n <- c(15, 20, 50 ,100)

 FCalibrate(p, n=n, d=d, alternative="simple")
 FCalibrate(p, n=n, d=d, alternative="chi.squared")
 
 FCalibrate(p, n=n, d=d, alternative="simple", transform ="log")
 FCalibrate(p, n=n, d=d, alternative="chi.squared", transform="log2")


#############################

n <- 50
d <- c(2, 5, 10, 20)

 FCalibrate(p, n=n, d=d, alternative="simple")
 FCalibrate(p, n=n, d=d, alternative="chi.squared")

#################

n <- 10
d <- 2

 FCalibrate(p, n=n, d=d, alternative="simple")
 FCalibrate(p, n=n, d=d, alternative="chi.squared")

 FCalibrate(p, n=n, d=d, alternative="simple", intercept=FALSE)
 FCalibrate(p, n=n, d=d, alternative="chi.squared", intercept=FALSE)
 

#################################################################

df <- c(2,5,10,20)

 LRCalibrate(p, df=df, alternative="simple")
 LRCalibrate(p, df=df, alternative="gamma")


#####################################################################

# p <- 0.01
bf <- c(0.0744, 0.0725)
formatBF(bf)

BF2pp(BF=bf, prior.prob = 0.5)


############################################

# Do the functions work for p=1?

zCalibrate(p=1, type="one.sided", alternative="simple")
zCalibrate(p=1, type="two.sided", alternative="normal")
zCalibrate(p=1, type="two.sided", alternative="simple")
zCalibrate(p=1, type="two.sided", alternative="local")


FCalibrate(p=1, n=20, d=5, alternative = "simple")
FCalibrate(p=1, n=20, d=2, alternative = "chi.squared")

tCalibrate(p=1, n=20, type="two.sided", alternative="normal")
tCalibrate(p=1, n=20, type="two.sided", alternative="simple")
tCalibrate(p=1, n=20, type="two.sided", alternative="normal")


LRCalibrate(p=1, df=c(2, 5, 10), alternative="simple")
LRCalibrate(p=1, df=2, alternative="gamma")

###################################################

# comparison with results in Berger & Sellke (1987)

p <- c(0.1, 0.05, 0.01, 0.001)

# symmetric distributions
bf.sim <- zCalibrate(p=p, type="two.sided", alternative="simple")
BF2pp(BF=bf.sim)

# unimodal symmetric distributions
bf.loc <- zCalibrate(p=p, type="two.sided", alternative="local")
BF2pp(BF=bf.loc)

# normal distributions
bf.nor <- zCalibrate(p=p, type="two.sided", alternative="normal")
BF2pp(BF=bf.nor)

############################

tab <- matrix(c(1,15,5,10), nrow=2, byrow=TRUE)
# two-sided alternatives
twoby2Calibrate(x=tab, type="two.sided", alternative="simple")$minBF
twoby2Calibrate(x=tab, type="two.sided", alternative="normal")$minBF
twoby2Calibrate(x=tab, type="two.sided", alternative="normal")$p

# one-sided alternatives
twoby2Calibrate(x=tab, type="one.sided", direction="greater")$minBF
twoby2Calibrate(x=tab, type="one.sided", direction="greater")$p
twoby2Calibrate(x=tab, type="one.sided", direction="less")$minBF
twoby2Calibrate(x=tab, type="one.sided", direction="less")$p
