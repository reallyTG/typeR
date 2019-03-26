## ------------------------------------------------------------------------
library(roadoi)
roadoi::oadoi_fetch(dois = c("10.1186/s12864-016-2566-9",
                             "10.1103/physreve.88.012814"), 
                    email = "najko.jahn@gmail.com")

## ------------------------------------------------------------------------
library(dplyr)
roadoi::oadoi_fetch(dois = c("10.1186/s12864-016-2566-9",
                             "10.1103/physreve.88.012814"), 
                    email = "najko.jahn@gmail.com") %>%
  dplyr::mutate(
    urls = purrr::map(best_oa_location, "url") %>% 
                  purrr::map_if(purrr::is_empty, ~ NA_character_) %>% 
                  purrr::flatten_chr()
                ) %>%
  .$urls

## ------------------------------------------------------------------------
library(dplyr)
roadoi::oadoi_fetch(dois = c("10.1186/s12864-016-2566-9",
                             "10.1103/physreve.88.012814"), 
                    email = "najko.jahn@gmail.com") %>%
  tidyr::unnest(oa_locations) %>% 
  dplyr::mutate(
    hostname = purrr::map(url, httr::parse_url) %>% 
                  purrr::map_chr(., "hostname", .null = NA_integer_)
                ) %>% 
  dplyr::mutate(hostname = gsub("www.", "", hostname)) %>%
  dplyr::group_by(hostname) %>%
  dplyr::summarize(hosts = n())

## ------------------------------------------------------------------------
roadoi::oadoi_fetch(dois = c("10.1186/s12864-016-2566-9",
                             "10.1103/physreve.88.012814"), 
                    email = "najko.jahn@gmail.com", 
                    .progress = "text")

## ------------------------------------------------------------------------
random_dois <-  c("ldld", "10.1038/ng.3260", "§dldl  ")
my_data <- purrr::map(random_dois, 
              .f = purrr::safely(function(x) roadoi::oadoi_fetch(x, email ="najko.jahn@gmail.com")))
# return results as data.frame
purrr::map_df(my_data, "result")
#show errors
purrr::map(my_data, "error")


## ---- message=FALSE------------------------------------------------------
library(dplyr)
library(rcrossref)
# get a random sample of DOIs and metadata describing these works
random_dois <- rcrossref::cr_r(sample = 100) %>%
  rcrossref::cr_works() %>%
  .$data
random_dois

## ------------------------------------------------------------------------
random_dois %>%
  # convert to years
  mutate(issued, issued = lubridate::parse_date_time(issued, c('y', 'ymd', 'ym'))) %>%
  mutate(issued, issued = lubridate::year(issued)) %>%
  group_by(issued) %>%
  summarize(pubs = n()) %>%
  arrange(desc(pubs))

## ------------------------------------------------------------------------
random_dois %>%
  group_by(type) %>%
  summarize(pubs = n()) %>%
  arrange(desc(pubs))

## ------------------------------------------------------------------------
oa_df <- purrr::map(random_dois$doi, .f = purrr::safely(
  function(x) roadoi::oadoi_fetch(x, email = "najko.jahn@gmail.com")
  )) %>%
  purrr::map_df("result")

## ------------------------------------------------------------------------
my_df <- random_dois %>%
  select(doi, type) %>% 
  left_join(oa_df, by = c("doi" = "doi"))

## ---- results='asis'-----------------------------------------------------
my_df %>%
  group_by(is_oa) %>%
  summarise(Articles = n()) %>%
  mutate(Proportion = Articles / sum(Articles)) %>%
  arrange(desc(Articles)) %>%
  knitr::kable()

## ---- results='asis'-----------------------------------------------------
my_df %>%
  filter(is_oa == TRUE) %>%
  tidyr::unnest(best_oa_location) %>% 
  group_by(evidence, type) %>%
  summarise(Articles = n()) %>%
  arrange(desc(Articles)) %>%
  knitr::kable()

