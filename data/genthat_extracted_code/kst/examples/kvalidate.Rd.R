library(kst)


### Name: kvalidate
### Title: Validate Prerequisite Relations or Knowledge Structures
### Aliases: kvalidate
### Keywords: math

### ** Examples

kst <- kstructure(set(set("a"), set("a","b"), set("a","c"), set("d","e"), 
   set("a","b","d","e"), set("a","c","d","e"), set("a","b","c","d","e")))
rp <- data.frame(a=c(1,1,0,1,1,1,1,0,0,0),b=c(0,1,0,1,0,1,0,1,0,0),
   c=c(0,0,0,0,1,1,1,0,1,0),d=c(0,0,1,1,1,1,0,0,0,1), e=c(0,0,1,1,1,1,0,0,0,0))

# Gamma Index
kvalidate(kst, rpatterns=rp, method="gamma")

# Percent
kvalidate(kst, rpatterns=rp, method="percent")

# Violational Coefficient
kvalidate(kst, rpatterns=rp, method="VC")

# Discrepancy Index
kvalidate(kst, rpatterns=rp, method="DI")

# Distance Agreement Coefficient
kvalidate(kst, rpatterns=rp, method="DA")



