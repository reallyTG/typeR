library(parsec)


### Name: rmProfiles
### Title: Removing profiles
### Aliases: rmProfiles rmProfiles.wprof

### ** Examples

vl <- c(3, 3, 3)
prof <- var2prof(varlen = vl)
rownames(prof$profiles)

prof <- rmProfiles(prof, c("123", "321"))

plot(prof)



