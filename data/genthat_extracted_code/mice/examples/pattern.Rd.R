library(mice)


### Name: pattern
### Title: Datasets with various missing data patterns
### Aliases: pattern pattern1 pattern2 pattern3 pattern4
### Keywords: datasets

### ** Examples

require(lattice)
require(MASS)

pattern4

data <- rbind(pattern1, pattern2, pattern3, pattern4)
mdpat <- cbind(expand.grid(rec = 8:1, pat = 1:4, var = 1:3), r=as.numeric(as.vector(is.na(data))))

types <-  c("Univariate","Monotone","File matching","General")
tp41 <- levelplot(r~var+rec|as.factor(pat), data=mdpat,
         as.table=TRUE, aspect="iso",
         shrink=c(0.9), 
         col.regions = mdc(1:2),
         colorkey=FALSE,
         scales=list(draw=FALSE),
         xlab="", ylab="",
         between = list(x=1,y=0),
         strip = strip.custom(bg = "grey95", style = 1,
           factor.levels = types))
print(tp41)

md.pattern(pattern4)
p <- md.pairs(pattern4)
p

### proportion of usable cases
p$mr/(p$mr+p$mm)

### outbound statistics
p$rm/(p$rm+p$rr)


fluxplot(pattern2)





