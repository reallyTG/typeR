

library( spacesXYZ )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    

testFundamental <- function()
    {
    printf( "\n---------------------  testFundamental()  -----------------------" )

    C   = standardXYZ( 'C' )
    D65 = standardXYZ( 'D65' )
    
    #  xyY_D65     = xyYfromXYZ( D65 )    
    
    for( method in c( "Bradford", "VonKries", "MCAT02", "scaling" ) )
        {
        CtoD65  = CAT( C, D65, method=method )

        xyY_gray    = xyYfromXYZ( adaptXYZ(CtoD65,C) )
        
        delta   = max( abs(adaptXYZ(CtoD65,C) - D65)  )
        
        printf( "method='%s'.  delta=%g", method, delta )
        
        if( 5.e-16 < delta )
            {
            printf( "Adaptation accuracy failed for method='%s'.  delta=%g", method, delta )
            return(FALSE)
            }        
        }

    return( TRUE )
    }
    
        
    
testSymmetry <- function()
    {
    printf( "\n---------------------  testSymmetry()  -----------------------" )

    I3  = diag(3)
    
    for( method in c( "Bradford", "VonKries", "MCAT02", "scaling" ) )
        {
        AtoB    = CAT( 'A', 'B', method=method )
        
        BtoA    = CAT( 'B', 'A', method=method )
        
        #   the product of the Ms must be I
        delta   = max( abs(AtoB$M %*% BtoA$M  -  I3) )   #        print(delta)
        
        printf( "method='%s'.  delta=%g", method, delta )
                
        if( 5.e-15 < delta )
            {
            printf( "Adaptation symmetry failed for method='%s'.  delta=%g", method, delta )
            return(FALSE)
            }
        }

    return( TRUE )
    }
    
    
testCommutativity <- function()
    {
    printf( "\n---------------  testCommutativity()  -----------------------" )

    for( method in c( "Bradford", "VonKries", "MCAT02", "scaling" ) )
        {
        AtoB    = CAT( 'A', 'B', method=method )
        
        BtoC    = CAT( 'B', 'C', method=method )
        
        AtoC    = CAT( 'A', 'C', method=method )        
        
        #   compare matrix product
        delta   = max( abs(BtoC$M %*% AtoB$M  -  AtoC$M) )   
        
        printf( "method='%s'.  delta=%g", method, delta )
        
        if( 5.e-15 < delta )
            {
            printf( "Adaptation commutativity failed for method='%s'.  delta=%g", method, delta )
            return(FALSE)
            }
        }

    return( TRUE )
    }
    
    
    
if( ! testFundamental() )   stop( "testFundamental() failed !", call.=FALSE )

if( ! testSymmetry() )      stop( "testSymmetry() failed !", call.=FALSE )

if( ! testCommutativity() ) stop( "testCommutativity() failed !", call.=FALSE )

printf(  "\nPassed all Adaptation tests !" )
     