library(cwhmisc)


### Name: frac
### Title: Fractional part of number, continuous fractions
### Aliases: contfrac evalcfr toCFrac toCFrac2
### Keywords: arith

### ** Examples

(pcf <- contfrac(pi)) # 3, 7, 15, 1, 292, 1, 1, 1, 2, 1, 3, 1, 14, 2, (1)
## last integer incorrect due to rounding errors
evalcfr(pcf)-pi # 0
## To see the first approximants of pi, all of them famous:
for(ii in 1:15) {x<-toCFrac(pi,ii)
print(paste(ii,":",x$num,"/",x$den,"="))
print(paste(formatFix(x$num/x$den,15),", error = ",x$num/x$den-pi))}
# Note how the approximations taper off after depth 5:
# 10 3959189 / 1260249 =  3.141592653515298 -7.44955208631382e-11"
## Same, all at once:
F <- toCFrac2(pi,5)  # $num  3  22 333 355  $den  1   7 106 113
toCFrac( pi, 10 )  #  



