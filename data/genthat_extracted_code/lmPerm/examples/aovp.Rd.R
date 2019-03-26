library(lmPerm)


### Name: aovp
### Title: Fitting and testing ANOVA using permutation tests
### Aliases: aovp
### Keywords: htest

### ** Examples


## A simple randomized block example. 
# There are 7 blocks and 6 treatments. A first
# analysis with blocks as a factor shows block to be significant and treatments not. 

data(Hald17.4)
summary(aovp(Y~T+block,Hald17.4))

# Using the block to define a separate error strata tells a different story.

summary(aovp(Y~T+Error(block),Hald17.4))

# There appears to be a linear trend in the blocks. This may be investigated by
# extracting a linear component. The factor L was created by copying the block
# factor and assigning it a linear contrast, like this
# contrasts(L,1)<-contr.poly(7). The analysis then becomes.

summary(aovp(Y~T+L+Error(block),Hald17.4))

# The L factor is not significant under permutation. It is significant when aov()
# is used and the test is the usual F-test.


## From Venables and Ripley (2000)
# This is a 2^3 factorial in the variables N,P,K. It is fractioned by using the 
# three way interaction, NPK, into two fractions of 4. Each of these fractions is 
# allocated to 3 blocks, making 6 blocks in all. An analysis with block as a 
# variable is the following. As may be seen, aovp() discards the confounded NPK interaction.

data(NPK)
summary(aovp(yield ~ block + N*P*K, NPK))

# Since the NPK interaction was confounded with blocks, the experimenter no doubt judged 
# it of lesser interest. It may however be examined by including blocks as an additional
# error term as follows. The basic error level between blocks is of course larger than 
# that within blocks, so the NPK interaction would have to be substantially larger that
# it would have had to be were it tested within blocks.
summary(aovp(yield ~  N*P*K + Error(block), NPK))

# The SS calculated by aovp() are unique SS by default. That is,
# they are sums of squares for the difference of a model with and without the source. The
# resulting test is a test of the hypothesis that the source has no effect on the response.
# Sequential SS, which are those produced by aov() may be obtained by setting the
# parameter seqs=TRUE. simDesign is an unbalanced design created by the AlgDesign package.

data(simDesign)
summary(aovp(Y~.,simDesign))
summary(aovp(Y~.,simDesign,seqs=TRUE)) 

# Since there is only one stratum, these results are the same as would be obtained from
anova(lmp(Y~.,simDesign))

# ANOVA for numerical variables. First using contrasts, then numeric variables.
data(Federer276)
summary(aovp(Plants~Variety*Treatment+Error(Rep/Plot),Federer276))
data(Federer276Numeric)
summary(aovp(poly.formula(Plants~quad(Variety,Treatment)+Error(Rep/Plot)),Federer276Numeric))
# The coefficients and their p-values may be obtained by
summaryC(aovp(Plants~Variety*Treatment+Error(Rep/Plot),Federer276))





