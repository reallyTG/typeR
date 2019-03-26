library(REAT)


### Name: G.regions.industries
### Title: Firms and employment data for German regions 2015
### Aliases: G.regions.industries

### ** Examples

data (G.regions.industries)

lqs <- locq2(e_ij = G.regions.industries$emp_all, 
G.regions.industries$ind_code, G.regions.industries$region_code, 
LQ.output = "df")
# output as data frame

lqs_sort <- lqs[order(lqs$LQ, decreasing = TRUE),]
# Sort decreasing by size of LQ

lqs_sort[1:5,]



