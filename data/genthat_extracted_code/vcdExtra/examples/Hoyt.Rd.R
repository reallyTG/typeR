library(vcdExtra)


### Name: Hoyt
### Title: Minnesota High School Graduates
### Aliases: Hoyt
### Keywords: datasets

### ** Examples

data(Hoyt)

# display the table
structable(Status+Sex ~ Rank+Occupation, data=Hoyt)

# mosaic for independence model
plot(Hoyt, shade=TRUE)

# examine all pairwise mosaics
pairs(Hoyt, shade=TRUE)

# collapse Status to College vs. Non-College
Hoyt1 <- collapse.table(Hoyt, Status=c("College", rep("Non-College",3)))
plot(Hoyt1, shade=TRUE)

#################################################
# fitting models with loglm, plotting with mosaic
#################################################

# fit baseline log-linear model for Status as response
require(MASS)
hoyt.mod0 <- loglm(~ Status + (Sex*Rank*Occupation), data=Hoyt1)
hoyt.mod0
mosaic(hoyt.mod0, gp=shading_Friendly, main="Baseline model: Status + (Sex*Rank*Occ)")

# add one-way association of Status with factors
hoyt.mod1 <- loglm(~ Status * (Sex + Rank + Occupation) + (Sex*Rank*Occupation), data=Hoyt1)
hoyt.mod1
mosaic(hoyt.mod1, gp=shading_Friendly, main="Status * (Sex + Rank + Occ)")

# can we drop any terms?
drop1(hoyt.mod1, test="Chisq")

# assess model fit
anova(hoyt.mod0, hoyt.mod1)

# what terms to add?
add1(hoyt.mod1, ~.^2, test="Chisq")

# add interaction of Sex:Occupation on Status
hoyt.mod2 <- update(hoyt.mod1, ~.+Status:Sex:Occupation)
mosaic(hoyt.mod2, gp=shading_Friendly, main="Adding Status:Sex:Occupation")

# compare model fits
anova(hoyt.mod0, hoyt.mod1, hoyt.mod2)

# Alternatively, try stepwise analysis, heading toward the saturated model
steps <- step(hoyt.mod0, direction="forward", scope=~Status*Sex*Rank*Occupation)
# display anova
steps$anova




