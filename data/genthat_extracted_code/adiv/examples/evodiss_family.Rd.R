library(adiv)


### Name: evodiss_family
### Title: A Family of Indices Dedicated to Pair-wise Phylogenetic
###   Dissimilarities between Communities
### Aliases: evodiss_family evodiss_ternaryplot
### Keywords: models

### ** Examples

data(batcomm)
phy <- read.tree(text=batcomm$tre)
ab <- batcomm$ab[,phy$tip.label]

# PD-dissimilarity indices that use Nipperess et al. (2010)
# parameters can be obtained thanks to function evodiss_family. 
# For example, with incidence data, 
# indices evoDJaccard, evoDSorensen, and evoDOchiai 
# (supplementary Appendix 1 in Pavoine 2016) 
# can be obtained as follows:

evodiss_family(phy, ab, method=1, abundance=FALSE) # Jaccard
evodiss_family(phy, ab, method=5, abundance=FALSE) # Sorensen
evodiss_family(phy, ab, method=7, abundance=FALSE) # Ochiai

# With abundance data, indices evoDTJ, evoDTS, evoDTO 
# (supplementary Appendix 1 in Pavoine 2016) 
# can be obtained as follows:

evodiss_family(phy, ab, method=1) # evoDTJ
evodiss_family(phy, ab, method=5) # evoDTS
evodiss_family(phy, ab, method=7) # evoDTO

# Ternary plots can be obtained for Nipperess et al. (2010) 
# parameters a, b, c (incidence data) 
# (see Supplementary material Appendix 4 in Pavoine 2016):

evodiss_ternaryplot(phy, ab, abundance = FALSE)

# and for Nipperess et al. (2010) parameters A, B, C 
# (abundance data):

evodiss_ternaryplot(phy, ab, abundance = TRUE)

# The ternary plots can be adjusted thanks 
# to parameters of function triangle.plot (package ade4). 
# For example, full triangles can be obtained as follows 
# (previous graphs were zoomed on the smallest principal 
# equilateral triangle that contained the points, 
# as indicated by the embedded close grey triangle 
# at the left-hand corner of ternary plot given above):

evodiss_ternaryplot(phy, ab, abundance = FALSE, adjust=FALSE, showposition=FALSE)
# Incidence data

evodiss_ternaryplot(phy, ab, abundance = TRUE, adjust=FALSE, showposition=FALSE)
# abundance data



