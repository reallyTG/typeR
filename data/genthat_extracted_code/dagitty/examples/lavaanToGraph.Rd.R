library(dagitty)


### Name: lavaanToGraph
### Title: Convert Lavaan Model to DAGitty Graph
### Aliases: lavaanToGraph

### ** Examples

if( require(lavaan) ){
mdl <- lavaanify("
X ~ C1 + C3
M ~ X + C3
Y ~ X + M + C3 + C5
C1 ~ C2
C3 ~ C2 + C4
C5 ~ C4
C1 ~~ C2 \n C1 ~~ C3 \n C1 ~~ C4 \n C1 ~~ C5
C2 ~~ C3 \n C2 ~~ C4 \n C2 ~~ C5
C3 ~~ C4 \n C3 ~~ C5",fixed.x=FALSE)
plot( graphLayout( lavaanToGraph( mdl ) ) )
}



