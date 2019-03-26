## ----setUpLibrary, eval=TRUE, include=FALSE--------------------------------
library(Numero)

## ----legumes, eval=TRUE, echo=FALSE, fig.cap="A conceptual example. The example shows how to organize objects with multiple features into a two-dimensional layout. The images were obtained from @cardoso2014taxonomic."----
knitr::include_graphics("legumes.jpg")

## ----splitFig, eval=TRUE, echo=FALSE, fig.cap="Application of the split-by-variable study design in the diabetic kidney disease example. Of note, the training set is adjusted for sex differences; hence the ‘MALE’ column is not formally included in the evaluation set."----
knitr::include_graphics("split.jpg")

## ----pipeline, eval=TRUE, echo=FALSE, fig.cap="Analysis steps in the diabetic kidney disease example."----
knitr::include_graphics("pipeline.svg")

## ----setUpExample, eval=TRUE-----------------------------------------------
fname <- system.file("extdata", "finndiane_dataset.txt", 
                     package = "Numero")
db <- read.delim(file = fname, sep = "\t")
summary(db)

## ----preproc0, eval=TRUE---------------------------------------------------
trvars <- c("CREAT_log", "CHOL", "HDL2C", "TG_log", "uALB_log")

## ----preproc1, eval=TRUE---------------------------------------------------
db <- nroPreprocess(data = db, training = trvars, strata = "MALE",
                    key = "INDEX")

## ----preproc2, eval=TRUE---------------------------------------------------
men <- which(db$values[,'MALE'] == 1)
women <- which(db$values[,'MALE'] == 0)
print(summary(db$features[men,]))
print(summary(db$features[women,]))

## ----init1, eval=TRUE------------------------------------------------------
km <- nroKmeans(data = db$features, k = 3)

## ----init2, eval=TRUE------------------------------------------------------
print(km$centroids)

## ----init3, eval=TRUE------------------------------------------------------
sm <- nroKohonen(seeds = km$centroids, radius = 3)

## ----init4, eval=TRUE------------------------------------------------------
print(head(sm$centroids)) 

## ----train1, eval=TRUE-----------------------------------------------------
sm <- nroTrain(som = sm, data = db$features)

## ----train2, fig.cap = "SOM training history in the diabetic kidney disease example.", eval=TRUE----
plot(sm$history)

## ----match1, eval=TRUE-----------------------------------------------------
matches <- nroMatch(som = sm, data = db$features)

## ----match2, eval=TRUE-----------------------------------------------------
head(attr(matches,'quality'))

## ----match3, eval=TRUE-----------------------------------------------------
t <- table(matches)
counts <- data.frame(DISTRICT = names(t), N = as.integer(t))
print(counts, row.names = FALSE)

## ----permute1, eval=TRUE---------------------------------------------------
stats <- nroPermute(som = sm, data = db$values, 
                    districts = matches)

## ----permute2, eval=TRUE---------------------------------------------------
print(stats)

## ----color1, eval=TRUE-----------------------------------------------------
comps <- nroAggregate(topology = sm$topology, data = db$values,
                      districts = matches)

## ----color2, eval=TRUE-----------------------------------------------------
colrs <- nroColorize(values = comps, amplitudes = stats$AMPLITUDE)

## ----color3, eval=TRUE-----------------------------------------------------
labls <- nroLabel(topology = sm$topology, values = comps)

## ----gout0, eval=TRUE, fig.cap="Statistically normalized colorings of all variables in the kidney disease dataset. The color intensity depends on how likely the observed regional variation would arise by chance; intense reds and intense blues indicate that these extremes would be very unlikely if the data point layout was random."----
elem <- nroPlot(elements = sm$topology, colors = colrs,
                labels = labls, values = comps)

## ----gout1, eval=FALSE-----------------------------------------------------
#  nroPlot(elements = sm$topology, colors = colrs,
#                  labels = labls, values = comps, file = 'test.svg')

## ----quality0, eval=TRUE---------------------------------------------------
comps.qc <- nroAggregate(topology = sm$topology, 
                         data = attr(matches, "quality"),
                         districts = matches)

## ----quality1, eval=TRUE---------------------------------------------------
comps.qc$HISTOGRAM <- attr(comps.qc, "histogram")

## ----quality2, eval=TRUE---------------------------------------------------
colrs.qc <- nroColorize(values = comps.qc, palette = "fire")
labls.qc <- nroLabel(topology = sm$topology, values = comps.qc)

## ----quality3, eval=TRUE,  fig.cap="Visualization of SOM quality metrics. Light (dark) colors indicate high (low) values. The color intensity was not normalized statistically. Coverage indicates the proportion of usable data values, residuals indicate model fit (smaller value is better), quality is a scale-independent measure based on the residuals (larger is better). Finally, the histogram shows smoothed estimates on how many samples were assigned to each district."----
elem.qc <- nroPlot(elements=sm$topology, colors=colrs.qc,
                labels=labls.qc)

## ----biochemistry, eval=TRUE, fig.cap="Statistically normalized colorings of the training variables in the kidney disease dataset. The color intensity depends on how likely the observed regional variation would arise by chance; intense reds and intense blues indicate that these extremes would be very unlikely if the data point layout was random."----
trvars <- colnames(db$features)
elem <- nroPlot(elements=sm$topology, colors=colrs[,trvars],
                    labels=labls[,trvars])

## ----sub1, eval=FALSE------------------------------------------------------
#  trvars <- colnames(db$features)
#  elem <- nroPlot(elements=sm$topology, colors=colrs[,trvars],
#                      labels=labls[,trvars], interactive=TRUE)

## ----step1, eval=TRUE, echo=FALSE, fig.cap="Screenshot: Interactive definition of subgroups - step 1: Choosing the district with the highest creatinine value.", out.width = "650px"----
knitr::include_graphics("step1.jpg")

## ----step2, eval=TRUE, echo=FALSE, fig.cap="Screenshot: Interactive definition of subgroups - step 2: Choosing other districts with a higher creatinine value.", out.width = "650px"----
knitr::include_graphics("step2.jpg")

## ----step3, eval=TRUE, echo=FALSE, fig.cap="Screenshot: Interactive definition of subgroups - step 3: Subgroup name and confirmation."----
knitr::include_graphics("step3.jpg")

## ----step4, eval=TRUE, echo=FALSE, fig.cap="Screenshot: Interactive definition of subgroups - step 4: Updated interactive plot after subgroup confirmation.", out.width = "650px"----
knitr::include_graphics("step4.jpg")

## ----sub2, eval=FALSE------------------------------------------------------
#  nroPlot(elements=elem, colors=colrs, labels=labls, file="subgroups.svg")

## ----subGroupOverview, eval=TRUE, echo=FALSE, fig.cap="The five subgroups in the diabetic kidney disease example. The grouping is the result of the example interactive process. The SVG was pre-created by saving the results of the interactive process."----
knitr::include_graphics("subgroups.svg")

## ----sub3, eval=FALSE------------------------------------------------------
#  results <- nroSummary(data = db$values, districts = matches,
#                        regions = elem$REGION)

## ----sub3b, eval=TRUE, echo=FALSE, warning=FALSE---------------------------
results <- nroSummary(data = db$values, districts = matches,
                      regions = c("Low lipids", "High Creatinine", "High Cholesterol", "Low lipids", "Low lipids", "Low lipids", "Low lipids", "High Creatinine", "High triglycerides", "High Creatinine", "High Creatinine", "High Creatinine", "High Cholesterol", "High Cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "Low lipids", "Low lipids", "Low lipids", "Low lipids", "High triglycerides", "High Cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "High HDL2 cholesterol", "Low lipids", "Low lipids", "Low lipids", "Low lipids", "High triglycerides", "High triglycerides", "High triglycerides", "High Creatinine", "High Creatinine", "High Creatinine", "High Creatinine", "High Cholesterol"))

## ----sub4, eval=TRUE-------------------------------------------------------
results <- results[which(results$VARIABLE %in% c('DECEASED','DIAB_KIDNEY')),c('VARIABLE','SUBGROUP','MEAN','P.chisq')]

## ----sub5, eval=TRUE, echo=FALSE-------------------------------------------
knitr::kable(
 results[order(results$VARIABLE),], row.names = FALSE, caption = 'Comparison of metabolic subgroups in individuals with type 1 diabetes for mortality and diabetic kidney disease.'
)

## ----cit, eval=TRUE--------------------------------------------------------
citation('Numero')

