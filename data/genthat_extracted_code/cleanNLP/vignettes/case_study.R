## ----setup, include=FALSE------------------------------------------------
# CRAN will not have spaCy installed, so create static vignette
knitr::opts_chunk$set(eval = FALSE)

## ---- echo = FALSE-------------------------------------------------------
#  library(magrittr)
#  library(ggplot2)
#  library(cleanNLP)
#  
#  sotu <- readRDS("~/files/sotu/sotu.rds")

## ------------------------------------------------------------------------
#  cnlp_get_token(sotu) %>%
#    group_by(id, sid) %>%
#    summarize(sent_len = n()) %$%
#    quantile(sent_len, seq(0,1,0.1))

## ------------------------------------------------------------------------
#  cnlp_get_token(sotu) %>%
#    filter(upos == "NOUN") %>%
#    group_by(lemma) %>%
#    summarize(count = n()) %>%
#    top_n(n = 42, count) %>%
#    arrange(desc(count)) %>%
#    use_series(lemma)

## ------------------------------------------------------------------------
#  cnlp_get_token(sotu) %>%
#    group_by(id) %>%
#    summarize(n = n()) %>%
#    left_join(cnlp_get_document(sotu)) %>%
#    ggplot(aes(year, n)) +
#      geom_line(color = grey(0.8)) +
#      geom_point(aes(color = sotu_type)) +
#      geom_smooth()

## ---- out.width = "680px", eval = TRUE, echo = FALSE---------------------
knitr::include_graphics("figs/num_tokens.png")

## ------------------------------------------------------------------------
#  cnlp_get_entity(sotu) %>%
#    filter(entity_type == "LOCATION") %>%
#    group_by(entity) %>%
#    summarize(count = n()) %>%
#    top_n(n = 44) %>%
#    arrange(desc(count)) %>%
#    use_series(entity)

## ------------------------------------------------------------------------
#  cnlp_get_dependency(sotu, get_token = TRUE) %>%
#    left_join(cnlp_get_document(sotu)) %>%
#    filter(year == 2001) %>%
#    filter(relation == "dobj") %>%
#    select(id = id, start = word, word = lemma_target) %>%
#    left_join(word_frequency) %>%
#    filter(frequency < 0.0005) %>%
#    select(id, start, word) %$%
#    sprintf("%s => %s", start, word)

## ------------------------------------------------------------------------
#  cnlp_get_dependency(sotu, get_token = TRUE) %>%
#    left_join(cnlp_get_document(sotu)) %>%
#    filter(year == 2002) %>%
#    filter(relation == "dobj") %>%
#    select(id = id, start = word, word = lemma_target) %>%
#    left_join(word_frequency) %>%
#    filter(frequency < 0.0005) %>%
#    select(id, start, word) %$%
#    sprintf("%s => %s", start, word)

## ------------------------------------------------------------------------
#  pca <- cnlp_get_token(sotu) %>%
#    filter(pos %in% c("NN", "NNS")) %>%
#    cnlp_get_tfidf(min_df = 0.05, max_df = 0.95, type = "tfidf", tf_weight = "dnorm") %>%
#    cnlp_pca(cnlp_get_document(sotu))

## ---- out.width = "680px", eval = TRUE, echo = FALSE---------------------
knitr::include_graphics("figs/pca_plot.png")

## ------------------------------------------------------------------------
#  library(topicmodels)
#  tm <- cnlp_get_token(sotu) %>%
#    filter(pos %in% c("NN", "NNS")) %>%
#    cnlp_get_tfidf(min_df = 0.05, max_df = 0.95, type = "tf", tf_weight = "raw") %$%
#    LDA(tf, k = 16, control = list(verbose = 1))

## ---- out.width = "680px", eval = TRUE, echo = FALSE---------------------
knitr::include_graphics("figs/tm_sotu.png")

## ------------------------------------------------------------------------
#  df <- cnlp_get_token(sotu) %>%
#    left_join(cnlp_get_document(sotu)) %>%
#    filter(year > 2000) %>%
#    mutate(new_id = paste(id, sid, sep = "-")) %>%
#    filter(pos %in% c("NN", "NNS"))
#  mat <- cnlp_get_tfidf(df, min_df = 0, max_df = 1, type = "tf",
#                   tf_weight = "raw", doc_var = "new_id")

## ------------------------------------------------------------------------
#  meta <- data_frame(new_id = mat$doc_) %>%
#    left_join(df[!duplicated(df$new_id),]) %>%
#    mutate(y = as.numeric(president == "Barack Obama")) %>%
#    mutate(train = year %in% seq(2001,2016, by = 2))

## ------------------------------------------------------------------------
#  library(glmnet)
#  model <- cv.glmnet(mat$tf[meta$train,], meta$y[meta$train], family = "binomial")

## ---- out.width = "680px", eval = TRUE, echo = FALSE---------------------
knitr::include_graphics("figs/glmnet_plot.png")

## ------------------------------------------------------------------------
#  beta <- coef(model, s = model[["lambda"]][11])[-1]
#  sprintf("%s (%d)", mat$vocab, sign(beta))[beta != 0]

