library(ipptoolbox)


### Name: bpafromdist
### Title: Construct pboxes
### Aliases: dsadf dsodf

### ** Examples

print("Precise and imprecise parameters for qnorm")
mu=0; sigma=1
mu2=dsstruct(c(-0.5,0.5,1)); sigma2=dsstruct(c(1,2,1))
print("Pbox (distribution) of qnorm with precise parameters:")
pbox1=dsadf(qnorm,20,mu,sigma)
dscdf(pbox1)

print("Pbox of qnorm with precise parameters, outer discretization:")
pbox2=dsodf(qnorm,20,mu,sigma)
dscdf(pbox2)

print("Pbox of qnorm with imprecise mu, precise sigma:")
pbox3=dsodf(qnorm,1000,mu2,sigma)
dscdf(pbox3)

print("Pbox of qnorm with imprecise parameters:")
pbox4=dsodf(qnorm,1000,mu2,sigma2)
dscdf(pbox4)



