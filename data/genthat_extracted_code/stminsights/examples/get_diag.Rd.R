library(stminsights)


### Name: get_diag
### Title: computes stm model diagnostics
### Aliases: get_diag

### ** Examples


library(stm)
library(dplyr)
library(ggplot2)
library(quanteda)

# prepare data
data <- corpus(gadarian, text_field = 'open.ended.response')
docvars(data)$text <- texts(data)
data <- dfm(data, stem = TRUE, remove = stopwords('english'),
            remove_punct = TRUE)
out <- convert(data, to = 'stm')

# fit models
gadarian_3 <- stm(documents = out$documents,
                  vocab = out$vocab,
                  data = out$meta,
                  prevalence = ~ treatment + s(pid_rep),
                  K = 3,
                  max.em.its = 1, # reduce computation time for example
                  verbose = FALSE)

gadarian_5 <- stm(documents = out$documents,
                  vocab = out$vocab,
                  data = out$meta,
                  prevalence = ~ treatment + s(pid_rep),
                  K = 5,
                  max.em.its = 1, # reduce computation time for example
                  verbose = FALSE)

# get diagnostics
diag <- get_diag(models = list(
                 model_3 = gadarian_3,
                 model_5 = gadarian_5),
                 outobj = out)
## Not run: 
##D # plot diagnostics
##D diag %>%
##D ggplot(aes(x = coherence, y = exclusivity, color = statistic))  +
##D   geom_text(aes(label = name), nudge_x = 5) + geom_point() +
##D   labs(x = 'Semantic Coherence', y = 'Exclusivity') + theme_light()
## End(Not run)




