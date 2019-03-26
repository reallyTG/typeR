library(seriation)


### Name: seriation_data
### Title: Create Simulated Data for Seriation Evaluation
### Aliases: create_lines_data create_ordered_data
### Keywords: data

### ** Examples

## lines data set from Havens and Bezdek (2011) 
x <- create_lines_data(250)
plot(x, xlim=c(-5,5), ylim=c(-3,3), cex=.2, col = attr(x, "id"))  
d <- dist(x)
pimage(d, seriate(d, "OLO_single"), col = bluered(100, bias=.5), key = TRUE)
  
## create_ordered_data can produce many types of "orderable" data

## perfect pre-Anti-Robinson matrix (with a single components)
x <- create_ordered_data(250, k = 1)  
plot(x, cex=.2, col = attr(x, "id"))  
d <- dist(x)
pimage(d, seriate(d, "MDS"), col = bluered(100, bias=.5), key = TRUE)  
  
## separated components
x <- create_ordered_data(250, k = 5)  
plot(x, cex=.2, col = attr(x, "id"))  
d <- dist(x)
pimage(d, seriate(d, "MDS"), col = bluered(100, bias=.5), key = TRUE)  
  
## overlapping components
x <- create_ordered_data(250, k = 5, sd1 = 2)  
plot(x, cex=.2, col = attr(x, "id"))
d <- dist(x)
pimage(d, seriate(d, "MDS"), col = bluered(100, bias=.5), key = TRUE)  
    
## introduce anti-Robinson violations (a non-zero y value)
x <- create_ordered_data(250, k = 5, sd1 = 2, sd2 = 5)  
plot(x, cex=.2, col = attr(x, "id"))  
d <- dist(x)
pimage(d, seriate(d, "MDS"), col = bluered(100, bias=.5), key = TRUE)  
  
## circular path (has always violations)  
x <- create_ordered_data(250, k = 5, path = "circular", sd1=2)  
plot(x, cex=.2, col = attr(x, "id"))
d <- dist(x)
pimage(d, seriate(d, "OLO"), col = bluered(100, bias=.5), key = TRUE)  

## circular path (with more violations violations)  
x <- create_ordered_data(250, k = 5, path = "circular", sd1=2, sd2=1)  
plot(x, cex=.2, col = attr(x, "id"))
d <- dist(x)
pimage(d, seriate(d, "OLO"), col = bluered(100, bias=.5), key = TRUE) 



