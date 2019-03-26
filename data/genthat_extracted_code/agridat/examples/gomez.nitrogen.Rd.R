library(agridat)


### Name: gomez.nitrogen
### Title: Soil nitrogen at three times for eight fertilizer treatments
### Aliases: gomez.nitrogen
### Keywords: datasets

### ** Examples


data(gomez.nitrogen)
dat <- gomez.nitrogen

# Note the depletion of nitrogen over time (stage)
if(require(HH)){
  interaction2wt(nitro ~ rep/trt + trt*stage, data=dat,
                 x.between=0, y.between=0,
                 main="gomez.nitrogen")
  
  # Just the fertilizer profiles
  with(dat, interaction.plot(stage, trt, nitro,
                             col=1:4, lty=1:3, main="gomez.nitrogen",
                             xlab="Soil nitrogen at three times for each treatment"))
}

# Gomez table 6.16
m1 <- aov(nitro ~ Error(rep/trt) + trt*stage, data=dat)
summary(m1)

# Gomez table 6.18
# Treatment                    1 2 3 4 5 6 7 8
cont <- cbind("T7 vs others" = c( 1, 1, 1, 1, 1, 1,-7, 1),
              "T8 vs others"  = c( 1, 1, 1, 1, 1, 1, 0,-6),
              "T2,T5 vs others"   = c(-1, 2,-1,-1, 2,-1, 0, 0),
              "T2 vs T5"       = c( 0, 1, 0, 0,-1, 0, 0, 0))
contrasts(dat$trt) <- cont
contrasts(dat$trt)

m2 <- aov(nitro ~ Error(rep/trt) + trt*stage, data=dat)
summary(m2, expand.split=FALSE,
        split=list(trt=list(
                     "T7 vs others"=1,
                     "T8 vs others"=2,
                     "T2,T5 vs others"=3,
                     "T2 vs T5"=4,
                     rest=c(5,6,7)),
          "trt:stage"=list(
            "(T7 vs others):P"=c(1,8),
            "(T8 vs others):P"=c(2,9),
            "(T2,T5 vs others):P"=c(3,10),
            "(T2 vs T5):P"=c(4,11),
            "rest:P"=c(5,6,7,12,13,14))
          ))




