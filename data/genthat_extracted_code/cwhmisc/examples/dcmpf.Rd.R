library(cwhmisc)


### Name: dcm
### Title: Convert number for table columns, for equations
### Aliases: dc dcn mpf
### Keywords: arith

### ** Examples

  nn <- c(0, 1, 0.1, pi,2*pi,-30*pi)
  dc(nn,3)    # "0&0"     "1&0"     "0&100"   "3&142"   "6&283"   "-94&248"
  dcn(nn,3)   # "0&000"   "1&000"   "0&100"   "3&142"   "6&283"   "-94&248"
  mpf(pi,5); mpf(-pi,5)  # "+ 3.14159" "- 3.14159"  Note the space after the sign.

#### In example file 'T.Rnw':
##  <<echo=TRUE>>=
a <- -2; b <- -4; c <- 7
##  @ 
##  
##  The coefficients are: $a = \Sexpr{a}$, $b = \Sexpr{b}$, $c = \Sexpr{c}$.
##  

##  For the linear combination $$z = a + bx +cy$$ we thenhave
##   $$z = \Sexpr{sprintf(%.4f,a)} \Sexpr{mpf(b,3)} x \Sexpr{mpf(c,5)} y$$
#### end T.Rnw
###  Sweave: T.Rnw .. T.tex .. T.dvi




