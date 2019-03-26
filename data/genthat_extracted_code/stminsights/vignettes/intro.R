## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE-------------------------------------------------------
#  library(stm)
#  library(quanteda)
#  
#  # prepare data
#  data <- corpus(gadarian, text_field = 'open.ended.response')
#  docvars(data)$text <- texts(data)
#  data <- dfm(data, stem = TRUE, remove = stopwords('english'),
#             remove_punct = TRUE) %>% dfm_trim(min_count = 2)
#  out <- convert(data, to = 'stm')
#  
#  # fit models and effect estimates
#  gadarian_3 <- stm(documents = out$documents,
#                   vocab = out$vocab,
#                   data = out$meta,
#                   prevalence = ~ treatment + s(pid_rep),
#                   K = 3, verbose = FALSE)
#  prep_3 <- estimateEffect(1:3 ~ treatment + s(pid_rep), gadarian_3,
#                          meta = out$meta)
#  gadarian_5 <- stm(documents = out$documents,
#                   vocab = out$vocab,
#                   data = out$meta,
#                   prevalence = ~ treatment + s(pid_rep),
#                   K = 5, verbose = FALSE)
#  prep_5 <- estimateEffect(1:5 ~ treatment + s(pid_rep), gadarian_5,
#                          meta = out$meta)
#  
#  # save objects in .RData file
#  save.image('stm_gadarian.RData')

## ---- eval = FALSE-------------------------------------------------------
#  library(stminsights)
#  run_stminsights()

