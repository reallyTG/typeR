library(Biocomb)


### Name: leukemia72
### Title: desease data
### Aliases: leukemia72
### Keywords: datasets

### ** Examples

# load the dataset
data(leukemia72)
# X95735_at
with(leukemia72, by(X95735_at,Class,mean))

# M27891_at
with(leukemia72,tapply(M27891_at, Class, FUN = mean))
with(leukemia72, table(M27891_at=ifelse(M27891_at<=mean(M27891_at), "1", "2"), Class))



