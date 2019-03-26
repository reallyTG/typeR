library(psychometric)


### Name: cRRr
### Title: Correction for Range Restriction
### Aliases: cRRr
### Keywords: htest models

### ** Examples

# See section 2.10.3 of Cohen et al (2003)
cRRr(.25, 12, 5)

# Create two correlated variables 
x <- rnorm(1000)
y <- 0.71*x +rnorm(1000)
cor(x,y)
# order and select top 1/10 
tmp <- cbind(x,y)[order(y,x),][1:100,]
rxyr <- cor(tmp[,"x"],tmp[,"y"]) # restricted rxy
rxyr
# correct for restriction of range
cRRr(rxyr, sd(tmp[,"y"]), sd(y))





