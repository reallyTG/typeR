library(agridat)


### Name: magistad.pineapple.uniformity
### Title: Uniformity trial of pineapple
### Aliases: magistad.pineapple.uniformity
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D   data(magistad.pineapple.uniformity)
##D   dat <- magistad.pineapple.uniformity
##D 
##D   # match table page 641
##D   ## dat ##D 
##D   ##   summarize(number=mean(number),
##D   ##             weight=mean(weight)) ##D 
##D   ##   field   number   weight
##D   ## 1     1 596.4062 2499.922
##D   ## 2    19 171.1667 2100.250
##D   ## 3    21 171.1600 2056.800
##D   ## 4    82 220.7500 1264.500
##D   
##D   require(desplot)
##D   desplot(weight ~ col*row, dat,
##D           subset=field==1,
##D           aspect=2400/48,
##D           main="magistad.pineapple.uniformity - field 1")          
##D   desplot(weight ~ col*row, dat,
##D           subset=field==19,
##D           aspect=300/39,
##D           main="magistad.pineapple.uniformity - field 19")
##D   desplot(weight ~ col*row, dat,
##D           subset=field==82,
##D           aspect=228/192,
##D           main="magistad.pineapple.uniformity - field 82")          
##D   desplot(weight ~ col*row, dat,
##D           subset=field==21,
##D           aspect=300/112.5,
##D           main="magistad.pineapple.uniformity - field 21")
##D   
## End(Not run)



