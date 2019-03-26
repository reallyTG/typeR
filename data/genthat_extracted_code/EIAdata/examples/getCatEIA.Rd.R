library(EIAdata)


### Name: getCatEIA
### Title: A function to view the sub and parent categories of an Energy
###   Information Administration (EIA) API data category.
### Aliases: getCatEIA

### ** Examples


## The function is currently defined as
function(key, cat=999999999){

  key <- unlist(strsplit(key, ";"))

  ifelse(cat==999999999,
         url <- paste("http://api.eia.gov/category?api_key=", 
		      key, "&out=xml", sep="" ),

         url <- paste("http://api.eia.gov/category?api_key=", 
		      key, "&category_id=", cat, "&out=xml", sep="" )
         )

  doc <- xmlParse(file=url, isURL=TRUE)

  Parent_Category <- tryCatch(xmlToDataFrame(nodes = 
	XML::getNodeSet(doc, "//category/parent_category_id")), 
        warning=function(w) FALSE, error=function(w) FALSE)

  Sub_Categories <- xmlToDataFrame(nodes = 
	XML::getNodeSet(doc, "//childcategories/row"))

  Series_IDs <- xmlToDataFrame(nodes = 
	XML::getNodeSet(doc, "///childseries/row"))

  Categories <- list(Parent_Category, Sub_Categories, Series_IDs)
  names(Categories) <- c("Parent_Category", "Sub_Categories", "Series_IDs")

  return(Categories)
}



