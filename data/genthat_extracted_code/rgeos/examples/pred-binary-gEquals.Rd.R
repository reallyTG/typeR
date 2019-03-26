library(rgeos)


### Name: gEquals
### Title: Geometry Relationships - Equality
### Aliases: gEquals RGEOSEquals gEqualsExact RGEOSEqualsExact
### Keywords: spatial

### ** Examples


# p1 and p2 are spatially identical but not exactly identical due to point ordering
p1=readWKT("POLYGON((0 0,1 0,1 1,0 1,0 0))")
p2=readWKT("POLYGON((1 1,0 1,0 0,1 0,1 1))")
p3=readWKT("POLYGON((0.01 0.01,1.01 0.01,1.01 1.01,0.01 1.01,0.01 0.01))")

gEquals(p1,p2)
gEquals(p1,p3)
gEqualsExact(p1,p2)
gEqualsExact(p1,p3,tol=0)
gEqualsExact(p1,p3,tol=0.1)

# pt1 and p2t are spatially identical but not exactly identical due to point ordering
pt1 = readWKT("MULTIPOINT(1 1,2 2,3 3)")
pt2 = readWKT("MULTIPOINT(3 3,2 2,1 1)")
pt3 = readWKT("MULTIPOINT(1.01 1.01,2.01 2.01,3.01 3.01)")

gEquals(pt1,pt2)
gEquals(pt1,pt3)
gEqualsExact(pt1,pt2)
gEqualsExact(pt1,pt3,tol=0)
gEqualsExact(pt1,pt3,tol=0.1)


# l2 contains a point that l1 does not
l1 = readWKT("LINESTRING (10 10, 20 20)")
l2 = readWKT("LINESTRING (10 10, 15 15,20 20)")
gEquals(l1,l2)
gEqualsExact(l1,l2)




