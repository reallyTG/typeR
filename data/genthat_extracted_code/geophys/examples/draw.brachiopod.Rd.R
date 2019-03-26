library(geophys)


### Name: draw.brachiopod
### Title: Draw Brachiopod
### Aliases: draw.brachiopod
### Keywords: misc

### ** Examples


gb = get.brachiopod()

draw.brachiopod(gb)



BB = get.brachiopod()
phi0=0
phi =   rep(phi0, 6)
shears = seq(from=0, to=1.5, length=6)
shearmats = list()
for(i in 1:length(shears))
{
 shr = shears[i]
  shearmats[[i]] = matrix(c(1, shr, 0,  1), ncol=2)
}

phi0=0
phi =   rep(phi0, 6)
phi=runif(6, 0, 90)
shears = rep(0, 6)


 for(i in 1:length(phi))
        {
          shr = shears[i]
          shearmats[[i]] = matrix(c(1, shr, 0,  1), ncol=2)
        }
      

x =  rep(c(25,75), times=3)

y = as.vector( t(matrix( rep(c( 75, 50,25 ), times=2) , ncol=2)) )


siz  = rep(30, 6)


plot(c(0, 100), c(0, 100), asp=1, type='n', ann=FALSE, axes=FALSE)
for(i in 1:length(x))
  {
    cosp=cos(phi[i]*pi/180)
    sinp=sin(phi[i]*pi/180)
#######  make a rotation matrix
#### rmat=matrix(c(cosp,-sinp, x, sinp, cosp, y), ncol=2)

    
 ####
    rmat1=matrix(c(cosp,-sinp, sinp, cosp),  ncol=2)
    

    total =  rmat1 
    
    rmat= rbind( total, c(x[i],y[i]) )
    
    n = length(BB[,1])
    
    RACK1 = cbind(siz[i]*BB[,1:2], rep(1,n)) 

   draw.brachiopod(RACK1)


  }





