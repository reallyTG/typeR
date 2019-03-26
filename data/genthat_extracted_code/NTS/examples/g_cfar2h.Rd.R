library(NTS)


### Name: g_cfar2h
### Title: Generate a CFAR(2) Process with Heteroscedasticity and Irregular
###   Observation Locations
### Aliases: g_cfar2h

### ** Examples

phi_func1= function(x){
return(0.5*x^2+0.5*x+0.13)
}
phi_func2= function(x){
return(0.7*x^4-0.1*x^3-0.15*x)
}
y=g_cfar2h(200,1000,1,40,5,phi_func1=phi_func1,phi_func2=phi_func2)



