library(mixexp)


### Name: Fillv
### Title: This function Creates interior points in an existing mixture
###   design.
### Aliases: Fillv
### Keywords: datagen

### ** Examples


# Example 1 fills interior of Simplex Lattice Design
des<-SLD(3,3)
DesignPoints(des)
des2<-Fillv(3,des)
DesignPoints(des2)

# Example 2 fills interior of Simplex Centroid Design
des<-SCD(4)
Fillv(4,des)

# Example 3 fills interior of Extreme vertices design
ev<-Xvert(3,uc=c(.1,.1,1.0),lc=c(0,0,0),ndm=1)
ev2<-Fillv(3,ev)




