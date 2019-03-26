library(Sequential)


### Name: CV.G.Binomial
### Title: Calculates exact critical values for group sequential analysis
###   with binomial data.
### Aliases: CV.G.Binomial
### Keywords: Group MaxSPRT analysis

### ** Examples


# Example 1:
result<- CV.G.Binomial(N=25,alpha=0.05,M=1,z=7/2,GroupSizes=5)
# if you type:
result
# then you will get the following output:
# [[1]]
# [1] 1.9852

# [[2]]
# [1] 0.04775995

# Example 2:

result<- CV.G.Binomial(N=50,alpha=0.05,M=1,z=7/2,GroupSizes=c(10,10,15,15))
cv<- as.numeric(result[1])
# if you type:
cv
# then you will get the following output:
# [1] 1.99202



