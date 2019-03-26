library(umx)


### Name: umx_read_lower
### Title: Read lower-triangle of data matrix from console or file
### Aliases: umx_read_lower

### ** Examples

require(umx) # for umxRAM
## Not run: 
##D df = umx_read_lower(file = "", diag = F, ensurePD=TRUE)
##D 0.38
##D 0.86	0.30
##D 0.42	0.12	0.27
##D 0.66	0.21	0.38	0.18
##D 0.80	0.13	0.50	0.25	0.43
##D 0.19	0.11	0.19	0.12	-0.06	0.22
##D 0.27	0.09	0.33	0.05	-0.04	0.28	.73
##D 0.52	0.17	0.38	0.37	0.39	0.44	0.18	0.13
##D 
##D IQtests = c("brainstorm", "matrix", "moral", "shopping", "typing")
##D n       = c("C", IQtests, "avgIQ", "maxIQ", "video")
##D 
##D dimnames(df) = list(n,n)
##D 
##D m1 = umxRAM("wooley", data = mxData(df, type="cov", numObs = 90),
##D 	umxPath("g", to = IQtests),
##D 	umxPath(var = "g", fixedAt=1),
##D 	umxPath(var = IQtests)
##D )
##D summary(m1)
## End(Not run)



