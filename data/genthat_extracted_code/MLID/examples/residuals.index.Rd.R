library(MLID)


### Name: residuals.index
### Title: Extract Model Residuals
### Aliases: residuals.index

### ** Examples

data(aggdata)
index <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit"))
# The ID can be derived from the residuals
0.5 * sum(abs(residuals(index)))
# which is the same as
index[1]

# Extract the standardized and look for regions where the share of the
# Bangladeshi population is unusualy high with respect to the White British
# resids <- rstandard(index)
# table(aggdata$RGN[resids > 2.58])

# Residuals for a multilevel index
index <- id(aggdata, vars = c("Bangladeshi", "WhiteBrit"),
levels = c("MSOA","LAD","RGN"))
resids <- residuals(index)
head(resids)
# Again, the ID can be derived from the residuals
0.5 * sum(abs(rowSums(resids)))

# Looking at the residuals, the London effect is different from other regions
sort(tapply(resids[,4], aggdata$RGN, mean))

# At the local authority scale it is Tower Hamlets and Newham
# (both in London) that have the highest share of the Bangladeshi population
# with respect to the White British:
tail(sort(tapply(resids[,3], aggdata$LAD, mean)),5)



