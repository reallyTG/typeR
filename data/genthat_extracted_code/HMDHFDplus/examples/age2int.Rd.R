library(HMDHFDplus)


### Name: age2int
### Title: 'age2int()' convert the Age column from standard HMD or HFD
###   tables to integer
### Aliases: age2int

### ** Examples

AgeTest <- c("12-","13","14","55+")
(AgeNew  <- age2int(AgeTest))
AgeNew + .5 # sort of mid-interval

# also handles abrdiged ages properly:
AgeAbridged <- c("0","1-4","5-9","10-14")
age2int(AgeAbridged)



