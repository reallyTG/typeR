library(qtl)


### Name: convert2sa
### Title: Convert a sex-specific map to a sex-averaged one
### Aliases: convert2sa
### Keywords: manip

### ** Examples

data(fake.4way)
## Not run: fake.4way <- subset(fake.4way, chr="-X")
## Don't show: 
fake.4way <- subset(fake.4way, chr=18:19)
## End(Don't show)
nm <- est.map(fake.4way, sex.sp=FALSE)
plot(convert2sa(nm))



