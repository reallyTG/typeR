## ---- echo=FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  echo = TRUE,
  fig.width = 7,
  fig.height = 4
)
options(scipen = 999, digits = 2)
knitr::knit_hooks$set(inline = function(x) {
      if(is.numeric(x)){
          return(prettyNum(x, big.mark=","))
      }else{
          return(x)
       }
   })

## ------------------------------------------------------------------------
library(europepmc)
europepmc::epmc_hits_trend(query = "aspirin", period = 2010:2016)

## ---- fig.align='center'-------------------------------------------------
tt_oa <- europepmc::epmc_hits_trend("OPEN_ACCESS:Y", period = 1995:2016, synonym = FALSE)
tt_oa
# we use ggplot2 for plotting the graph
library(ggplot2)
ggplot(tt_oa, aes(year, query_hits / all_hits)) + 
  geom_point() + 
  geom_line() +
  xlab("Year published") + 
  ylab("Proportion of OA full-texts in Europe PMC")

## ------------------------------------------------------------------------
dvcs <- c("code.google.com", "github.com", 
          "sourceforge.net", "bitbucket.org", "cran.r-project.org")
# make queries including reference section
dvcs_query <- paste0('REF:"', dvcs, '"')

## ------------------------------------------------------------------------
library(dplyr)
my_df <- purrr::map_df(dvcs_query, function(x) {
  # get number of publications with indexed reference lists
  refs_hits <- 
    europepmc::epmc_hits_trend("has_reflist:y", period = 2009:2016, synonym = FALSE)$query_hits
  # get hit count querying for code repositories 
  europepmc::epmc_hits_trend(x, period = 2009:2016, synonym = FALSE) %>% 
    dplyr::mutate(query_id = x) %>%
    dplyr::mutate(refs_hits = refs_hits) %>%
    dplyr::select(year, all_hits, refs_hits, query_hits, query_id)
}) 
my_df

### total
hits_summary <- my_df %>% 
  group_by(query_id) %>% 
  summarise(all = sum(query_hits)) %>% 
  arrange(desc(all))
hits_summary

## ------------------------------------------------------------------------
library(ggplot2)
ggplot(my_df, aes(factor(year), query_hits / refs_hits, group = query_id, 
                  color = query_id)) +
  geom_line(size = 1, alpha = 0.8) +
  geom_point(size = 2) +
  scale_color_brewer(name = "Query", palette = "Set1")+
  xlab("Year published") +
  ylab("Proportion of articles in Europe PMC")

