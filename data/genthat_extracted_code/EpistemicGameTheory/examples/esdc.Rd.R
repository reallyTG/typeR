library(EpistemicGameTheory)


### Name: esdc
### Title: Eliminating strictly dominated choices
### Aliases: esdc

### ** Examples

a=4
b=4
pay.A=matrix(c(0,3,2,1,4,0,2,1,4,3,0,1,4,3,2,0),4,4)
ch.A=c("Blue","Green","Red","Yellow")
pay.B=matrix(c(5,4,4,4,3,5,3,3,2,2,5,2,1,1,1,5),4,4)
ch.B=c("Blue","Green","Red","Yellow")
iter=5
esdc(a,b,pay.A,ch.A,pay.B,ch.B,iter)



