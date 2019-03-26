library(factoextra)


### Name: facto_summarize
### Title: Subset and summarize the output of factor analyses
### Aliases: facto_summarize

### ** Examples

# Principal component analysis
# +++++++++++++++++++++++++++++
data(decathlon2)
decathlon2.active <- decathlon2[1:23, 1:10]
res.pca <- prcomp(decathlon2.active,  scale = TRUE)

# Summarize variables on axes 1:2
facto_summarize(res.pca, "var", axes = 1:2)[,-1]
# Select the top 5 contributing variables
facto_summarize(res.pca, "var", axes = 1:2,
           select = list(contrib = 5))[,-1]
# Select variables with cos2 >= 0.6
facto_summarize(res.pca, "var", axes = 1:2,
           select = list(cos2 = 0.6))[,-1]
# Select by names
facto_summarize(res.pca, "var", axes = 1:2,
     select = list(name = c("X100m", "Discus", "Javeline")))[,-1]
           
# Summarize individuals on axes 1:2
facto_summarize(res.pca, "ind", axes = 1:2)[,-1]

# Correspondence Analysis
# ++++++++++++++++++++++++++
# Install and load FactoMineR to compute CA
# install.packages("FactoMineR")
library("FactoMineR")
data("housetasks")
res.ca <- CA(housetasks, graph = FALSE)
# Summarize row variables on axes 1:2
facto_summarize(res.ca, "row", axes = 1:2)[,-1]
# Summarize column variables on axes 1:2
facto_summarize(res.ca, "col", axes = 1:2)[,-1]

# Multiple Correspondence Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mca <- MCA(poison, quanti.sup = 1:2, 
              quali.sup = 3:4, graph=FALSE)
# Summarize variables on axes 1:2
res <- facto_summarize(res.mca, "var", axes = 1:2)
head(res)
# Summarize individuals on axes 1:2
res <- facto_summarize(res.mca, "ind", axes = 1:2)
head(res)

# Multiple factor Analysis
# +++++++++++++++++++++++++++++++++
library(FactoMineR)
data(poison)
res.mfa <- MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
               name.group=c("desc","desc2","symptom","eat"),
               num.group.sup=1:2, graph=FALSE)
# Summarize categorcial variables on axes 1:2
res <- facto_summarize(res.mfa, "quali.var", axes = 1:2)
head(res)
# Summarize individuals on axes 1:2
res <- facto_summarize(res.mfa, "ind", axes = 1:2)
head(res)



