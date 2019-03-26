library(sjmisc)


### Name: de_mean
### Title: Compute group-meaned and de-meaned variables
### Aliases: de_mean

### ** Examples

data(efc)
efc$ID <- sample(1:4, nrow(efc), replace = TRUE) # fake-ID
de_mean(efc, c12hour, barthtot, grp = ID, append = FALSE)




