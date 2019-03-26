## ----knit, eval=FALSE, echo=FALSE----------------------------------------
#  # Hot to knit this document into .md and .html
#  library(knitr)
#  opts_knit$set(base.dir = "vignettes") # Change the base dir where to save figures
#  knit(input="vignettes/helsinki_tutorial.Rmd", output="vignettes/helsinki_tutorial.md")
#  knit2html(input="vignettes/helsinki_tutorial.md", output="vignettes/helsinki_tutorial.html", options=c("use_xhtml","smartypants","mathjax","highlight_code"))
#  file.remove("helsinki_tutorial.txt") # Fix to remove from the output

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("helsinki")

## ----install2, eval=FALSE------------------------------------------------
#  install.packages("devtools")
#  library(devtools)
#  install_github("helsinki", "ropengov")

## ----load, message=FALSE, warning=FALSE, results='hide'------------------
library(helsinki)

## ----aluejako_data, message=FALSE----------------------------------------
# Load aluejakokartat and study contents
data(aluejakokartat)
str(aluejakokartat, m=2)

## ----hsy_vaesto, warning=FALSE, eval=FALSE-------------------------------
#  sp.vaesto <- get_hsy(which.data="Vaestotietoruudukko", which.year=2013)
#  head(sp.vaesto@data)

## ----hsy_rakennus, warning=FALSE, eval=FALSE-----------------------------
#  sp.rakennus <- get_hsy(which.data="Rakennustietoruudukko", which.year=2013)
#  head(sp.rakennus@data)

## ----hsy_ramava, warning=FALSE, eval=FALSE-------------------------------
#  sp.ramava <- get_hsy(which.data="SeutuRAMAVA_tila", which.year=2013)
#  head(sp.ramava@data)
#  # Values with less than five units are given as 999999999, set those to zero
#  sp.ramava@data[sp.ramava@data==999999999] <- 0
#  # Plot number of buildings for each region
#  spplot(sp.ramava, zcol="RAKLKM", main="Number of buildings in each 'tilastoalue'", col.regions=colorRampPalette(c('blue', 'gray80', 'red'))(100))

## ----servicemap, message=FALSE, warning=FALSE----------------------------
# Search for "puisto" (park) (specify q="query")
search.puisto <- get_servicemap(query="search", q="puisto")
# Study results
str(search.puisto, m=1)
# A lot of results found (count > 1000)
# Get names for the first 20 results
sapply(search.puisto$results, function(x) x$name$fi)
# See what data is given for one service
names(search.puisto$results[[1]])
# More results could be retrieved by specifying 'page=2' etc.

## ----linkedevents, message=FALSE, warning=FALSE--------------------------
# Searh for current events
events <- get_linkedevents(query="event")
# Get names for the first 20 results
sapply(events$data, function(x) x$name$fi)
# See what data is given for the first event
names(events$data[[1]])

## ----hri_stats1, message=FALSE, warning=FALSE----------------------------
# Retrieve list of available data
stats.list <- get_hri_stats(query="")
# Show first results
head(stats.list)

## ----hri_stats2, message=FALSE, warning=FALSE----------------------------
# Retrieve a specific dataset
stats.res <- get_hri_stats(query=stats.list[1])
# Show the structure of the results
str(stats.res)

## ----citation, comment=NA------------------------------------------------
citation("helsinki")

## ----sessioninfo, message=FALSE, warning=FALSE---------------------------
sessionInfo()

