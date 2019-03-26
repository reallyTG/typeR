library(ChainLadder)


### Name: triangle S3 Methods
### Title: Generic functions for triangles
### Aliases: triangle plot.triangle as.data.frame.triangle as.triangle
###   as.triangle.data.frame as.triangle.matrix
### Keywords: methods

### ** Examples

GenIns
plot(GenIns)
plot(GenIns, lattice=TRUE)


## Convert long format into triangle
## Triangles are usually stored as 'long' tables in data bases
head(GenInsLong)
as.triangle(GenInsLong, origin="accyear", dev="devyear", "incurred claims")

X <- as.data.frame(RAA)
head(X)

Y <- as.data.frame(RAA, lob="General Liability")
head(Y)

## Basic creation of a triangle from loss development data
triangle(c(100, 150, 175, 180, 200),
         c(110, 168, 192, 205),
         c(115, 169, 202),
         c(125, 185),
         150)

## Same, with named origin periods
triangle("2012" = c(100, 150, 175, 180, 200),
         "2013" = c(110, 168, 192, 205),
         "2014" = c(115, 169, 202),
         "2015" = c(125, 185),
         "2016" = 150)

## Again, with also named development periods
triangle("2012" = c("12 months" = 100,
                    "24 months" = 150,
                    "36 months" = 175,
                    "48 months" = 180,
                    "60 months" = 200),
         "2013" = c(110, 168, 192, 205),
         "2014" = c(115, 169, 202),
         "2015" = c(125, 185),
         "2016" = 150)

## Quick, simplified usage
triangle(c(100, 150, 175, 110, 168, 115))



