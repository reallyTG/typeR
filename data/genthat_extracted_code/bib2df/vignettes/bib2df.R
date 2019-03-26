## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  warning = FALSE
)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("bib2df")

## ------------------------------------------------------------------------
library(bib2df)

url <- "https://gist.githubusercontent.com/ottlngr/d709ab6c7de08d133435cb8c77699914/raw/153f2ec0be6d36c7dd9fa3389cc87f54ecf4da04/LiteratureOnCommonKnowledgeInGameTheory.bib"

df <- bib2df(url)
df

## ------------------------------------------------------------------------
head(df$AUTHOR)

## ------------------------------------------------------------------------
df <- bib2df(url, separate_names = TRUE)
head(df$AUTHOR)

## ------------------------------------------------------------------------
paths <- c("https://gist.githubusercontent.com/ottlngr/d709ab6c7de08d133435cb8c77699914/raw/153f2ec0be6d36c7dd9fa3389cc87f54ecf4da04/LiteratureOnCommonKnowledgeInGameTheory.bib", "https://raw.githubusercontent.com/ottlngr/bib2df/master/inst/extdata/biblio.bib")

x <- lapply(paths, bib2df)
class(x)
head(x)

res <- dplyr::bind_rows(x)
class(res)
head(res)

## ---- message=FALSE------------------------------------------------------
library(dplyr)
library(ggplot2)
library(tidyr)

df %>%
  filter(!is.na(JOURNAL)) %>%
  group_by(JOURNAL) %>%
  summarize(n = n()) %>%
  arrange(desc(n)) %>%
  slice(1:3)

## ------------------------------------------------------------------------
df %>%
  mutate(age = 2017 - YEAR) %>%
  summarize(m = median(age))

## ---- fig.height = 5, fig.width = 7--------------------------------------
df %>% 
  select(YEAR, AUTHOR) %>% 
  unnest() %>% 
  ggplot() + 
  aes(x = YEAR, y = reorder(full_name, desc(YEAR))) + 
  geom_point()

## ------------------------------------------------------------------------
df$AUTHOR[[10]]

## ------------------------------------------------------------------------
df$AUTHOR[[10]]$first_name[2] <- "Eddie"
df$AUTHOR[[10]]$full_name[2] <- "Eddie Dekel"

df$AUTHOR[[10]]

## ------------------------------------------------------------------------
newFile <- tempfile()
df2bib(df, file = newFile)

