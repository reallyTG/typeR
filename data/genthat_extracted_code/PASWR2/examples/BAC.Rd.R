library(PASWR2)


### Name: BAC
### Title: Blood Alcohol Content
### Aliases: BAC
### Keywords: datasets

### ** Examples

with(data = BAC, 
var.test(X, Y, alternative = "less"))
# Convert data from wide to long format 
# library(reshape2)
# BACL <- melt(BAC, variable.name = "company", value.name = "bac")
# ggplot(data = BACL, aes(x = company, y = bac, fill = company)) + 
# geom_boxplot() + guides(fill = FALSE) + scale_fill_brewer() + 
# labs(y = "blood alcohol content measured in g/L")
# Convert with reshape()
BACL <- reshape(BAC, varying = c("X", "Y"), v.names = "bac", timevar = "company", 
direction = "long")
ggplot(data = BACL, aes(x = factor(company), y = bac, fill = factor(company))) + 
geom_boxplot() + guides(fill = FALSE) + scale_fill_brewer() + 
labs(y = "blood alcohol content measured in g/L", x = "") + 
scale_x_discrete(breaks = c(1, 2), labels = c("Company X", "Company Y"))

# Base graphics
boxplot(BAC$Y, BAC$X)



