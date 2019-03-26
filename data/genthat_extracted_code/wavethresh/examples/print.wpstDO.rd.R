library(wavethresh)


### Name: print.wpstDO
### Title: Print information about a wpstDO class object
### Aliases: print.wpstDO
### Keywords: print

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
BabyModel
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



