library(binda)


### Name: dichotomize
### Title: Dichotomize Continuous Data Set With Labels
### Aliases: dichotomize optimizeThreshold
### Keywords: univar

### ** Examples

# load binda library
library("binda")

# example data with 6 variables (in columns) and 4 samples (in rows)
X = matrix(c(1, 1, 1, 1.75, 0.4,    0,
             1, 1, 2,    2, 0.4, 0.09,
             1, 0, 1,    1, 0.5,  0.1,
             1, 0, 1,  0.5, 0.6,  0.1), nrow=4, byrow=TRUE)
colnames(X) = paste0("V", 1:ncol(X))

# class labels
L = factor(c("Treatment", "Treatment", "Control", "Control") )
rownames(X) = paste0(L, rep(1:2, times=2))

X
#          V1 V2 V3   V4  V5   V6
#Treatment1  1  1  1 1.75 0.4 0.00
#Treatment2  1  1  2 2.00 0.4 0.09
#Control1    1  0  1 1.00 0.5 0.10
#Control2    1  0  1 0.50 0.6 0.10

# find optimal thresholds (one for each variable)
thr = optimizeThreshold(X, L)
thr
#  V1   V2   V3   V4   V5   V6 
#1.00 1.00 2.00 1.75 0.50 0.10

# convert into binary matrix
# if value is lower than threshold -> 0 otherwise -> 1
Xb = dichotomize(X, thr)
is.binaryMatrix(Xb) # TRUE
Xb
#          V1 V2 V3 V4 V5 V6
#Treatment1  1  1  0  1  0  0
#Treatment2  1  1  1  1  0  0
#Control1    1  0  0  0  1  1
#Control2    1  0  0  0  1  1
#attr(,"thresh")
#  V1   V2   V3   V4   V5   V6 
#1.00 1.00 2.00 1.75 0.50 0.10



