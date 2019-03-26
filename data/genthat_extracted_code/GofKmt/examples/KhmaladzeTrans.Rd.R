library(GofKmt)


### Name: KhmaladzeTrans
### Title: Performs goodness-of-fit test through Khmaladze matringale
###   transformation
### Aliases: KhmaladzeTrans

### ** Examples

####################
n = 10
Sample = rnorm(n, 1,3)    # Generate a random sample of n observations from N(1,3)
KMT_Result = KhmaladzeTrans(Sample, "Normal", Shape=2)
KMT_TestStat = KMT_Result$TestStat
KMT_CriticalValue = KMT_Result$CritValue
KMT_Muhat = KMT_Result$Mu
KMT_Sigmahat = KMT_Result$Sigma
#####################

#####################
n = 10
Sample = rlogis(n, location=2, scale=3)  # Generate a random sample from logistic distribution
KMT_Result = KhmaladzeTrans(Sample, "Logistic", Shape=2)
KMT_TestStat = KMT_Result$TestStat
KMT_CriticalValue = KMT_Result$CritValue
KMT_Muhat = KMT_Result$Mu
KMT_Sigmahat = KMT_Result$Sigma
#####################



