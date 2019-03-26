library(Hmisc)


### Name: rcspline.eval
### Title: Restricted Cubic Spline Design Matrix
### Aliases: rcspline.eval
### Keywords: regression smooth

### ** Examples

x <- 1:100
rcspline.eval(x, nk=4, inclx=TRUE)
#lrm.fit(rcspline.eval(age,nk=4,inclx=TRUE), death)
x <- 1:1000
attributes(rcspline.eval(x))
x <- c(rep(0, 744),rep(1,6), rep(2,4), rep(3,10),rep(4,2),rep(6,6),
  rep(7,3),rep(8,2),rep(9,4),rep(10,2),rep(11,9),rep(12,10),rep(13,13),
  rep(14,5),rep(15,5),rep(16,10),rep(17,6),rep(18,3),rep(19,11),rep(20,16),
  rep(21,6),rep(22,16),rep(23,17), 24, rep(25,8), rep(26,6),rep(27,3),
  rep(28,7),rep(29,9),rep(30,10),rep(31,4),rep(32,4),rep(33,6),rep(34,6),
  rep(35,4), rep(36,5), rep(38,6), 39, 39, 40, 40, 40, 41, 43, 44, 45)
attributes(rcspline.eval(x, nk=3))
attributes(rcspline.eval(x, nk=5))
u <- c(rep(0,30), 1:4, rep(5,30))
attributes(rcspline.eval(u))



