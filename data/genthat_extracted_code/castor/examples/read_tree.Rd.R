library(castor)


### Name: read_tree
### Title: Load a tree from a string or file in Newick (parenthetic)
###   format.
### Aliases: read_tree

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=100)$tree

# obtain a string representation of the tree in Newick format
Newick_string = write_tree(tree)

# re-parse tree from string
parsed_tree = read_tree(Newick_string)



