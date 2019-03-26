library(AhoCorasickTrie)


### Name: AhoCorasickSearch
### Title: Fast searching for one or more keywords in one or more texts
### Aliases: AhoCorasickSearch

### ** Examples

listEquals = function(a, b) { is.null(unlist(a)) && is.null(unlist(b)) ||
                              !is.null(a) && !is.null(b) && all(unlist(a) == unlist(b)) }

# 1. Search for multiple keywords in a single text
keywords = c("Abra", "cadabra", "is", "the", "Magic", "Word")
oneSearch = AhoCorasickSearch(keywords, "Is Abracadabra the Magic Word?")
stopifnot(listEquals(oneSearch[[1]][[1]], list(keyword="Abra", offset=4)))
stopifnot(listEquals(oneSearch[[1]][[2]], list(keyword="cadabra", offset=8)))
stopifnot(listEquals(oneSearch[[1]][[3]], list(keyword="the", offset=16)))
stopifnot(listEquals(oneSearch[[1]][[4]], list(keyword="Magic", offset=20)))
stopifnot(listEquals(oneSearch[[1]][[5]], list(keyword="Word", offset=26)))

# 2. Search multiple named texts in a named list with keyword grouping and aminoacid alphabet
# * all matches to a keyword are accessed by name
# * non-matched keywords are dropped
proteins = c(protein1="PEPTIDEPEPTIDEDADADARARARARAKEKEKEKEPEPTIDE",
             protein2="DERPADERPAPEWPEWPEEPEERAWRAWWARRAGTAGPEPTIDEKESEQUENCE")
peptides = c("PEPTIDE", "DERPA", "SEQUENCE", "KEKE", "PEPPIE")

peptideSearch = AhoCorasickSearch(peptides, proteins, alphabet="aminoacid", groupByKeyword=TRUE)
stopifnot(listEquals(peptideSearch$PEPTIDE, list(list(keyword="protein1", offset=1),
                                                 list(keyword="protein1", offset=8),
                                                 list(keyword="protein1", offset=37),
                                                 list(keyword="protein2", offset=38))))
stopifnot(listEquals(peptideSearch$DERPA, list(list(keyword="protein2", offset=1),
                                               list(keyword="protein2", offset=6))))
stopifnot(listEquals(peptideSearch$SEQUENCE, list(list(keyword="protein2", offset=47))))
stopifnot(listEquals(peptideSearch$KEKE, list(list(keyword="protein1", offset=29),
                                              list(keyword="protein1", offset=31),
                                              list(keyword="protein1", offset=33))))
stopifnot(listEquals(peptideSearch$PEPPIE, NULL))

# 3. Grouping by keyword without text names: offsets are given without reference to the text
names(proteins) = NULL
peptideSearch = AhoCorasickSearch(peptides, proteins, groupByKeyword=TRUE)
stopifnot(listEquals(peptideSearch$PEPTIDE, list(1, 8, 37, 38)))
stopifnot(listEquals(peptideSearch$DERPA, list(1, 6)))
stopifnot(listEquals(peptideSearch$SEQUENCE, list(47)))
stopifnot(listEquals(peptideSearch$KEKE, list(29, 31, 33)))



