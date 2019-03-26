library(mapfit)


### Name: cf1-class
### Title: Class of canonical form 1 (PH distribution)
### Aliases: cf1-class
### Keywords: classes

### ** Examples

## create a CF1 with 5 phases
(param1 <- cf1(5))

## create a CF1 with 5 phases
(param1 <- cf1(size=5))

## create a CF1 with specific parameters
(param2 <- cf1(alpha=c(1,0,0), rate=c(1.0,2.0,3.0)))

## p.d.f. for 0, 0.1, ..., 1
(dph(x=seq(0, 1, 0.1), ph=param2))

## c.d.f. for 0, 0.1, ..., 1
(pph(q=seq(0, 1, 0.1), ph=param2))

## generate 10 samples (this is quiker than rph with general ph)
(rph(n=10, ph=param2))




