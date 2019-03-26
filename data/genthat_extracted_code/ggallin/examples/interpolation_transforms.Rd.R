library(ggallin)


### Name: interp_trans
### Title: Interpolation based scale transforms.
### Aliases: interp_trans warp_trans
### Keywords: plotting

### ** Examples

set.seed(1234)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_x_continuous(trans=interp_trans(x=seq(-10,10,by=1),y=cumsum(runif(21))))

set.seed(1234)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_x_continuous(trans=warp_trans(x=seq(-10,10,by=1),w=runif(21)))

# equivalently:
set.seed(1234)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_x_continuous(trans=warp_trans(data=data.frame(x=seq(-10,10,by=1),w=runif(21))))

# this is like trans_sqrt:
set.seed(1234)
myx <- seq(0,5,by=0.01)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_y_continuous(trans=interp_trans(x=myx,y=sqrt(myx)))




