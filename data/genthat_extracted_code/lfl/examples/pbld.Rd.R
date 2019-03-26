library(lfl)


### Name: pbld
### Title: Perform a Perception-based Logical Deduction (PbLD) with given
###   rule-base on given dataset
### Aliases: pbld
### Keywords: models robust

### ** Examples

# custom context of the RHS variable
uptakeContext <- c(7, 28.3, 46)

# convert data into fuzzy sets
co2 <- lcut3(CO2, context=list(uptake=uptakeContext))

# split data into training and testing set
testing <- sel(co2, 1:5)
training <- sel(co2, -1 * 1:5)

# search for rules
r <- searchrules(training, lhs=1:38, rhs=39:58)

# prepare values and partition
v <- slices(uptakeContext[1], uptakeContext[3], 1000)
p <- lcut3(v, name='uptake', context=uptakeContext)

# do the inference
pbld(testing, r, p, v)



