library(SNSequate)


### Name: le.eq
### Title: Local equating methods
### Aliases: le.eq le.eq.default
### Keywords: local equating

### ** Examples

## Artificial data for two 5-items tests forms. Both forms are assumed
## being fitted by a 3PL model.

## Create (artificial) item parameters matrices for test form X and Y
ai<-c(1,0.8,1.2,1.1,0.9)
bi<-c(-2,-1,0,1,2)
ci<-c(0.1,0.15,0.05,0.1,0.2)
itx<-rbind(bi,ai,ci)
ai<-c(0.5,1.4,1.2,0.8,1)
bi<-c(-1,-0.5,1,1.5,0)
ci<-c(0.1,0.2,0.1,0.15,0.1)
ity<-rbind(bi,ai,ci)

#Two individuals with different ability (1 and 2) obtain the same score 2.
#Their corresponding equated scores values are:
le.eq(c(2,2),itx,ity,c(1,2))




