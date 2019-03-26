## ---- include=FALSE------------------------------------------------------
library(httptest)
start_vignette("vignette-name")

## ----message=FALSE, warning=FALSE, paged.print=FALSE---------------------
library(purrr)
library(dkanr)
library(dplyr)
dkanr_setup(url = 'https://data.louisvilleky.gov')

## ----message=FALSE, warning=FALSE, paged.print=FALSE, eval=FALSE---------
#  dkanr_setup(url = 'http://demo.getdkan.com',
#              username = 'my_username',
#              password = 'my_password')

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
dkanr_settings()

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
# Get a list of all datasets
resp <- list_nodes_all(filters = c(type = 'dataset'), as = 'df')
# Print the first 10 datasets
resp %>%
  select(nid, title, uri) %>%
  arrange(title) %>%
  head(n = 10)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
# Print only the "Active Permits" dataset information
resp %>%
  filter(title == 'Active Permits') %>%
  select(nid, title, uri, type)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
metadata <- retrieve_node(nid ='8216', as = 'list')
metadata

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
# All metadata fields
names(metadata)[1:30]

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
# Access specific metadata fields
metadata$title

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
get_resource_nids(metadata)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
metadata_rs <- retrieve_node(nid ='8221', as = 'list')
metadata_rs

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
get_resource_url(metadata_rs)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE----------
ds_is_available(metadata_rs)

## ----echo=TRUE, message=FALSE, warning=FALSE, paged.print=FALSE, eval=FALSE----
#  ds_search_all(resource_id = metadata_rs$uuid, as = 'df') %>%
#    select(PERMITNUMBER, PERMITTYPE, STATUS, SQUAREFEET)

## ----echo=FALSE, message=FALSE, warning=FALSE, paged.print=FALSE---------
temp <- ds_search(resource_id = metadata_rs$uuid)
dplyr::bind_rows(temp) %>%
  select(PERMITNUMBER, PERMITTYPE, STATUS, SQUAREFEET)

## ---- include=FALSE------------------------------------------------------
end_vignette()

