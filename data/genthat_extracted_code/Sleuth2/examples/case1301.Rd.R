library(Sleuth2)


### Name: case1301
### Title: Seaweed Grazers
### Aliases: case1301
### Keywords: datasets

### ** Examples

str(case1301)

# full two-way model with interactions
fitfull <- aov(Cover ~ Treat*Block, case1301)
# Residual plot indicates a transformation might help
plot(fitfull)  

# Log of seaweed "regeneration ratio" 
y <- with(case1301, log(Cover/(100-Cover)))
# Full two-way model with interactions
fitfull <- aov(y~Treat*Block, case1301)
# No problems indicated by residual plot
plot(fitfull)
# Note that interactions are not statistically significant
anova(fitfull) 
# Additive model (no interactions)
fitadditive <- aov(y ~ Treat + Block, case1301) 

# Make indicator variables for presence of limpets, small fish, and large fish 
lmp <- with(case1301, ifelse(Treat %in% c("L", "Lf", "LfF"), 1, 0))
sml <- with(case1301, ifelse(Treat %in% c("f", "fF", "Lf", "LfF"), 1, 0))
big <- with(case1301, ifelse(Treat %in% c("fF", "LfF"), 1, 0))

fitsimple <- lm(y ~ Block + lmp + sml + big, case1301)
# Model with main effects of 3 "presence" factors seems ok.
anova(fitsimple, fitadditive)  
summary(fitsimple, cor=FALSE)



