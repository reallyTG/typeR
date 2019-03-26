library(NLP)


### Name: Tree
### Title: Tree objects
### Aliases: Tree format.Tree print.Tree Tree_parse Tree_apply

### ** Examples

x <- Tree(1, list(2, Tree(3, list(4)), 5))
format(x)
x$value
x$children

p <- Tree("VP",
          list(Tree("V",
                    list("saw")),
               Tree("NP",
                    list("him"))))
p <- Tree("S",
          list(Tree("NP",
                    list("I")),
               p))
p
## Force nested indented bracketting:
print(p, width = 10)

s <- "(S (NP I) (VP (V saw) (NP him)))"
p <- Tree_parse(s)
p

## Extract the leaves by recursively traversing the children and
## recording the non-tree ones:
Tree_leaf_gatherer <-
function()
{
    v <- list()
    list(update =
         function(e) if(!inherits(e, "Tree")) v <<- c(v, list(e)),
         value = function() v,
         reset = function() { v <<- list() })
}
g <- Tree_leaf_gatherer()
y <- Tree_apply(p, g$update, recursive = TRUE)
g$value()



