library(Biocomb)


### Name: leukemia72_2
### Title: desease data
### Aliases: leukemia72_2
### Keywords: datasets

### ** Examples

# load the dataset
data(leukemia72_2)
# X95735_at
with(leukemia72_2, by(X95735_at,Class,mean))

# M27891_at
with(leukemia72_2,tapply(M27891_at, Class, FUN = mean))
with(leukemia72_2, table(M27891_at=ifelse(M27891_at<=mean(M27891_at), "1", "2"), Class))



