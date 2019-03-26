library(corpustools)


### Name: tCorpus$search_contexts
### Title: Search for documents or sentences using Boolean queries
### Aliases: tCorpus$search_contexts search_contexts

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)
tc$get() ## (example uses letters instead of words for simple query examples)

hits = tc$search_contexts(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'))
hits          ## print shows number of hits
hits$hits     ## hits is a list, with hits$hits being a data.frame with specific contexts
summary(hits) ## summary gives hits per query

## sentence level
hits = tc$search_contexts(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'),
                          context_level = 'sentence')
hits$hits     ## hits is a list, with hits$hits being a data.frame with specific contexts


## query language examples

## single term
tc$search_contexts('A')$hits

tc$search_contexts('G*')$hits    ## wildcard *
tc$search_contexts('*G')$hits    ## wildcard *
tc$search_contexts('G*G')$hits   ## wildcard *

tc$search_contexts('G?G')$hits   ## wildcard ?
tc$search_contexts('G?')$hits    ## wildcard ? (no hits)

## boolean
tc$search_contexts('A AND B')$hits
tc$search_contexts('A AND D')$hits
tc$search_contexts('A AND (B OR D)')$hits

tc$search_contexts('A NOT B')$hits
tc$search_contexts('A NOT (B OR D)')$hits


## sequence search (adjacent words)
tc$search_contexts('"A B"')$hits
tc$search_contexts('"A C"')$hits ## no hit, because not adjacent

tc$search_contexts('"A (B OR D)"')$hits ## can contain nested OR
## cannot contain nested AND or NOT!!

tc$search_contexts('<A B>')$hits ## can also use <> instead of "".

## proximity search (using ~ flag)
tc$search_contexts('"A C"~5')$hits ## A AND C within a 5 word window
tc$search_contexts('"A C"~1')$hits ## no hit, because A and C more than 1 word apart

tc$search_contexts('"A (B OR D)"~5')$hits ## can contain nested OR
tc$search_contexts('"A <B C>"~5')$hits    ## can contain nested sequence (must use <>)
tc$search_contexts('<A <B C>>~5')$hits    ## (<> is always OK, but cannot nest quotes in quotes)
## cannot contain nested AND or NOT!!


## case sensitive search
tc$search_contexts('g')$hits     ## normally case insensitive
tc$search_contexts('g~s')$hits   ## use ~s flag to make term case sensitive

tc$search_contexts('(a OR g)~s')$hits   ## use ~s flag on everything between parentheses
tc$search_contexts('(a OR G)~s')$hits   ## use ~s flag on everything between parentheses

tc$search_contexts('"a b"~s')$hits   ## use ~s flag on everything between quotes
tc$search_contexts('"A B"~s')$hits   ## use ~s flag on everything between quotes



