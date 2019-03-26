library(rKIN)


### Name: estMCP
### Title: Estimate Minimum Convex Polygon (MCP) Isotope Niche
### Aliases: estMCP

### ** Examples

library(rKIN)
data("rodents")
#estimate niche overlap between 2 species using minimum convex polygons
test.mcp<- estMCP(data=rodents, x="Ave_C", y="Ave_N", group="Species",
                   levels=c(50, 75, 95))
#determine polygon overlap for all polygons
plotKIN(test.mcp, scaler=2, title="Minimum Convex Hull Estimates", xlab="Ave_C", ylab="Ave_N")



