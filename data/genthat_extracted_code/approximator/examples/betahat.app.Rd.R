library(approximator)


### Name: betahat.app
### Title: Estimate for beta
### Aliases: betahat.app betahat.app.H
### Keywords: array

### ** Examples

data(toyapps)

 betahat.app(D1=D1.toy, subsets=subsets.toy, basis=basis.toy, hpa=hpa.toy, z=z.toy, use.Vinv=TRUE)

 H <- H.fun.app(D1=D1.toy, subsets=subsets.toy, basis=basis.toy,hpa=hpa.toy)
 V <- V.fun.app(D1=D1.toy, subsets=subsets.toy, hpa=hpa.toy)
 betahat.app.H(H=H,V=V,z=z.toy)




