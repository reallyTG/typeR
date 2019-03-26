## ----include=FALSE-------------------------------------------------------
options(rdf_print_format = "nquads")

## ----message = FALSE, warning=FALSE--------------------------------------
library(rdflib)
library(dplyr)
library(tidyr)
library(tibble)
library(jsonld)

## ------------------------------------------------------------------------
car_triples <- 
mtcars %>% 
  rownames_to_column("Model") %>% 
  gather(attribute,measurement, -Model)

## ----echo=FALSE----------------------------------------------------------
DT::datatable(car_triples)

## ------------------------------------------------------------------------
car_triples <- 
mtcars %>% 
  rownames_to_column("Model") %>% 
  rowid_to_column("subject") %>% 
  gather(predicate, object, -subject)

## ----echo=FALSE----------------------------------------------------------
DT::datatable(car_triples)

## ------------------------------------------------------------------------
iris_triples <- iris %>%
  rowid_to_column("subject") %>%
  gather(key = predicate, value = object, -subject)

## ----echo=FALSE----------------------------------------------------------
DT::datatable(iris_triples)

## ------------------------------------------------------------------------
iris_triples <- iris %>%
  rowid_to_column("subject") %>%
  mutate(subject = paste0("http://example.com/iris#", subject)) %>%
  gather(key = predicate, value = object, -subject)


## ----echo=FALSE----------------------------------------------------------
DT::datatable(iris_triples)

## ----mesage = FALSE------------------------------------------------------
iris_triples <- iris %>%
  rowid_to_column("subject") %>%
  mutate(subject = paste0("http://example.com/iris#", subject)) %>%
  gather(key = predicate, value = object, -subject) %>%
  mutate(predicate = paste0("http://example.com/iris#", predicate))


## ----echo=FALSE----------------------------------------------------------
DT::datatable(iris_triples)

## ------------------------------------------------------------------------
rdf <- rdf()

## ------------------------------------------------------------------------
base <- "http://example.com/iris#"

rdf %>% 
  rdf_add(subject = paste0(base, "obs1"), 
          predicate = paste0(base, "Sepal.Length"), 
          object = 5.1)

rdf

## ------------------------------------------------------------------------
rdf <- rdf()
rdf %>% rdf_add("",   
                "iris:Sepal.Length", 
                object = 5.1)
rdf

## ------------------------------------------------------------------------
rdf_serialize(rdf, "rdf.nq", format = "nquads")

## ------------------------------------------------------------------------
doc <- system.file("extdata/example.rdf", package="redland")
rdf <- rdf_parse(doc, format = "rdfxml") 
rdf

## ------------------------------------------------------------------------
options(rdf_print_format = "rdfxml")
rdf

## ------------------------------------------------------------------------
options(rdf_print_format = "turtle")
rdf

## ------------------------------------------------------------------------
options(rdf_print_format = "jsonld")
rdf

## ------------------------------------------------------------------------
rdf_serialize(rdf, "example.json", "jsonld") %>% 
  jsonld_compact(context = '{"@vocab": "http://purl.org/dc/elements/1.1/"}')

## ------------------------------------------------------------------------
ex <- system.file("extdata/person.json", package="rdflib")
cat(readLines(ex), sep = "\n")
#jsonld_compact(ex, "{}")


## ------------------------------------------------------------------------
options(rdf_print_format = "nquads")
rdf <- rdf_parse(ex, "jsonld")
rdf

## ------------------------------------------------------------------------
jsonld_flatten(ex, context = "http://schema.org")

## ------------------------------------------------------------------------
jsonld_flatten(ex) %>%
  jsonld_frame('{"@type": "http://schema.org/Person"}') %>%
  jsonld_compact(context = "http://schema.org")

## ------------------------------------------------------------------------
as_rdf.list <- function(x, context = "http://schema.org"){
  if(length(x) == 1) x <- x[[1]]
  x[["@context"]] <- context
  json <- jsonlite::toJSON(x, pretty = TRUE, auto_unbox = TRUE, force = TRUE)
  rdflib::rdf_parse(json, "jsonld")
}

## ------------------------------------------------------------------------
context <- list("http://schema.org", 
                list(schema = "http://schema.org/",
                     given = "givenName",
                     family = "familyName",
                     title = "name",
                     year = "datePublished",
                     note = "softwareVersion",
                     comment = "identifier",
                     role = "http://www.loc.gov/marc/relators/relaterm.html"))


## ------------------------------------------------------------------------
options(rdf_print_format = "nquads") # go back to the default


R <- citation("rdflib")
rdf <- as_rdf.list(R, context)
rdf  

## ------------------------------------------------------------------------
#source(system.file("examples/as_rdf.R", package="rdflib"))
source(system.file("examples/tidy_schema.R", package="rdflib"))

## Testing: Digest some data.frames into RDF and extract back
 cars <- mtcars %>% rownames_to_column("Model")
 x1 <- as_rdf(iris, NULL, "iris:")
 x2 <- as_rdf(cars, NULL, "mtcars:")
 rdf <- c(x1,x2)

## ------------------------------------------------------------------------
sparql <-
  'SELECT  ?Species ?Sepal_Length ?Sepal_Width ?Petal_Length  ?Petal_Width
WHERE {
 ?s <iris:Species>  ?Species .
 ?s <iris:Sepal.Width>  ?Sepal_Width .
 ?s <iris:Sepal.Length>  ?Sepal_Length . 
 ?s <iris:Petal.Length>  ?Petal_Length .
 ?s <iris:Petal.Width>  ?Petal_Width 
}'

iris2 <- rdf_query(rdf, sparql)

## ----echo=FALSE----------------------------------------------------------
DT::datatable(iris2)

## ------------------------------------------------------------------------
sparql <- tidy_schema("Species",  "Sepal.Length", "Sepal.Width", prefix = "iris")

rdf_query(rdf, sparql)

