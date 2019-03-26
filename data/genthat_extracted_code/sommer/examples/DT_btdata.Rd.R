library(sommer)


### Name: DT_btdata
### Title: Blue Tit Data for a Quantitative Genetic Experiment
### Aliases: DT_btdata
### Keywords: datasets

### ** Examples


####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples
####=========================================####

# ####=========================================####
# ####=========================================####
# #### EXAMPLE 1
# #### simple example
# ####=========================================####
# ####=========================================####
# data(DT_btdata)
# head(DT)
# mix4 <- mmer(tarsus ~ sex, 
#              random = ~ dam + fosternest,
#              rcov=~units,
#              data = DT)
# summary(mix4)
# 
# ####=========================================####
# ####=========================================####
# ####=========================================####
# #### EXAMPLE 2
# #### more complex multivariate model
# ####=========================================####
# ####=========================================####
# data(DT_btdata)
# mix3 <- mmer(cbind(tarsus, back) ~ sex,
#                 random = ~ vs(dam) + vs(fosternest),
#                 rcov= ~ vs(units, Gtc=diag(2)),
#                 data = DT)
# summary(mix3)
# #### calculate the genetic correlation
# cov2cor(mix3$sigma$`u:dam`)
# cov2cor(mix3$sigma$`u:fosternest`)




