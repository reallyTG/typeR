## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(patentsview)

search_pv(query = qry_funs$gt(patent_num_cited_by_us_patents = 500))

## ------------------------------------------------------------------------
# Setting subent_cnts = TRUE will give us the subentity counts. Since inventors 
# are subentities for the patents endpoint, this means we will get their counts.
search_pv(
  query = qry_funs$gt(patent_num_cited_by_us_patents = 500),
  fields = c("patent_number", "inventor_id"), 
  subent_cnts = TRUE
)

## ------------------------------------------------------------------------
# Write the query
query <- with_qfuns(
  and(
    gte(patent_date = "2007-07-25"), # Dates are in yyyy-mm-dd format 
    contains(assignee_organization = "microsoft")
  )
)

# Create a field list
inv_fields <- get_fields(endpoint = "patents", groups = "inventors")
fields <- c(inv_fields, "patent_number")

# Pull the data
pv_out <- search_pv(query = query, fields = fields, all_pages = TRUE)

# Unnest the inventor list column
unnest_pv_data(data = pv_out$data, pk = "patent_number")

## ------------------------------------------------------------------------
search_pv(
  query = '{"_and":[{"location_city":"Chicago"},{"location_state":"IL"}]}',
  endpoint = "inventors", 
  fields = c("patent_number", "patent_title")
)

## ------------------------------------------------------------------------
search_pv(
  query = qry_funs$text_phrase(patent_title = "beer"), 
  endpoint = "assignees"
)

