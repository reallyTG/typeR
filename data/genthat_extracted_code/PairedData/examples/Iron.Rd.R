library(PairedData)


### Name: Iron
### Title: Iron data from Preece (1982, Table 10)
### Aliases: Iron
### Keywords: datasets

### ** Examples

data(Iron)

# Visualizing, very nice correlation
# Is this an agreement problem or a comparison problem?
with(Iron,plot(paired(Method_A,MethodB)))

# Significant... p=0.045
with(Iron,t.test(paired(Method_A,MethodB)))

# Looking at data, rounded at 0.1 so they can be +0.05 or -0.05
show(Iron)

# Thus the differences can be +0.1 or -0.1
# Influence of rounding on the t-statistic
with(Iron,t.test(Method_A-MethodB+0.1))
with(Iron,t.test(Method_A-MethodB-0.1))



