library(walrus)


### Name: rttestPS
### Title: Robust Paired Samples T-Test
### Aliases: rttestPS

### ** Examples

data(anorexia, package='MASS')
anorexiaFT <- subset(anorexia, subset = Treat == "FT")

rttestPS(anorexiaFT,
         pairs = list(
             list(i1 = 'Prewt', i2 = 'Postwt')))

#
#  ROBUST PAIRED SAMPLES T-TEST
#
#  Robust Paired Samples T-Test
#  ---------------------------------------------
#                       t        df      p
#  ---------------------------------------------
#    Prewt    Postwt    -3.83    10.0    0.003
#  ---------------------------------------------
#




