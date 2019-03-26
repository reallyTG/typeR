library(bigleaf)


### Name: Gb.Choudhury
### Title: Boundary Layer Conductance according to Choudhury & Monteith
###   1988
### Aliases: Gb.Choudhury

### ** Examples

## bulk canopy boundary layer resistance for a closed canopy (LAI=5) 
## with large leaves (leafwdith=0.1)            
df <- data.frame(Tair=25,pressure=100,wind=c(3,4,5),ustar=c(0.5,0.6,0.65),H=c(200,230,250))    
Gb.Choudhury(data=df,leafwidth=0.1,LAI=5,zh=25,d=17.5,zr=40)

## same conditions, but smaller leaves (leafwidth=0.01)
Gb.Choudhury(data=df,leafwidth=0.01,LAI=5,zh=25,d=17.5,zr=40) 




