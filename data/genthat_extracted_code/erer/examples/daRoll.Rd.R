library(erer)


### Name: daRoll
### Title: Voting records for the Healthy Forests Restoration Act in 2003
###   and the associated characteristics of congressmen
### Aliases: daRoll
### Keywords: datasets

### ** Examples


# generate four datasets used in Sun (2006)
data(daRoll)
xn <- c('RepParty', 'East', 'West', 'South', 'PopDen', 
  'PopRural', 'Edu', 'Income', 'FYland', 'Size', 
  'ContrFY', 'ContrEN', 'Sex', 'Lawyer', 'Member', 'Year', 'Chamber')

f1 <- daRoll[!is.na(daRoll$voteMay), c('voteMay', xn)]
f2 <- daRoll[!is.na(daRoll$voteNov) & daRoll$Chamber == 1, c('voteNov', xn)]
f3 <- daRoll[!is.na(daRoll$voteNov), c('voteNov', xn)]
f4 <- daRoll[!is.na(daRoll$voteNov) & daRoll$RepParty == 0, c('voteNov', xn)]
rownames(f1) <- 1:nrow(f1); rownames(f2) <- 1:nrow(f2)
rownames(f3) <- 1:nrow(f3); rownames(f4) <- 1:nrow(f4)
colnames(f1)[1] <- colnames(f2)[1] <- 'Vote'
colnames(f3)[1] <- colnames(f4)[1] <- 'Vote'
dim(f1); dim(f2); dim(f3); dim(f4)
tail(f3) 



