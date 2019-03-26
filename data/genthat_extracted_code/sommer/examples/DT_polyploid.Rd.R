library(sommer)


### Name: DT_polyploid
### Title: Genotypic and Phenotypic data for a potato polyploid population
### Aliases: DT_polyploid
### Keywords: datasets

### ** Examples

####=========================================####
#### For CRAN time limitations most lines in the 
#### examples are silenced with one '#' mark, 
#### remove them and run the examples using
#### command + shift + C |OR| control + shift + C
####=========================================####

data(DT_polyploid)

# ####=========================================####
# ####### convert markers to numeric format
# ####=========================================####
# numo <- atcg1234(data=GT, ploidy=4); 
# numo$M[1:5,1:5]; 
# numo$ref.allele[,1:5]
# 
# ###=========================================####
# ###### plants with both genotypes and phenotypes
# ###=========================================####
# common <- intersect(DT$Name,rownames(numo$M))
# 
# ###=========================================####
# ### get the markers and phenotypes for such inds
# ###=========================================####
# marks <- numo$M[common,]; marks[1:5,1:5]
# DT2 <- DT[match(common,DT$Name),];
# DT2 <- as.data.frame(DT2)
# DT2[1:5,]
# 
# ###=========================================####
# ###### Additive relationship matrix, specify ploidy
# ###=========================================####
# A <- A.mat(marks, ploidy=4)
# D <- D.mat(marks, ploidy=4)
# ###=========================================####
# ### run as mixed model
# ###=========================================####
# ans <- mmer(tuber_shape~1, 
#             random=~vs(Name, Gu=A),
#             data=DT2)
# summary(ans)
# 
# ###=========================================####
# ### run it as GWAS model
# ###=========================================####
# ans2 <- GWAS(tuber_shape~1, 
#              random=~vs(Name,Gu=A),
#              rcov=~units,
#              gTerm = "Name",
#              M=marks, data=DT2)
# summary(ans2)
# plot(ans2$scores[1,])
# plot(ans2$r2m[1,])



