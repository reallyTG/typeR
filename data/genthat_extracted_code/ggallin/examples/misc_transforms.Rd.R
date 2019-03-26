library(ggallin)


### Name: ssqrt_trans
### Title: Various scale transforms.
### Aliases: ssqrt_trans pseudolog10_trans
### Keywords: datasets plotting

### ** Examples

set.seed(1234)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_x_continuous(trans=ssqrt_trans)

set.seed(1234)
ggplot(data.frame(x=rnorm(100),y=runif(100)),aes(x=x,y=y)) + 
  geom_point() + 
  scale_x_continuous(trans=pseudolog10_trans)




