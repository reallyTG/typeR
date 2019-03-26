library(pscl)


### Name: UKHouseOfCommons
### Title: 1992 United Kingdom electoral returns
### Aliases: UKHouseOfCommons
### Keywords: datasets

### ** Examples

data(UKHouseOfCommons)
tmp <- UKHouseOfCommons[,c("v1","v2","v3")] 
summary(apply(tmp,1,sum))

col <- rep("black",dim(tmp)[1])
col[UKHouseOfCommons$coninc==1] <- "blue"
col[UKHouseOfCommons$labinc==1] <- "red"
col[UKHouseOfCommons$libinc==1] <- "orange"

library(vcd)
vcd::ternaryplot(tmp,
                 dimnames=c("Cons","Lab","Lib-Dem"),
                 labels="outside",
                 col=col,
                 pch=1,
                 main="1992 UK House of Commons Election",
                 cex=.75)



