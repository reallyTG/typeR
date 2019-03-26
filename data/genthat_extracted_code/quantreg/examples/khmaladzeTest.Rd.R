library(quantreg)


### Name: KhmaladzeTest
### Title: Tests of Location and Location Scale Shift Hypotheses for Linear
###   Models
### Aliases: KhmaladzeTest khmaladzize qdensity
### Keywords: htest

### ** Examples

data(barro)
KhmaladzeTest( y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
		data = barro, taus = seq(.05,.95,by = .01))



