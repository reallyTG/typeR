library(veccompare)


### Name: extract.compared.vectors
### Title: Extract elements from the output of 'compare.vectors'
### Aliases: extract.compared.vectors

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

# A more complex / specific example:
extract.compared.vectors(
  example,
  vector_names = c("vector_a", "vector_c"),
  only_match_vector_names = FALSE,
  degrees_of_comparison = c(2, 3),
  elements_of_output = "elements_involved"
)



