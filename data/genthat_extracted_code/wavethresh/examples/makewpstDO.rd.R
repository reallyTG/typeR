library(wavethresh)


### Name: makewpstDO
### Title: Help page for a function
### Aliases: makewpstDO
### Keywords: multivariate ts

### ** Examples

#
# Use BabySS and BabyECG data for this example.
#
# Want to predict future values of BabySS from future values of BabyECG
#
# Build model on first 256 values of both
#
data(BabyECG)
data(BabySS)
BabyModel <- makewpstDO(timeseries=BabyECG[1:256], groups=BabySS[1:256],
	mincor=0.5)
#
# The results (ie print out answer)
#BabyModel
#Stationary wavelet packet discrimination object
#Composite object containing components:[1] "BPd"    "BP"     "filter"
#Fisher's discrimination: done
#BP component has the following information
#BP class object. Contains "best basis" information
#Components of object:[1] "nlevelsWT"     "BasisMatrix" "level"       "pkt"         "basiscoef"
#[6] "groups"
#Number of levels  8
#List of "best" packets
#Level id Packet id Basis coef
#[1,]        4         0  0.7340580
#[2,]        5         0  0.6811251
#[3,]        6         0  0.6443167
#[4,]        3         0  0.6193434
#[5,]        7         0  0.5967620
#[6,]        0         3  0.5473777
#[7,]        1        53  0.5082849
#
# You can plot the select basis graphically using
#
## Not run: basisplot(BabyModel$BP)
#
# An interesting thing are the final "best" packets, these form the
# "reduced" matrix, and the final discrimination is done on this
# In this case 7 wavelet packets were identified as being good for
# univariate high correlation.
#
# In the second pass lda analysis, using the reduced matrix, the following
# turns up as the best linear discriminant vectors
#
# The discriminant variables can be obtained by typing
#BabyModel$BPd$dm$scaling
#LD1        LD2
#[1,] 5.17130434  1.8961807
#[2,] 1.56487144 -3.5025251
#[3,] 1.69328553  1.1585477
#[4,] 3.63362324  8.4543247
#[5,] 0.15202947 -0.4530523
#[6,] 0.35659009 -0.3850318
#[7,] 0.09429836 -0.1281240
#
#
# Now, suppose we get some new data for the BabyECG time series.
# For the purposes of this example, this is just the continuing example
# ie BabyECG[257:512]. We can use our new discriminant model to predict
# new values of BabySS
#
BabySSpred <- wpstCLASS(newTS=BabyECG[257:512], BabyModel)
#
# Let's look at the first 10 (eg) values of this prediction
#
#BabySSpred$class[1:10]
#[1] 4 4 4 4 4 4 4 4 4 4
#Good. Now let's look at what the "truth" was:
#BabySS[257:267]
#[1] 4 4 4 4 4 4 4 4 4 4
#Good. However, the don't agree everywhere, let's do a cross classification
#between the prediction and the truth.
#
#> table(tmp2$class, BabySS[257:512])
#
#      1   2   3   4
#  1   4   1   1   0
#  2 116   0  23   3
#  4   2  12   0  94
#
#So class 3 and 4 agree pretty much, but class 1 has been mispredicted at class
#2 a lot.



