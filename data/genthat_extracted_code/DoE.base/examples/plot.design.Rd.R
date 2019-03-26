library(DoE.base)


### Name: Plotting class design objects
### Title: Plotting class design objects
### Aliases: plot.design
### Keywords: array design

### ** Examples

#### Examples for plotting designs
oa12 <- oa.design(nlevels=c(2,2,6))
  ## plotting a design without response (uses function mosaic from package vcd)
  plot(oa12)
  ## equivalent to mosaic(~A+B+C, oa12)
  ## alternative order: mosaic(~C+A+B, oa12)
  plot(oa12, select=c(3,1,2))
  ## using the select function: the plots show that the projection for factors
  ## C, D and E (columns 3, 14 and 15 of the array) is a full factorial,
  ## while A, D and E (columns 1, 14, and 15 of the array) do not occur in
  ## all combinations
  plan <- oa.design(L24.2.13.3.1.4.1,nlevels=c(2,2,2,3,4))
  plot(plan, select=c("E","D","A"))
  plot(plan, select=c("E","D","C"))
  ## Not run: 
##D   plot(plan, select="all3")
##D   plot(plan, select=list(c(1,3,4,5), "all3"))
##D   ## use the specialist version of option sub
##D   plot(plan, select=list(c(1,3,4,5), "all3"), sub="A")
##D   ## create a file with mosaic plots of all 3-factor projections
##D   pdf(file="exampleplots.pdf")
##D   plot(plan, select="all3", main="Design from L24.2.13.3.1.4.1 in default column order)")
##D   plot(plan, select="worst", selprop=0.3, sub="A")
##D   dev.off()
##D   ## the file exampleplots.pdf is now available within the current working
##D   ## directory
##D   
## End(Not run)

  ## plotting a design with response
  y=rnorm(12)
  plot(oa12, y)
  ## plot design with a response included
  oa12.r <- add.response(oa12,y)
  plot(oa12.r)
  ## plotting a numeric design (with or without response,
  ##   does not make statistical sense here, for demo only)
  noa12 <- qua.design(oa12, quantitative="all")
  plot(noa12, y, main="Scatter Plot Matrix")



