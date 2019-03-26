## ----style, echo=FALSE, results="asis", message=FALSE--------------------
knitr::opts_chunk$set(tidy = FALSE,
		   message = FALSE)

## ----echo=FALSE, results="hide", message=FALSE---------------------------
library("scholar")
library("ggplot2")
theme_set(theme_minimal())

## ------------------------------------------------------------------------
## Define the id for Richard Feynman
id <- 'B7vSqZsAAAAJ'

## Get his profile
l <- get_profile(id)

## Print his name and affliation
l$name
l$affiliation

## Print his citation index
l$h_index
l$i10_index

## ------------------------------------------------------------------------
## Get his publications (a large data frame)
p <- get_publications(id)
head(p, 3)

## ------------------------------------------------------------------------
## Get his citation history, i.e. citations to his work in a given year
ct <- get_citation_history(id)

## Plot citation trend
library(ggplot2)
ggplot(ct, aes(year, cites)) + geom_line() + geom_point()

## ------------------------------------------------------------------------
## The following publication will be used to demonstrate article citation history
as.character(p$title[1])

## Get article citation history
ach <- get_article_cite_history(id, p$pubid[1])

## Plot citation trend
ggplot(ach, aes(year, cites)) +
    geom_segment(aes(xend = year, yend = 0), size=1, color='darkgrey') +
    geom_point(size=3, color='firebrick')

## ------------------------------------------------------------------------
# Compare Feynman and Stephen Hawking
ids <- c('B7vSqZsAAAAJ', 'qj74uXkAAAAJ')

# Get a data frame comparing the number of citations to their work in
# a given year
cs <- compare_scholars(ids)

## remove some 'bad' records without sufficient information
cs <- subset(cs, !is.na(year) & year > 1900)
ggplot(cs, aes(year, cites, group=name, color=name)) + geom_line() + theme(legend.position="bottom")

## Compare their career trajectories, based on year of first citation
csc <- compare_scholar_careers(ids)
ggplot(csc, aes(career_year, cites, group=name, color=name)) + geom_line() + geom_point() +
    theme(legend.position=c(.2, .8))

## ------------------------------------------------------------------------
# Be careful with specifying too many coauthors as the visualization of the
# network can get very messy.
coauthor_network <- get_coauthors('amYIKXQAAAAJ&hl', n_coauthors = 7)

coauthor_network

## ------------------------------------------------------------------------
plot_coauthors(coauthor_network)

