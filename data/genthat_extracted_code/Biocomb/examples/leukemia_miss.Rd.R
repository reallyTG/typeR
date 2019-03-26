library(Biocomb)


### Name: leukemia_miss
### Title: desease data
### Aliases: leukemia_miss
### Keywords: datasets

### ** Examples

# load the dataset
data(leukemia_miss)
# X95735_at
with(leukemia_miss, by(X95735_at,Class,mean,na.rm=TRUE))

# M27891_at
with(leukemia_miss,tapply(M27891_at, Class, FUN = mean,na.rm=TRUE))



