library(wql)


### Name: phenoPhase
### Title: Phenological phase
### Aliases: phenoPhase phenoPhase,ts-method phenoPhase,zoo-method
### Keywords: manip ts

### ** Examples


# ts example
y <- sfbayChla[, 's27']
p1 <- phenoPhase(y)
p1
apply(p1, 2, sd, na.rm=TRUE)  # max.time > fulcrum > mean.wt
phenoPhase(y, c(3, 10))

# zoo example
sfb <- wqData(sfbay, c(1,3,4), 5:12, site.order = TRUE, type = "wide",
  time.format = "%m/%d/%Y")
y <- tsMake(sfb, focus = 'chl', layer = c(0, 5), type = 'zoo')
phenoPhase(y[, 's27'])




