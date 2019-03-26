library(Qtools)


### Name: KhmaladzeFormat
### Title: Khmaladze Test
### Aliases: KhmaladzeFormat

### ** Examples


data(barro, package = "quantreg")
eps <- 0.05
kt <- quantreg::KhmaladzeTest( y.net ~ lgdp2 + fse2 + gedy2 + Iy2 + gcony2, 
		data = barro, taus = seq(.05,.95,by = .01), trim = c(eps, 1 - eps))
class(kt)
KhmaladzeFormat(kt, epsilon = eps)




