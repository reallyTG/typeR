library(jstor)


### Name: jst_unify_journal_id
### Title: Unify journal IDs
### Aliases: jst_unify_journal_id

### ** Examples

article <- jst_get_article(jst_example("article_with_references.xml"))

jst_unify_journal_id(article)


# per default, original columns with data on the journal are removed
library(dplyr)

jst_unify_journal_id(article) %>% 
  select(contains("journal")) %>% 
  names()
  
# you can keep them by setting `remove_cols` to `FALSE`
jst_unify_journal_id(article, remove_cols = FALSE) %>%  
  select(contains("journal")) %>%
  names()



