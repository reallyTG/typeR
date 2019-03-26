library(AhoCorasickTrie)


### Name: AhoCorasickSearchList
### Title: Fast searching for one or more keywords in a list of texts
### Aliases: AhoCorasickSearchList

### ** Examples

listEquals = function(a, b) { is.null(unlist(a)) && is.null(unlist(b)) ||
                              !is.null(a) && !is.null(b) && all(unlist(a) == unlist(b)) }
keywords = c("Abra", "cadabra", "is", "the", "Magic", "Word")

# 1. Search a list of lists without names
# * sublists are accessed by index
# * texts are accessed by index
# * non-matched texts are kept (input index order is preserved)
listSearch = AhoCorasickSearchList(keywords,
                                   list(c("What in", "the world"),
                                        c("is"),
                                        "secret about",
                                        "the Magic Word?"))
stopifnot(listEquals(listSearch[[1]][[1]], list()))
stopifnot(listEquals(listSearch[[1]][[2]][[1]], list(keyword="the", offset=1)))
stopifnot(listEquals(listSearch[[2]][[1]][[1]], list(keyword="is", offset=1)))
stopifnot(listEquals(listSearch[[3]], list()))
stopifnot(listEquals(listSearch[[4]][[1]][[1]], list(keyword="the", offset=1)))
stopifnot(listEquals(listSearch[[4]][[1]][[2]], list(keyword="Magic", offset=5)))
stopifnot(listEquals(listSearch[[4]][[1]][[3]], list(keyword="Word", offset=11)))

# 2. Search a named list of named lists
# * sublists are accessed by name
# * matched texts are accessed by name
# * non-matched texts are dropped
namedSearch = AhoCorasickSearchList(keywords,
                                    list(subject=c(phrase1="What in", phrase2="the world"),
                                         verb=c(phrase1="is"),
                                         predicate1=c(phrase1="secret about"),
                                         predicate2=c(phrase1="the Magic Word?")))
stopifnot(listEquals(namedSearch$subject$phrase2[[1]], list(keyword="the", offset=1)))
stopifnot(listEquals(namedSearch$verb$phrase1[[1]], list(keyword="is", offset=1)))
stopifnot(listEquals(namedSearch$predicate1, list()))
stopifnot(listEquals(namedSearch$predicate2$phrase1[[1]], list(keyword="the", offset=1)))
stopifnot(listEquals(namedSearch$predicate2$phrase1[[2]], list(keyword="Magic", offset=5)))
stopifnot(listEquals(namedSearch$predicate2$phrase1[[3]], list(keyword="Word", offset=11)))



