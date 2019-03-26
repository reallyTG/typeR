library(copBasic)


### Name: wolfCOP
### Title: The Schweizer and Wolff Sigma of a Copula
### Aliases: wolfCOP
### Keywords: copula (characteristics) copula (properties)

### ** Examples

## Not run: 
##D wolfCOP(cop=PSP) # 0.4784176
## End(Not run)

## Not run: 
##D n <- 1000; UV <- simCOP(n=n, cop=N4212cop, para=7.53, graphics=FALSE)
##D wolfCOP(cop=N4212cop, para=7.53) # 0.9884666 (theoretical)
##D wolfCOP(para=UV, as.sample=TRUE) # 0.9884174 (sample)
## End(Not run)

## Not run: 
##D # Redo D from Note section above
##D para <- list(cop1=PLcop, cop2=PLcop, para1=0.145, para2=21.9,
##D              alpha=0.81,       beta=0.22)
##D D <- simCOP(n=300, cop=composite2COP, para=para,
##D             cex=0.5, col=rgb(0,0,0,0.2), pch=16)
##D 
##D the.grid <- EMPIRgrid(para=D)
##D the.persp <- persp(the.grid$empcop, theta=-25, phi=20, shade=TRUE,
##D                    xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D empcop <- EMPIRcopdf(para=D) # data.frame of all points
##D points(trans3d(empcop$u, empcop$v, empcop$empcop, the.persp),  cex=0.7,
##D        col=rgb(0,1-sqrt(empcop$empcop),1,sqrt(empcop$empcop)), pch=16)
##D points(trans3d(empcop$u, empcop$v, empcop$empcop, the.persp),
##D        col=PQD$local.PQD+1, pch=1)
##D 
##D layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE), respect = TRUE)
##D PQD.NQD.cop <- gridCOP(cop=composite2COP, para=para)
##D Pi <- gridCOP(cop=P)
##D RHO <- PQD.NQD.cop - Pi; SIG <- abs(RHO)
##D the.persp <- persp(PQD.NQD.cop, theta=-25, phi=20, shade=TRUE, cex=0.5,
##D                xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D mtext("The Copula that has local PQD and NQD", cex=0.5)
##D the.persp <- persp(Pi, theta=-25, phi=20, shade=TRUE, cex=0.5,
##D                xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D mtext("Independence (Pi)", cex=0.5)
##D the.persp <- persp(RHO, theta=-25, phi=20, shade=TRUE, cex=0.5,
##D                xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D mtext("Copula delta: Integrand of Spearman Rho", cex=0.5)
##D the.persp <- persp(SIG, theta=-25, phi=20, shade=TRUE, cex=0.5,
##D                xlab="U VARIABLE", ylab="V VARIABLE", zlab="COPULA C(u,v)")
##D mtext("abs(Copula delta): Integrand of Schweizer-Wolff Sigma", cex=0.5)# 
## End(Not run)



