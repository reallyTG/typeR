library(REAT)


### Name: locq2
### Title: Location quotient
### Aliases: locq2

### ** Examples

data (G.regions.industries)

lqs <- locq2(e_ij = G.regions.industries$emp_all, 
G.regions.industries$ind_code, G.regions.industries$region_code, 
LQ.output = "df")
# output as data frame

lqs_sort <- lqs[order(lqs$LQ, decreasing = TRUE),]
# Sort decreasing by size of LQ

lqs_sort[1:5,]



