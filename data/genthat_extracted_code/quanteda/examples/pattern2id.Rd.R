library(quanteda)


### Name: pattern2id
### Title: Convert regex and glob patterns to type IDs or fixed patterns
### Aliases: pattern2id pattern2fixed index_types
### Keywords: internal

### ** Examples

types <- c("A", "AA", "B", "BB", "BBB", "C", "CC")

pats_regex <- list(c("^a$", "^b"), c("c"), c("d"))
pattern2id(pats_regex, types, "regex", case_insensitive = TRUE)

pats_glob <- list(c("a*", "b*"), c("c"), c("d"))
pattern2id(pats_glob, types, "glob", case_insensitive = TRUE)

pattern <- list(c("^a$", "^b"), c("c"), c("d"))
types <- c("A", "AA", "B", "BB", "BBB", "C", "CC")
pattern2fixed(pattern, types, "regex", case_insensitive = TRUE)
index <- index_types(types, "regex", case_insensitive = TRUE)
pattern2fixed(pattern, index = index)
index <- index_types(c("xxx", "yyyy", "ZZZ"), "glob", FALSE, 3)
quanteda:::search_glob("yy*", attr(index, "type_search"), index)



