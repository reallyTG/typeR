library(RandVar)


### Name: RandVariable-class
### Title: Random variable
### Aliases: RandVariable-class Map Domain Range compatibleDomains
###   Map,RandVariable-method Domain,RandVariable-method
###   Range,RandVariable-method Map<- Domain<- Range<-
###   Map<-,RandVariable-method Domain<-,RandVariable-method
###   Range<-,RandVariable-method
###   compatibleDomains,RandVariable,RandVariable-method
###   length,RandVariable-method show,RandVariable-method
### Keywords: classes

### ** Examples

(R1 <- new("RandVariable"))
Map(R1)
Domain(R1)
Range(R1)
Map(R1) <- list(function(x){ceiling(x)}, function(x){floor(x)})
Domain(R1) <- Reals()
Range(R1) <- Naturals()
R1
Map(R1)
length(R1)

R2 <- R1
Domain(R2) <- Naturals()
compatibleDomains(R1, R2)
Domain(R2) <- NULL
compatibleDomains(R1, R2)
Domain(R2) <- EuclideanSpace(dimension = 1)
compatibleDomains(R1, R2)
Domain(R2) <- EuclideanSpace(dimension = 2)
compatibleDomains(R1, R2)



