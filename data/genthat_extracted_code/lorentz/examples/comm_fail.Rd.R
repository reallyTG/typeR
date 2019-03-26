library(lorentz)


### Name: comm_fail
### Title: Failure of commutativity and associativty using visual plots
### Aliases: comm_fail comm_fail1 comm_fail2 ass_fail ass_fail

### ** Examples


u <- as.3vel(c(0.4,0,0))
v <- seq(as.3vel(c(0.4,-0.2,0)), as.3vel(c(-0.3,0.9,0)),len=20)
w <- as.3vel(c(0.8,-0.4,0))

comm_fail1(u=u, v=v)
comm_fail2(u=u, v=v)
  ass_fail(u=u, v=v, w=w, bold=10)




