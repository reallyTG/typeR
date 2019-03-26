library(dagitty)


### Name: coordinates
### Title: Plot Coordinates of Variables in Graph
### Aliases: coordinates coordinates<-

### ** Examples

## Plot localization of each node in the Shrier example
plot( coordinates( getExample("Shrier") ) )

## Define a graph and set coordinates afterwards
x <- dagitty('dag{
    G <-> H <-> I <-> G
    D <- B -> C -> I <- F <- B <- A
    H <- E <- C -> G <- D
}')
coordinates( x ) <-
    list( x=c(A=1, B=2, D=3, C=3, F=3, E=4, G=5, H=5, I=5),
        y=c(A=0, B=0, D=1, C=0, F=-1, E=0, G=1, H=0, I=-1) )
plot( x )




