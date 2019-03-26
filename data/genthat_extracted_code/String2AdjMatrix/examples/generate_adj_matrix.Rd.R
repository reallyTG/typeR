library(String2AdjMatrix)


### Name: generate_adj_matrix
### Title: generate_adj_matrix
### Aliases: generate_adj_matrix

### ** Examples

##Example
library(String2AdjMatrix)

#Start with character string to generate an adjacency matrix from
string_in = c('apples, pears, bananas', 'apples, bananas', 'apples, pears')

#Generate a new blank matrix
blank_matrix = generate_adj_matrix(string_in)

#Now fill the matrix
string_2_matrix(blank_matrix, string_in)



