library(castor)


### Name: write_tree
### Title: Write a tree in Newick (parenthetic) format.
### Aliases: write_tree

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=100)$tree

# obtain a string representation of the tree in Newick format
Newick_string = write_tree(tree)



