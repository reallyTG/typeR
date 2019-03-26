suppressPackageStartupMessages(library(rgeos))
# g1 is invalid
g1 <- readWKT('POLYGON((0 0, 10 10, 0 10, 10 0, 0 0))')
g2 <- readWKT('POLYGON((2 2, 8 2, 8 8, 2 8, 2 2))')

# binary operators
try(g3 <- gUnion(g1, g2))
try(g3 <- gDifference(g1, g2))
try(g3 <- gIntersection(g1, g2))
try(g3 <- gSymdifference(g1, g2))

# unary operators
try(g3 <- gSimplify(g1, tol=0.1))
try(g3 <- gPolygonize(list(as(g1, "SpatialLines"))))
try(g3 <- gEnvelope(g1))
try(g3 <- gConvexHull(g1))
try(g3 <- gBoundary(g1))
try(g3 <- gCentroid(g1))
try(g3 <- gPointOnSurface(g1))

# binary predicates
try(res <- gContains(g1, g2))
try(res <- gIntersects(g1, g2))
try(res <- gContainsProperly(g1, g2))
try(res <- gCovers(g1, g2))
try(res <- gCoveredBy(g1, g2))
try(res <- gDisjoint(g1, g2))
try(res <- gTouches(g1, g2))
try(res <- gCrosses(g1, g2))
try(res <- gWithin(g1, g2))
try(res <- gOverlaps(g1, g2))
try(res <- gEquals(g1, g2))
try(res <- gEqualsExact(g1, g2))
try(res <- gRelate(g1, g2))

# unary predicates
try(res <- gIsEmpty(g1))
try(res <- gIsSimple(g1))
try(res <- gIsRing(g1))
try(res <- gIsValid(g1))
try(res <- gIsValid(g1, reason = TRUE))

