library(NTS)


### Name: p_cfar_part
### Title: Partial Curve Prediction of CFAR Processes
### Aliases: p_cfar_part

### ** Examples

phi_func= function(x)
{
 	return(dnorm(x,mean=0,sd=0.1))
}
y=g_cfar1(100,5,phi_func)
f_grid=y$cfar
index=seq(1,1001,by=10)
f=f_grid[,index]
est=est_cfar(f,1)
pred=p_cfar_part(est,f,0)



