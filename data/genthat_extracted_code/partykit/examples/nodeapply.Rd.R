library(partykit)


### Name: nodeapply
### Title: Apply Functions Over Nodes
### Aliases: nodeapply nodeapply.party nodeapply.partynode
### Keywords: tree

### ** Examples


    ## a tree as flat list structure
    nodelist <- list(
        # root node
        list(id = 1L, split = partysplit(varid = 4L, breaks = 1.9),
            kids = 2:3),
        # V4 <= 1.9, terminal node
        list(id = 2L, info = "terminal A"),
        # V4 > 1.9
        list(id = 3L, split = partysplit(varid = 5L, breaks = 1.7),
            kids = c(4L, 7L)),
        # V5 <= 1.7
        list(id = 4L, split = partysplit(varid = 4L, breaks = 4.8),
            kids = 5:6),
        # V4 <= 4.8, terminal node
        list(id = 5L, info = "terminal B"),
        # V4 > 4.8, terminal node
        list(id = 6L, info = "terminal C"),
        # V5 > 1.7, terminal node
        list(id = 7L, info = "terminal D")
    )

    ## convert to a recursive structure
    node <- as.partynode(nodelist)

    ## return root node 
    nodeapply(node)

    ## return info slots of terminal nodes
    nodeapply(node, ids = nodeids(node, terminal = TRUE), 
        FUN = function(x) info_node(x))

    ## fit tree using rpart
    library("rpart")
    rp <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)

    ## coerce to `constparty'
    rpk <- as.party(rp)

    ## extract nodeids
    nodeids(rpk)
    unlist(nodeapply(node_party(rpk), ids = nodeids(rpk), 
        FUN = id_node))
    unlist(nodeapply(rpk, ids = nodeids(rpk), FUN = id_node))

    ## but root nodes of party objects always have id = 1
    unlist(nodeapply(rpk, ids = nodeids(rpk), FUN = function(x) 
        id_node(node_party(x)), by_node = FALSE))



