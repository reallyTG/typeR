library(PASWR2)


### Name: COSAMA
### Title: Cosmed Versus Amatek
### Aliases: COSAMA
### Keywords: datasets

### ** Examples

# ggplot2 approach
ggplot(data = COSAMA, aes(factor(1), y = cosmed - amatek)) + geom_boxplot() + 
labs(x = "")
# Line Plots: First change data format from wide to long with melt() from reshape2
# library(reshape2)
# CA <- melt(COSAMA, id.vars = "subject", variable.name = "treatment", 
# value.count = "VO2")
# ggplot(data = CA, aes(x = subject, y = value, color = treatment)) + geom_line()
# rm(CA)
# Convert to long format with reshape()
CA <- reshape(COSAMA, varying = c("cosmed", "amatek"), v.names = "VO2", 
timevar = "treatment", idvar = "subject", direction = "long")
ggplot(data = CA, aes(x = subject, y = VO2, color = factor(treatment))) + geom_line() + 
labs(color = "Treatment") + scale_color_discrete(labels = c("Cosmed", "Amatek"))
rm(CA)
# lattice approach
bwplot(~ (cosmed - amatek), data = COSAMA)



