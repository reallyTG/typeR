library(corpustools)


### Name: tCorpus$search_features
### Title: Find tokens using a Lucene-like search query
### Aliases: tCorpus$search_features search_features

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)
tc$get() ## (example uses letters instead of words for simple query examples)

hits = tc$search_features(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'))
hits          ## print shows number of hits
hits$hits     ## hits is a list, with hits$hits being a data.frame with specific features
summary(hits) ## summary gives hits per query

## sentence level
hits = tc$search_features(c('query label# A AND B', 'second query# (A AND Q) OR ("D E") OR I'),
                          context_level = 'sentence')
hits$hits     ## hits is a list, with hits$hits being a data.frame with specific features


## query language examples

## single term
tc$search_features('A')$hits

tc$search_features('G*')$hits    ## wildcard *
tc$search_features('*G')$hits    ## wildcard *
tc$search_features('G*G')$hits   ## wildcard *

tc$search_features('G?G')$hits   ## wildcard ?
tc$search_features('G?')$hits    ## wildcard ? (no hits)

## boolean
tc$search_features('A AND B')$hits
tc$search_features('A AND D')$hits
tc$search_features('A AND (B OR D)')$hits

tc$search_features('A NOT B')$hits
tc$search_features('A NOT (B OR D)')$hits


## sequence search (adjacent words)
tc$search_features('"A B"')$hits
tc$search_features('"A C"')$hits ## no hit, because not adjacent

tc$search_features('"A (B OR D)"')$hits ## can contain nested OR
## cannot contain nested AND or NOT!!

tc$search_features('<A B>')$hits ## can also use <> instead of "".

## proximity search (using ~ flag)
tc$search_features('"A C"~5')$hits ## A AND C within a 5 word window
tc$search_features('"A C"~1')$hits ## no hit, because A and C more than 1 word apart

tc$search_features('"A (B OR D)"~5')$hits ## can contain nested OR
tc$search_features('"A <B C>"~5')$hits    ## can contain nested sequence (must use <>)
tc$search_features('<A <B C>>~5')$hits    ## <> is always OK, but cannot nest "" in ""
## cannot contain nested AND or NOT!!

## case sensitive search (~s flag)
tc$search_features('g')$hits     ## normally case insensitive
tc$search_features('g~s')$hits   ## use ~s flag to make term case sensitive

tc$search_features('(a OR g)~s')$hits   ## use ~s flag on everything between parentheses
tc$search_features('(a OR G)~s')$hits

tc$search_features('"a b"~s')$hits   ## use ~s flag on everything between quotes
tc$search_features('"A B"~s')$hits   ## use ~s flag on everything between quotes

## ghost terms (~g flag)
tc$search_features('A AND B~g')$hits    ## ghost term (~g) has to occur, but is not returned
tc$search_features('A AND Q~g')$hits    ## no hi

# (can also be used on parentheses/quotes/anglebrackets for all nested terms)


## "unique_hits" versus "features" mode
tc = create_tcorpus('A A B')

tc$search_features('A AND B')$hits ## in "unique_hits" (default), only match full queries
# (B is not repeated to find a second match of A AND B)

tc$search_features('A AND B', mode = 'features')$hits ## in "features", match any match
# (note that hit_id in features mode is irrelevant)

# ghost terms (used for conditions) can be repeated
tc$search_features('A AND B~g')$hits

## Not run: 
##D ## advanced queries
##D tc = tokens_to_tcorpus(corenlp_tokens, doc_col = 'doc_id',
##D                        sentence_col = 'sentence', token_id_col = 'id')
##D head(tc$get()) ## search in multiple feature columns with "columnname: "
##D 
##D ## using the sub/flag query to find only mary as a direct object
##D hits = tc$search_features('mary~{relation: dobj}', context_level = 'sentence')
##D hits$hits
##D 
##D ## add a second sub query
##D hits = tc$search_features('mary~{relation: dobj, parent: 12 20}', context_level = 'sentence')
##D hits$hits
##D 
##D ## selecting from a different column without changing the feature column
##D ## (can be used to combine columns)
##D hits = tc$search_features('relation: nsubj')
##D hits$hits
##D 
##D hits = tc$search_features('(relation: nsubj) AND mary~g{relation: dobj}',
##D                           context_level = 'sentence')
##D hits$hits
##D 
##D ## sequence: nsubj say*
##D hits = tc$search_features('"(relation: nsubj) say*"')
##D hits$hits
## End(Not run)



