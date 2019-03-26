
library( munsellinterpol )
library( microbenchmark )
library( spacesXYZ )

printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    
gettime <- function()
    {
    return( microbenchmark::get_nanotime() * 1.e-9 )
    }    
    
ABfromHC <- function( H, C )
    {
    theta   = H * pi/50
    list( A = C*cos(theta), B = C*sin(theta) )
    }
    
makeABab <- function( Munsell2xy, value )
    {
    dfsub  = Munsell2xy[ Munsell2xy$V == value , ]    # &  Munsell2xy$real
    
    tmp = ABfromHC( dfsub$H, dfsub$C )
    dfsub$A    = tmp$A
    dfsub$B    = tmp$B
    
    XYZ.C   = spacesXYZ::XYZfromxyY( c( 0.3101,0.3163, 100 ) )   
    
    xyY = cbind( dfsub$x, dfsub$y, YfromV(value) )
    XYZ = spacesXYZ::XYZfromxyY( xyY )
    Lab = spacesXYZ::LabfromXYZ( XYZ, XYZ.C )    
    
    dfsub$a    = Lab[ ,2]
    dfsub$b    = Lab[ ,3]
    
    return( dfsub )
    }
        
    
testPoly <- function()
    {
    df5 = makeABab( munsellinterpol::Munsell2xy, 5 ) 
    
    mod.poly    = lm( A ~ polym(a,b,degree=3,raw=TRUE) + 0, data=df5 )  #   but polym prediction does not work for singletons
    
    form    = "A ~ a + I(a^2) + I(a^3) + b + I(a*b) + I(a^2*b) + I(b^2) + I(a*b^2) + I(b^3) + 0"
    
    mod.terms   = lm( formula(form), data=df5 )    
    
    #   coefficients should be identical
    ok  = identical( as.numeric(coef(mod.terms)) , as.numeric(coef(mod.poly)) )
    if( ! ok )
        {
        printf( "direct and polynomial coefficients are not idenical." )
        return(FALSE)
        }
    
    
    coef    = coef(mod.terms) #;  print( coef )

    count   = nrow(df5)
    pred1   = numeric( count )
    
    time_start  = gettime()
    
    # predict A for each row, one at a time
    for( i in 1:count )
        pred1[i] = predict( mod.terms, newdata=list( a=df5$a[i], b=df5$b[i] ) )
    
    time_elapsed    = gettime() - time_start
    
    printf( "Predicted %d points using predict() (one at a time) in %g seconds.  %g/point.", count, time_elapsed, time_elapsed/count )
    
    
    #   do it again by direct calc, which is much faster
    pred2   = numeric( count )    
    time_start  = gettime()
    for( i in 1:count )
        {
        a   = df5$a[i]
        b   = df5$b[i]
        a2  = a*a
        b2  = b*b
        term    = c( a, a2, a2*a, b, a*b, a2*b, b2, a*b2, b2*b )
        pred2[i] = sum( coef * term )
        }
    
    time_elapsed    = gettime() - time_start
    
    printf( "Predicted %d points using sum(coef*term) (one at a time) in %g seconds.  %g/point.", count, time_elapsed, time_elapsed/count )
        
    #   now compare pred1[] to pred2[]
    ran = range( pred1 - pred2 )
    printf( "Difference range = [%g,%g].", ran[1], ran[2] )
    
    tol = 5.e-14
    
    return(  all( abs(ran) < tol )  )
    }    
    
    
    
    
{
if( testPoly() )    
    printf( "testPoly() succeeded !", call.=FALSE )
else
    stop( "testPoly() failed !", call.=FALSE )
}

printf( "Passed all polynomial tests !"  )
    