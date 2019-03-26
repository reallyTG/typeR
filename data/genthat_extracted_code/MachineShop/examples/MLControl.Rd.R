library(MachineShop)


### Name: MLControl
### Title: Resampling Controls
### Aliases: MLControl BootControl CVControl OOBControl SplitControl
###   TrainControl

### ** Examples

## 100 bootstrap samples
BootControl(samples = 100)

## 5 repeats of 10-fold cross-validation
CVControl(folds = 10, repeats = 5)

## 100 out-of-bootstrap samples
OOBControl(samples = 100)

## Split sample of 2/3 training and 1/3 testing
SplitControl(prop = 2/3)

## Same training and test set
TrainControl()




