library(janeaustenr)


### Name: austen_books
### Title: Tidy data frame of Jane Austen's 6 completed, published novels
### Aliases: austen_books

### ** Examples


library(dplyr)

austen_books() %>% group_by(book) %>%
     summarise(total_lines = n())




