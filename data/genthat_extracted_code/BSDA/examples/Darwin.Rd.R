library(BSDA)


### Name: Darwin
### Title: Charles Darwin's study of cross-fertilized and self-fertilized
###   plants
### Aliases: Darwin
### Keywords: datasets

### ** Examples


differ <- Darwin$cross - Darwin$self
qqnorm(differ)
qqline(differ)
shapiro.test(differ)
wilcox.test(Darwin$cross, Darwin$self, paired = TRUE)
rm(differ)




