library(ipptoolbox)


### Name: statprops
### Title: Statistical properties of a BPA
### Aliases: dsaggwidth dsconf dsexpect dsvariance dsbelpl dssummary

### ** Examples

mu=dsstruct(c(10,12,1))
sigma=dsstruct(c(1,1.5,1))
x=dsadf('qnorm',1000,mu,sigma)
print("Sample of 1000 focal elements from a normal dist")
print("Mean:")
print(dsexpect(x))
print("Variance:")
print(dsvariance(x))
print("Median:")
print(dsconf(x,0.5))
print("Bel and Pl of x in [4,8]:")
print(dsbelpl(x,c(4,8)))
print("Aggregated width:")
print(dsaggwidth(x))
print("95 percent conf. level with 95 percent Wilks bounds")
print(dsconf(x,0.95,0.95))
print("Summary statistics")
print(dssummary(x))



