library(imbalance)


### Name: oversample
### Title: Wrapper that encapsulates a collection of algorithms to perform
###   a class balancing preprocessing task for binary class datasets
### Aliases: oversample

### ** Examples

data(glass0)

# Oversample glass0 to get an imbalance ratio of 0.8
imbalanceRatio(glass0)
# 0.4861111
newDataset <- oversample(glass0, ratio = 0.8, method = "MWMOTE")
imbalanceRatio(newDataset)
newDataset <- oversample(glass0, method = "ADASYN")
newDataset <- oversample(glass0, ratio = 0.8, method = "SMOTE")




