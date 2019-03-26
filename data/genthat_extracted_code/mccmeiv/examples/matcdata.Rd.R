library(mccmeiv)


### Name: matcdata
### Title: A sample dataset representing matched case control data.
### Aliases: matcdata
### Keywords: Mismeasured Matched Cased Control Instrumental Dataset bias

### ** Examples

data(matcdata)
out1=with(matcdata,meivm4(y=y,sv=sv,xs=xs,w=w,z=z,alpha=0.1))



