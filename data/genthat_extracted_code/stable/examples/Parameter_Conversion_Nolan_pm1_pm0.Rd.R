library(stable)


### Name: Parameter_Conversion_Nolan_pm1_pm0
### Title: Easy conversion of parameters between stabledist and stable
### Aliases: Parameter_Conversion_Nolan_pm1_pm0 pm0_to_pm1 pm1_to_pm0

### ** Examples

q <- -1
# nolan pm=1 parameters:
a1 <-  1.3
b1 <-  -0.4
c1 <-  2
d1 <-  0.75
# Convert to nolan pm=0 parameters:
pm0 <- pm1_to_pm0(a1,b1,c1,d1)
a0 <- pm0$a0
b0 <- pm0$b0
c0 <- pm0$c0
d0 <- pm0$d0
# check:
stabledist::pstable(q, alpha=a1, beta=b1 , gamma=c1 , delta=d1, pm=1)
#> [1] 0.1965513
# only change delta=d0 for pm=0
stabledist::pstable(q, alpha=a1, beta=b1 , gamma=c1 , delta=d0, pm=0)
stabledist::pstable(q, alpha=a0, beta=b0 , gamma=c0 , delta=d0, pm=0)
#> [1] 0.1965513
stabledist::dstable(q, alpha=a1, beta=b1 , gamma=c1 , delta=d1, pm=1)
#> [1] 0.0572133
# only change delta=d0 for pm=0
stabledist::dstable(q, alpha=a1, beta=b1 , gamma=c1 , delta=d0, pm=0)
stabledist::dstable(q, alpha=a0, beta=b0 , gamma=c0 , delta=d0, pm=0)
#> [1] 0.0572133



