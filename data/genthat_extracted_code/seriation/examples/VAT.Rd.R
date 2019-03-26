library(seriation)


### Name: VAT
### Title: Visual Analysis for Cluster Tendency Assessment (VAT/iVAT)
### Aliases: path_dist iVAT VAT
### Keywords: cluster manip

### ** Examples

## lines data set from Havens and Bezdek (2011) 
x <- create_lines_data(250)
plot(x, xlim=c(-5,5), ylim=c(-3,3), cex=.2)  
d <- dist(x)

## create regular VAT
VAT(d, colorkey = TRUE, main = "VAT")
## same as: pimage(d, seriate(d, "VAT"))  

## create iVAT which shows visually the three lines
iVAT(d, main = "iVAT")
## same as:
## d_path <- path_dist(d)
## pimage(d_path, seriate(d_path, "VAT"))  

## compare with dissplot (shows banded structures and relationship between 
## center line and the two outer lines)
dissplot(d, method="OLO_single", main = "Dissplot", col = bluered(100, bias = .5))

## compare with optimally reordered heatmap
hmap(d, method="OLO_single", main = "Heat map (opt. leaf ordering)", 
col = bluered(100, bias = .5))



