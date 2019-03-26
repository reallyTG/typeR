
library( spacesRGB )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }

#   return value
#       an integer matrix with (n+1)(n+2)/2 rows  and  3 columns
#       the integers are all non-negative
#       in each row, the integers sum to n, and all rows are distinct
#
#   method is crude - make about double what is needed and then delete the wrong ones
ternaryGrid  <-  function( n )
    {
    s   = 0L:as.integer(n)
    out = as.matrix( expand.grid( s, s ) ) #;     print(str(out))
    c3  = as.integer(n - rowSums(out))
    out = cbind( out, c3 )
    out = out[ 0 <= c3, ]
    
    dimnames(out)   = NULL
    
    # print(str(out))
    
    return(out)
    }
    
plotGrid  <-  function( dims=c(6,4), ydir='bottom-up', shape='full' )
    {
    if( grepl("^bottom",ydir) )
        data    = expand.grid( LEFT=0:(dims[1]-1), BOTTOM=0:(dims[2]-1) ) 
    else
        data    = expand.grid( LEFT=0:(dims[1]-1), TOP=0:(dims[2]-1) ) 
        
    data$WIDTH  = 1    
    data$HEIGHT = 1   
    #   print( str(data) )
        
    set.seed(0)
    patches = nrow( data )
    data$RGB = matrix( runif(patches*3), patches, 3, byrow=T )

    plotPatchesRGB( data, which='signal', shape=shape, back=0.5, labels=FALSE )
    
    main    = sprintf( "%s     %s", ydir, shape )
    title( main=main )
    
    return(TRUE)
    }
    
    
plotHexagons  <-  function( n=7 )
    {
    #   make matrix of 3 vertices
    vert3   = matrix( c(0,0, 1,0,  0.5,sqrt(3)/2), 2, 3 )
    
    weight  = t( ternaryGrid(n-1) ) / (n-1)
    

    vert    = t( vert3 %*% weight )
    patches = nrow(vert)      
    
    width   = 1/(n-1)
    height  = (2/sqrt(3)) * width

    #   triangle with base on top
    # data    = data.frame( LEFT=vert[ ,1]-width/2 , TOP=vert[ ,2] - height/2, WIDTH=width, HEIGHT=height )

    #   triangle with base on bottom
    data    = data.frame( LEFT=vert[ ,1]-width/2 , BOTTOM=vert[ ,2] - height/2, WIDTH=width, HEIGHT=height )
    
    
    #   make colors
    set.seed(0)
    data$RGB = matrix( runif(patches*3), patches, 3, byrow=T )

    plotPatchesRGB( data, which='signal', shape='vhex', back=0.5, labels=FALSE )
    
    title( main="ternary grid" )
    
    return(TRUE)
    }
    
shapevec = c('full','half','hhex','vhex','left','right','bottom','top')
shapevec = c( shapevec, 'topleft', 'topright', 'bottomleft', 'bottomright' )
for( shape in shapevec )
    {
    for( ydir in c('bottom-up','top-down') )
        {
        if( ! plotGrid( ydir=ydir, shape=shape) )      stop( "plotGrid() failed !", call.=FALSE )
        }
    }
    
    
    
    
if( ! plotHexagons() )  stop( "plotHexagons() failed !", call.=FALSE )

printf(  "\nPassed all plotting tests !" )
     