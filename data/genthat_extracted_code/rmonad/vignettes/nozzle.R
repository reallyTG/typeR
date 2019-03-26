## ------------------------------------------------------------------------
library(Nozzle.R1)
citation('Nozzle.R1')

## ---- eval=FALSE---------------------------------------------------------
#  m <- iris %>>% head(20) %v>% summary %v>% colSums
#  
#  r <- newCustomReport("Demo report")
#  r <- setMaintainerName(r, "Uriah Heep")
#  
#  s1 <- newSection("Pipeline overview")
#  
#  fig1 <- "p1.png"
#  png(fig1)
#  plot(m)
#  dev.off()
#  
#  s1 <- addTo(s1,
#    newFigure(fig1, "Pipeline graph"),
#    newTable(mtabulate(m), "Pipeline summary")
#  )
#  r <- addTo(r, s1)
#  
#  s2 <- newSection("Results")
#  s2 <- addTo(s2, newTable(get_value(m, 2)[[1]], get_code(m, 2)[[1]]))
#  s2 <- addTo(s2, newTable(get_value(m, 2)[[1]], get_code(m, 2)[[1]]))
#  r <- addTo(r, s2)
#  
#  if(any(has_error(m) | has_warnings(m))){
#      s3 <- newSection("Bad things")
#      s3 <- addTo(s3, newTable(missues(m), "Issues raised"))
#      r <- addTo(r, s3)
#  }
#  
#  writeReport(r, filename="demo")

