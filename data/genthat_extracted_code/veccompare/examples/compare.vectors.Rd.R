library(veccompare)


### Name: compare.vectors
### Title: Compare all combinations of vectors using set operations
### Aliases: compare.vectors

### ** Examples

example <- veccompare::compare.vectors(veccompare::example.vectors.list)

# To extract similar elements across list items:
veccompare::extract.compared.vectors(
  example,
  elements_of_output = "elements_involved"
)

# To extract all comparisons that involve "vector_a":
veccompare::extract.compared.vectors(
  example,
  vector_names = "vector_a"
)

# To find all comparisons that were about "vector_a" and "vector_c":
veccompare::extract.compared.vectors(
  example,
  vector_names = c("vector_a", "vector_c"),
  only_match_vector_names = TRUE
)

# To get all elements that did a two-way comparison:
veccompare::extract.compared.vectors(
  example,
  degrees_of_comparison = 2
)



