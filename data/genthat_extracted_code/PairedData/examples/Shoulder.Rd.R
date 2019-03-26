library(PairedData)


### Name: Shoulder
### Title: Shoulder flexibility in swimmers
### Aliases: Shoulder
### Keywords: datasets

### ** Examples

data(Shoulder)

# Is there some heteroscedasticity?
with(Shoulder,plot(paired(Left,Right)))

# Swimmers are indeed quite different
with(Shoulder,plot(paired(Right,Left),groups=Group))

# A first derived variable to compare the amplitude in flexibilty
with(Shoulder,boxplot(((Left+Right)/2)~Group,ylab="mean shoulder flexibility"))

# A second derived variable to study shoulder asymmetry
with(Shoulder,boxplot((abs(Left-Right))~Group,ylab="asymmetry in shoulder flexibility"))



