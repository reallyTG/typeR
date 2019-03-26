library(rpact)


### Name: getFinalConfidenceInterval
### Title: Get Final Confidence Interval
### Aliases: getFinalConfidenceInterval
### Keywords: internal

### ** Examples


design <- getDesignInverseNormal(kMax = 2)
data <- getDataset(
    n = c(20, 30),
    means = c(50, 51),
    stDevs = c(130, 140)
)
getFinalConfidenceInterval(design, dataInput = data)

# Results in:
#
# $finalStage
# [1] 2
# 
# $medianUnbiasedGeneral
# [1] 0.3546145
# 
# $finalConfidenceIntervalGeneral
# [1] 0.06967801 0.63468553
# 
# $medianUnbiased
# [1] 47.7787
# 
# $finalConfidenceInterval
# [1]  9.388012 85.513851'




