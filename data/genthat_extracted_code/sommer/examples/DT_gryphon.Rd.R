library(sommer)


### Name: DT_gryphon
### Title: Gryphon data from the Journal of Animal Ecology
### Aliases: DT_gryphon
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####
# data(DT_gryphon)
# #### look at the data
# head(DT)
# #### fit the model with no fixed effects (intercept only)
# mix1 <- mmer(BWT~1,
#              random=~vs(ANIMAL,Gu=A),
#              rcov=~units,
#              data=DT)
# summary(mix1)

# #### fit the multivariate model with no fixed effects (intercept only)
# mix2 <- mmer(cbind(BWT,TARSUS)~1,
#              random=~vs(ANIMAL,Gu=A),
#              rcov=~vs(units),
#              na.method.Y = "include2",
#              data=DT)
# summary(mix2)
# cov2cor(mix2$sigma$`u:ANIMAL`)
# cov2cor(mix2$sigma$`u:units`)




