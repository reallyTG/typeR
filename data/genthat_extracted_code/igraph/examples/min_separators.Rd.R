library(igraph)


### Name: min_separators
### Title: Minimum size vertex separators
### Aliases: min_separators minimum.size.separators

### ** Examples

# The graph from the Moody-White paper
mw <- graph.formula(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
                    5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
                    10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
                    17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
                    21-22:23, 22-23)

# Cohesive subgraphs
mw1 <- induced.subgraph(mw, as.character(c(1:7, 17:23)))
mw2 <- induced.subgraph(mw, as.character(7:16))
mw3 <- induced.subgraph(mw, as.character(17:23))
mw4 <- induced.subgraph(mw, as.character(c(7,8,11,14)))
mw5 <- induced.subgraph(mw, as.character(1:7))

min_separators(mw)
min_separators(mw1)
min_separators(mw2)
min_separators(mw3)
min_separators(mw4)
min_separators(mw5)

# Another example, the science camp network
camp <- graph.formula(Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
                      Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
                      Holly   - Carol:Pat:Pam:Jennie:Bill,
                      Bill    - Pauline:Michael:Lee:Holly,
                      Pauline - Bill:Jennie:Ann,
                      Jennie  - Holly:Michael:Lee:Ann:Pauline,
                      Michael - Bill:Jennie:Ann:Lee:John,
                      Ann     - Michael:Jennie:Pauline,
                      Lee     - Michael:Bill:Jennie,
                      Gery    - Pat:Steve:Russ:John,
                      Russ    - Steve:Bert:Gery:John,
                      John    - Gery:Russ:Michael)
min_separators(camp)



