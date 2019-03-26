library(partykit)


### Name: party-methods
### Title: Methods for Party Objects
### Aliases: party-methods length.party print.party print.simpleparty
###   print.constparty [.party [[.party depth.party width.party
###   getCall.party nodeprune nodeprune.party
### Keywords: tree

### ** Examples


    ## a tree as flat list structure
    nodelist <- list(
        # root node
        list(id = 1L, split = partysplit(varid = 4L, breaks = 1.9), 
            kids = 2:3),
        # V4 <= 1.9, terminal node
        list(id = 2L),
        # V4 > 1.9
        list(id = 3L, split = partysplit(varid = 5L, breaks = 1.7), 
            kids = c(4L, 7L)),
        # V5 <= 1.7
        list(id = 4L, split = partysplit(varid = 4L, breaks = 4.8), 
            kids = 5:6),
        # V4 <= 4.8, terminal node
        list(id = 5L),
        # V4 > 4.8, terminal node
        list(id = 6L),
        # V5 > 1.7, terminal node
        list(id = 7L)
    )

    ## convert to a recursive structure
    node <- as.partynode(nodelist)

    ## set up party object
    data("iris")
    tree <- party(node, data = iris, 
        fitted = data.frame("(fitted)" = 
            fitted_node(node, data = iris),
            check.names = FALSE))
    names(tree) <- paste("Node", nodeids(tree), sep = " ")

    ## number of kids in root node
    length(tree)

    ## depth of tree
    depth(tree)

    ## number of terminal nodes
    width(tree)

    ## node number four
    tree["Node 4"]
    tree[["Node 4"]]




