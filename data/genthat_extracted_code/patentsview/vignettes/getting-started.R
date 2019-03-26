## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(patentsview)

search_pv(
  query = '{"_gte":{"patent_date":"2007-01-01"}}',
  endpoint = "patents"
)

## ------------------------------------------------------------------------
qry_funs$gte(patent_date = "2007-01-01")

## ------------------------------------------------------------------------
with_qfuns(
  and(
    gte(patent_date = "2007-01-01"),
    text_phrase(patent_abstract = c("computer program", "dog leash"))
  )
)

## ------------------------------------------------------------------------
search_pv(
  query = '{"_gte":{"patent_date":"2007-01-01"}}',
  endpoint = "patents", 
  fields = c("patent_number", "patent_title")
)

## ------------------------------------------------------------------------
retrvble_flds <- get_fields(endpoint = "patents")
head(retrvble_flds)

## ------------------------------------------------------------------------
search_pv(
  query = qry_funs$eq(inventor_last_name = "chambers"),
  page = 2, per_page = 150 # gets records 150 - 300
) 

## ------------------------------------------------------------------------
search_pv(
  query = qry_funs$eq(inventor_last_name = "chambers"),
  all_pages = TRUE
)

## ------------------------------------------------------------------------
# Here we are using the patents endpoint
search_pv(
  query = qry_funs$eq(inventor_last_name = "chambers"), 
  endpoint = "patents", 
  fields = c("patent_number", "inventor_last_name", "assignee_organization")
)

## ------------------------------------------------------------------------
# While here we are using the assignees endpoint
search_pv(
  query = qry_funs$eq(inventor_last_name = "chambers"), 
  endpoint = "assignees", 
  fields = c("patent_number", "inventor_last_name", "assignee_organization")
)

## ------------------------------------------------------------------------
res <- search_pv(
  query = "{\"patent_number\":\"5116621\"}", 
  fields = c("patent_date", "patent_title", "patent_year")
)

# Right now all of the fields are stored as characters:
res

# Use more appropriate data types:
cast_pv_data(data = res$data)

## ------------------------------------------------------------------------
query <- with_qfuns(
  text_any(patent_abstract = 'tool animal')
)

## ------------------------------------------------------------------------
query_1a <- with_qfuns(
  and(
    text_any(patent_abstract = 'tool animal'),
    lte(patent_date = "2010-01-01")
  )
)

query_1b <- with_qfuns(
  and(
    text_any(patent_abstract = 'tool animal'),
    gt(patent_date = "2010-01-01")
  )
)

## ------------------------------------------------------------------------
# Create field list
asgn_flds <- c("assignee_id", "assignee_organization")
subent_flds <- get_fields("assignees", c("applications", "gov_interests"))
fields <- c(asgn_flds, subent_flds)

# Pull data
res <- search_pv(
  query = qry_funs$contains(inventor_last_name = "smith"), 
  endpoint = "assignees", 
  fields = fields
)
res$data

## ------------------------------------------------------------------------
library(tidyr)

# Get assignee/application data:
res$data$assignees %>% 
  unnest(applications) %>%
  head()

# Get assignee/gov_interest data:
res$data$assignees %>% 
  unnest(gov_interests) %>%
  head()

## ------------------------------------------------------------------------
unnest_pv_data(data = res$data, pk = "assignee_id")

