library(MSPRT)


### Name: find.samplesize
### Title: Sample size required to achieve a higher significance in a fixed
###   design
### Aliases: find.samplesize

### ** Examples

find.samplesize(test.type = "prop.test", N = 30, null.val = .2)

# In this case, the fixed design alternative at 0.05 is 0.4263. As it seems,
# we need to increase the sample size to 51 to achieve the higher significance
# of 0.005 while still maintaining at least 80% power at 0.4263.


find.samplesize(test.type = "prop.test", N = 30, null.val = .2, side = "left")

# In this case, the fixed design alternative at 0.05 is 0.0516. For testing
# against the left sided alternative, we need to increase the sample size to
# 66 to achieve the higher significance of 0.005 while still maintaining at
# least 80% power at 0.0516.



