library(igraph)


### Name: cohesive_blocks
### Title: Calculate Cohesive Blocks
### Aliases: cohesive_blocks cohesive.blocks cohesiveBlocks blocks
###   graphs_from_cohesive_blocks blockGraphs hierarchy parent
###   plotHierarchy export_pajek maxcohesion plot.cohesiveBlocks
###   summary.cohesiveBlocks length.cohesiveBlocks print.cohesiveBlocks
###   plot_hierarchy max_cohesion exportPajek length.cohesiveBlocks blocks
###   graphs_from_cohesive_blocks cohesion.cohesiveBlocks hierarchy parent
###   print.cohesiveBlocks summary.cohesiveBlocks plot.cohesiveBlocks
###   plot_hierarchy export_pajek max_cohesion
### Keywords: graphs

### ** Examples


## The graph from the Moody-White paper
mw <- graph_from_literal(1-2:3:4:5:6, 2-3:4:5:7, 3-4:6:7, 4-5:6:7,
                5-6:7:21, 6-7, 7-8:11:14:19, 8-9:11:14, 9-10,
                10-12:13, 11-12:14, 12-16, 13-16, 14-15, 15-16,
                17-18:19:20, 18-20:21, 19-20:22:23, 20-21,
                21-22:23, 22-23)

mwBlocks <- cohesive_blocks(mw)

# Inspect block membership and cohesion
mwBlocks
blocks(mwBlocks)
cohesion(mwBlocks)

# Save results in a Pajek file
## Not run: 
##D export_pajek(mwBlocks, mw, file="/tmp/mwBlocks.paj")
## End(Not run)

# Plot the results
plot(mwBlocks, mw)

## The science camp network
camp <- graph_from_literal(Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
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
campBlocks <- cohesive_blocks(camp)
campBlocks

plot(campBlocks, camp, vertex.label=V(camp)$name, margin=-0.2,
     vertex.shape="rectangle", vertex.size=24, vertex.size2=8,
     mark.border=1, colbar=c(NA, NA,"cyan","orange") )




