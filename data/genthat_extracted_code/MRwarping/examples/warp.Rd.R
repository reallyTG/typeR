library(MRwarping)


### Name: warp
### Title: Evaluates a composition of warplets.
### Aliases: warp

### ** Examples

t = seq(0,10,length.out=1000)
tau.t = warp(c(5,2),c(0.6,0.4),c(2,1.5),c(3,2),t)

## The function is currently defined as
warp =
function(A,Lambda,R1,R2,x)
{
Wx = x
for (i in 1:length(A))
    	{
	warp = comp(A[i],Lambda[i],R1[i],R2[i],Wx)
	Wx = warp
	}
return(Wx)
}



