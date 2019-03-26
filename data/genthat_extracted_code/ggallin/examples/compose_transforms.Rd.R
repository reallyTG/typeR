library(ggallin)


### Name: %of%
### Title: Composition of scale transforms.
### Aliases: %of%
### Keywords: plotting

### ** Examples

set.seed(1234)
# compose transformatins with %of%:
ggplot(data.frame(x=rnorm(100),y=exp(rnorm(100,mean=-2,sd=4))),aes(x=x,y=y)) + 
  geom_point() + 
  scale_y_continuous(trans=scales::reverse_trans() %of% scales::log10_trans())




