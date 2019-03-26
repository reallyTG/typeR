library(agridat)


### Name: sawyer.multi.uniformity
### Title: Uniformity trials of wheat, swedes, oats, 3 years on the same
###   land
### Aliases: sawyer.multi.uniformity
### Keywords: datasets

### ** Examples


data("sawyer.multi.uniformity")
dat <- sawyer.multi.uniformity

if(require(desplot)){
  # The field plan shows square plots
  desplot(grain~col*row, subset(dat, year==1925),
          main="sawyer.multi.uniformity - 1925 wheat grain yield",
          aspect=(6)/(8)) # true aspect
}
if(require(desplot)){
  desplot(rootwt~col*row, subset(dat, year==1926),
          main="sawyer.multi.uniformity - 1926 root weight of swedes",
          aspect=(6)/(8))
}
if(require(desplot)){
  desplot(grain~col*row, subset(dat, year==1927),
          main="sawyer.multi.uniformity - 1927 oats grain yield",
          aspect=(6)/(8))
}

## Not run: 
##D   # This plot shows the "outlier" in the wheat data reported by Mackenzie.
##D   require(lattice)
##D   xyplot(grain ~ straw, data=subset(dat, year==1925))
##D   
##D   round(cor(dat[,7:9], use="pair"),2) # Matches McCullagh p 2121
##D   ##        leafwt rootwt rootct
##D   ## leafwt   1.00   0.66   0.47
##D   ## rootwt   0.66   1.00   0.43
##D   ## rootct   0.47   0.43   1.00
##D   
##D   ## pairs(dat[,7:9],
##D   ##       main="sawyer.multi.uniformity")
## End(Not run)




