library(cheddar)


### Name: PredationMatrixToLinks
### Title: Predation matrix to trophic links
### Aliases: PredationMatrixToLinks
### Keywords: utilities

### ** Examples

data(TL84)

links <- PredationMatrixToLinks(PredationMatrix(TL84))
identical(links, TLPS(TL84))    # TRUE

# Create a Cheddar community from an existing square predation matrix
node <- c('Leaf', 'Caterpillar', 'Bluetit')
pm <- matrix( c(0, 1, 0,
                0, 0, 1,
                0, 0, 0), 
             ncol=3, byrow=TRUE, dimnames=list(node, node))

community1 <- Community(nodes=data.frame(node=node),
                        trophic.links=PredationMatrixToLinks(pm),
                        properties=list(title='Test community'))
TLPS(community1)

# The same set of trophic links could be represented by a non-square predation 
# matrix
pm <- matrix( c(1, 0,
                0, 1), 
             ncol=2, byrow=TRUE, 
             dimnames=list(node[1:2], node[2:3]))

community2 <- Community(nodes=data.frame(node=node),
                        trophic.links=PredationMatrixToLinks(pm),
                        properties=list(title='Test community'))
TLPS(community2)

all.equal(community1, community2)    # TRUE

# Extract quantitative information
node <- c('Leaf 1', 'Leaf 2', 'Caterpillar 1', 'Caterpillar 2')
pm <- matrix( c(0, 0, 0.4, 0.8, 
                0, 0, 0.6, 0.2, 
                0, 0, 0,   0, 
                0, 0, 0,   0), 
             ncol=4, byrow=TRUE, dimnames=list(node, node))

# A data.frame that has a column called diet.fraction
PredationMatrixToLinks(pm, link.property='diet.fraction')



