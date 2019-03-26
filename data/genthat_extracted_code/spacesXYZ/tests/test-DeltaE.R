

library( spacesXYZ )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    

testDeltaE.2000 <- function()
    {
    printf( "\n---------------------  testDeltaE.2000()  -----------------------" )

        
    # path    = file.path( extdata, "ciede2000testdata.txt" )     #; print(path)  
    
    path    = system.file( 'extdata/ciede2000testdata.txt', package='spacesXYZ' )    
    if( ! file.exists( path ) )
        {
        print( getwd() )    
        cat( "File ", path, " does not exist!\n", file=stderr() )
        return(FALSE)
        }    
    
    
    df      = read.table( path, sep='\t', quote='', head=T )    #; print(df)
    
    Lab1    = as.matrix( df[ , 1:3 ] )
    Lab2    = as.matrix( df[ , 4:6 ] )
    dE.true = df[ ,7]
    
    #   print(  cbind( Lab1, Lab2, DeltaE( Lab1, Lab2, metric=c(1976,2000) ) )  )
    
    dE.mine = DeltaE( Lab1, Lab2, metric=2000 )
    
    print( abs(dE.true - dE.mine) )
    err = max(abs(dE.true - dE.mine))
    printf( "Max error = %g", err )
    
    #   check for noLD  (no long-double)
    bytes.LD = .Machine$sizeof.longdouble
    if( 0 < bytes.LD )
        # the usual case
        tol = 1.e-4
    else
        tol = 5.e-4

    df  = cbind( df, dE.mine=dE.mine )
    
    #print( cbind( dE.true, dE.mine ) )    
    #dig = decimalplaces( dE.true )          # ; print(dig)
    #   dE.true[1] = dE.true[1] + 10^(-dig) check for failure
    # mask    = round(dE.mine,dig) != dE.true #; print( mask )
    
    mask    = tol < abs(dE.true - dE.mine)
    
    if( any(mask) )
        {
        printf( "DeltaE.2000 failed for %d samples.  tol=%g", sum(mask), tol )
        print( df[ mask, ,drop=F ] )
        return(FALSE)
        }
    
    return( TRUE )
    }
    
decimalplaces <- function( x )
    {
    for( i in 0:16 )
        if( identical( x, round(x,i) ) ) return(i)
    
    return(17)
    }

if( ! testDeltaE.2000() )   stop( "testDeltaE.2000() failed !", call.=FALSE )


printf(  "\nPassed all DeltaE tests !" )
     