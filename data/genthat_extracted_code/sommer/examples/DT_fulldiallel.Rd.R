library(sommer)


### Name: DT_fulldiallel
### Title: Full diallel data for corn hybrids
### Aliases: DT_fulldiallel
### Keywords: datasets

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the
#### examples are silenced with one '#' mark,
#### remove them and run the examples
####=========================================####
data(DT_fulldiallel)
head(DT)
mix <- mmer(stems~1, random=~female+male, data=DT)
summary(mix)

####=========================================####
####=========================================####
#### Multivariate model example
####=========================================####
####=========================================####

data(DT_fulldiallel)
head(DT)

mix <- mmer(cbind(stems,pods,seeds)~1,
             random=~vs(female) + vs(male),
             rcov=~vs(units),
             data=DT)
summary(mix)
#### genetic variance covariance
cov2cor(mix$sigma$`u:female`)
cov2cor(mix$sigma$`u:male`)
cov2cor(mix$sigma$`u:units`)




