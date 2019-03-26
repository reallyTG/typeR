library(Rmpfr)


### Name: Bessel_mpfr
### Title: Bessel functions of Integer Order in multiple precisions
### Aliases: Bessel_mpfr Ai j0 j1 jn y0 y1 yn
### Keywords: math

### ** Examples

x <- (0:100)/8 # (have exact binary representation)
stopifnot(  all.equal(besselY(x, 0), bY0 <- y0(x))
          , all.equal(besselJ(x, 1), bJ1 <- j1(x))
          , all.equal(yn(0,x), bY0)
          , all.equal(jn(1,x), bJ1)
         )

if(mpfrVersion() >= "3.0.0") { ## Ai() not available previously
  print( aix <- Ai(x) )
  plot(x, aix, log="y", type="l", col=2)
  stopifnot(
    all.equal(Ai (0) , 1/(3^(2/3) * gamma(2/3)))
    , # see http://dlmf.nist.gov/9.2.ii
    all.equal(Ai(100), mpfr("2.6344821520881844895505525695264981561e-291"), tol=1e-37)
  )
  two3rd <- 2/mpfr(3, 144)
  print( all.equal(Ai(0), 1/(3^two3rd * gamma(two3rd)), tol=0) ) # 1.7e-40
  if(Rmpfr:::doExtras()) { # slowish:
     system.time(ai1k <- Ai(1000)) # 1.4 sec (on 2017 lynne)
     stopifnot(all.equal(log10(ai1k),
                         -9157.031193409585185582, tol=1e-16))
  }
} # ver >= 3.0



