library(binGroup)


### Name: bgtTest
### Title: Hypothesis Test for One Proportion in Binomial Group Testing
### Aliases: bgtTest
### Keywords: htest

### ** Examples


# Assume the experiment: Assays are performed on
# n=10 groups, each group is a bulk sample
# of s=100 individuals, aim is to show that 
# less than 0.5 percent ('p<0.005') of the units
# of the population show a detrimental trait (positive assay).
# The assay is senstive to show a positive result if only 1
# unit in the bulk sample of 100 units is positive.
# y=1 positive assay and 9 negative assays are observed.

bgtTest(n=10,y=1,s=100,alternative="less",method="Exact",p.hyp=0.005)

# The exact test corresponds to the 
# limits of the Clopper-Pearson confidence interval
# in the example of Tebbs and Bilder(2004):

bgtTest(n=24, y=3, s=7, alternative="two.sided",
 method="Exact", p.hyp=0.0543)

bgtTest(n=24, y=3, s=7, alternative="two.sided",
 method="Exact", p.hyp=0.0038)

# Further methods:

bgtTest(n=24, y=3, s=7, alternative="two.sided",
 method="Score", p.hyp=0.0516)

bgtTest(n=24, y=3, s=7, alternative="two.sided",
 method="Wald", p.hyp=0.0401)



