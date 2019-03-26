library(NTS)


### Name: g_cfar1
### Title: Generate a CFAR(1) Process
### Aliases: g_cfar1

### ** Examples

phi_func= function(x)
{
 	return(dnorm(x,mean=0,sd=0.1))
}
y=g_cfar1(1000,5,phi_func)



