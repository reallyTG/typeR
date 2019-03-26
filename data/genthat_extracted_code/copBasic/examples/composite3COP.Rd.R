library(copBasic)


### Name: composite3COP
### Title: (Extended) Composition of Two Copulas with Four Compositing
###   Parameters
### Aliases: composite3COP
### Keywords: copula composition copula composition (four compositing
###   parameters)

### ** Examples

## Not run: 
##D para <- list(cop1=PLACKETTcop, cop2=N4212cop,
##D              para1=10^(runif(1,min=-5,max=5)), para2=runif(1,min=1,max=100),
##D              alpha=runif(1), beta=runif(1), kappa=runif(1), gamma=runif(1))
##D txts <- c("Alpha=",    round(para$alpha,    digits=4),
##D           "; Beta=",   round(para$beta,     digits=4),
##D           "; Kappa=",  round(para$kappa,    digits=4),
##D           "; Gamma=",  round(para$gamma,    digits=4),
##D           "; Theta1=", round(para$para1[1], digits=5),
##D           "; Theta2=", round(para$para2[1], digits=2))
##D layout(matrix(1:2,byrow=TRUE))
##D D <- simCOP(n=300, cop=composite3COP, para=para, cex=0.5, col=rgb(0,0,0,0.2), pch=16)
##D mtext(paste(txts,collapse=""))
##D 
##D f <- round(runif(1),digits=2)
##D ftxt <- c("Sectionals (thick) and derivatives (thin) at f=",f," nonexceedance prob.")
##D segments(f,0,f,1, col=3, lwd=2); segments(0,f,1,f, col=2, lwd=2)
##D t <- sectionCOP(f,cop=composite3COP,para=para, col=3, lwd=4)
##D t <- sectionCOP(f,cop=composite3COP,para=para, dercop=TRUE, ploton=FALSE,col=3)
##D t <- sectionCOP(f,cop=composite3COP,para=para, wrtV=TRUE,   ploton=FALSE,col=2,lwd=4)
##D t <- sectionCOP(f,cop=composite3COP,para=para, wrtV=TRUE,   ploton=FALSE,col=2,
##D                   dercop=TRUE)
##D mtext(paste(ftxt, collapse=""))#
## End(Not run)



