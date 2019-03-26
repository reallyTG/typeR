library(FENmlm)


### Name: diagnostic
### Title: Collinearity diagnostics for femlm objects
### Aliases: diagnostic

### ** Examples


# Creating an example data base:
cluster_1 = sample(3, 100, TRUE)
cluster_2 = sample(20, 100, TRUE)
x = rnorm(100, cluster_1)**2
y = rnorm(100, cluster_2)**2
z = rnorm(100, 3)**2
dep = rpois(100, x*y*z)
base = data.frame(cluster_1, cluster_2, x, y, z, dep)

# creating collinearity problems:
base$v1 = base$v2 = base$v3 = base$v4 = 0
base$v1[base$cluster_1 == 1] = 1
base$v2[base$cluster_1 == 2] = 1
base$v3[base$cluster_1 == 3] = 1
base$v4[base$cluster_2 == 1] = 1

# Estimations:

# Collinearity with the cluster variables:
res_1 = femlm(dep ~ log(x) + v1 + v2 + v4 | cluster_1 + cluster_2, base)
diagnostic(res_1)
# => collinearity with cluster identified, we drop v1 and v2
res_1bis = femlm(dep ~ log(x) + v4 | cluster_1 + cluster_2, base)
diagnostic(res_1bis)

# Multi-Collinearity:
res_2 =  femlm(dep ~ log(x) + v1 + v2 + v3 + v4, base)
diagnostic(res_2)

# In non-linear part:
res_3 = femlm(dep ~ log(z), base, NL.fml = ~log(a*x + b*y),
              NL.start = list(a=1, b=1), lower = list(a=0, b=0))
diagnostic(res_3)





