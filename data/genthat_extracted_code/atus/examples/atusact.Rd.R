library(atus)


### Name: atusact
### Title: ATUS Respondent Daily Activity Summary (2003-2016)
### Aliases: atusact
### Keywords: datasets

### ** Examples

data(atusact)
# example activity: sleeping
#          tier 1 code = 01 (personal care)
#          tier 2 code = 01 (sleeping)
#          tier 3 code = all

# this is a data frame with all individuals that did some amount of sleeping
# on their diary day
sleeping <- atusact[atusact$tiercode >= 10100 & atusact$tiercode < 10200,]

# how many did not sleep?
length(unique(atusact$tucaseid)) - length(unique(sleeping$tucaseid))

# example activity: doing homework (for a class towards a degree)
#          tier 1 code = 06
#          tier 2 code = 03
#          tier 3 code = 01

hw <- atusact[atusact$tiercode == 60301,]
hist(hw$dur)
summary(hw$dur)




