library(cwhmisc)


### Name: r2B
### Title: Conversion of real to string and rounding, in given base
### Aliases: roundB r2B r2Be strB2r strB2i
### Keywords: character

### ** Examples

  x <- c(0,-0.0012345, 1.5234, 543, 8123456,NA,Inf,-Inf,NaN,1,pi)
  y <- c( 0, 1, pi*10^c(-27,-8,0, 8) )
# "+3.1e27" "    NA " "   NaN " "   Inf   )
r2B(x,,space=10,lead=" ",plus="",rnd=3)$s
# "          0 " "-      0.001" "       1.523" "     543.000"
# " 8123456.000" "          NA" "         Inf" "        -Inf"
# "         NaN" "       1.000" "       3.142"
  r2B(x,16,space=10,lead=" ")$s
# "        0 " "-        0" "         2" "       21F"
# "    7BF440" "        NA" "       Inf""      -Inf"
# "       NaN" "         1" "         3"
  r2B( x, 60, 4 )$s
  r2Be( y,10,7)$s
# "     0 " "+1.0000" "+3.e-27" "+3.1e-8" "+3.1416" "+3.14e8"
# "+3.1e27" "    NA " "   NaN " "   Inf "
  strB2r("-    9167.8  4",10)
  strB2r("B00z3",15 )  # 8353125
  (ii <- r2B( 8353125, 32, 4 )$s) # "7UTB5.0000"
  strB2r( ii, 32)  # 8353125
  roundB(c(0.4,0.3),2,16) # 0.39999390 0.30000305



