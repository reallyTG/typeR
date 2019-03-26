library(clValid)


### Name: mouse
### Title: Mouse Mesenchymal Cells
### Aliases: mouse
### Keywords: datasets

### ** Examples

data(mouse)

## table of fuctional classifications
table(mouse$FC)

## hierarchical clustering of expression values
express <- mouse[,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID
hc <- hclust(dist(express))
plot(hc)




