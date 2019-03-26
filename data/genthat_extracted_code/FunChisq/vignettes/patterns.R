## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
require(FunChisq)
f1 <- matrix(c(5,0,0,0,0,7,0,4,0), nrow=3)
f1
plot_table(f1, ylab="X (row)", xlab="Y (column)", 
           main="f1: significant perfect function")
fun.chisq.test(f1)

## ------------------------------------------------------------------------
f2 <- matrix(c(7,0,3,0,6,0), nrow=3)
f2
plot_table(f2, col="salmon", ylab="X (row)", xlab="Y (column)",
           main="f2: sigificant perfect\nmany-to-one function")
fun.chisq.test(f2)

## ------------------------------------------------------------------------
f3 <- matrix(c(5,10,0,0,0,1), nrow=3)
f3
plot_table(f3, col="deepskyblue4", ylab="X (row)", xlab="Y (column)",
           main="f3: insigificant perfect function")
fun.chisq.test(f3)

## ------------------------------------------------------------------------
f4 <- matrix(c(5,4,7,0,0,0,0,0,0), nrow=3)
f4
plot_table(f4, col="brown", ylab="X (row)", xlab="Y (column)",
           main="f4: insignificant\nperfect constant function")
fun.chisq.test(f4)

## ------------------------------------------------------------------------
p1 <- matrix(c(5,1,5,1,5,1,1,0,1), nrow=3)
p1
plot_table(p1, ylab="X (row)", xlab="Y (column)", 
           main="p1: significant function pattern")
fun.chisq.test(p1)

## ------------------------------------------------------------------------
p2=matrix(c(5,1,1,1,5,0,5,1,1), nrow=3)
p2
plot_table(p2, col="red3", ylab="X (row)", xlab="Y (column)",
           main="p2: insignificant\nfunction pattern")
fun.chisq.test(p2)

## ------------------------------------------------------------------------
p3=matrix(c(5,1,1,1,5,0,9,1,1), nrow=3)
p3
plot_table(p3, col="orange", ylab="X (row)", xlab="Y (column)",
           main="p3: significant function pattern")
fun.chisq.test(p3)

## ------------------------------------------------------------------------
p4=p1*sum(p3)/sum(p1)
p4
plot_table(p4, col="purple", ylab="X (row)", xlab="Y (column)",
           main="p4: significant function pattern")
fun.chisq.test(p4)

