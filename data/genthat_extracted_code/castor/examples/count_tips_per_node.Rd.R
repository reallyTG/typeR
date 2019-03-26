library(castor)


### Name: count_tips_per_node
### Title: Count descending tips.
### Aliases: count_tips_per_node

### ** Examples

# generate a tree using a simple speciation model 
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=1000)$tree

# count number of tips descending from each node
tips_per_node = count_tips_per_node(tree);

# plot histogram of tips-per-node
barplot(table(tips_per_node[tips_per_node<10]), xlab="# tips", ylab="# nodes")



