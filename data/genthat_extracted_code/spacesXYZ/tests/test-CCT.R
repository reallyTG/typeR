

library( spacesXYZ )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    

testRoundtrips.uv <- function( locus='robertson' )
    {
    printf( "\n---------------------  testRoundtrips.uv('%s')  -----------------------", locus )

    #   mat = matrix( c('robertson','robertson', 'mccamy','mccamy',  'native','native' ), 3, 2, byrow=TRUE )
    strict  = TRUE
    
    for( iso in c('robertson', 'mccamy','native' ) )
        {
        if( iso == 'mccamy' )
            #   1710 is about as low as McCamy can go        
            temperature = c( 1710, seq(2000,33000,by=1000) )
        else
            temperature = c( 1667, seq(2000,33000,by=1000), 75000, Inf )
        
        uv      = planckLocus( temperature, locus=locus, param=iso  )
        if( any( is.na(uv) ) )
            {
            printf( "planckLocus() failed for param='%s'.  It returned some NAs", iso )
            print( uv )
            return(FALSE)
            }
        
        CCTback = CCTfromuv( uv, isotherm=iso,  locus=locus, strict=strict )
        if( any( is.na(CCTback) ) )
            {
            printf( "CCTfromuv() failed for isotherm='%s'.  It returned some NAs", iso )
            return(FALSE)
            }        
        
        delta   = CCTback - temperature  ;   print(delta)
        
        #   NaNs may come from Inf-Inf, so change them to 0s
        delta[ is.nan(delta) ] = 0
        
        #printf( "testRoundtrips.uv()  param='%s'  max(abs(delta))=%g", iso, max(abs(delta) ) )
        
        tol = ifelse( iso=='native', 5.e-5, 5.e-2 )  
        
        if( tol < max(abs(delta)) )
            {
            printf( "testRoundtrips.uv().  Round-trip failed for param='%s' and isotherm='%s'.  max(abs(delta))=%g", 
                                   iso, iso, max(abs(delta)) )
            print(delta)                                   
            return(FALSE)
            }  
        }

    printf( "testRoundtrips.uv('%s') passed.", locus )
        
    return( TRUE )
    }
    
        
testRoundtrips.xy <- function()
    {
    printf( "\n---------------------  testRoundtrips.xy()  -----------------------" )


    strict  = TRUE
    
    for( iso in c('robertson', 'mccamy','native' ) )
        {
        if( iso == 'mccamy' )
            #   1710 is about as low as McCamy can go        
            temperature = c( 1710, seq(2000,33000,by=1000) )
        else
            temperature = c( 1677, seq(2000,33000,by=1000), 75000, Inf )
            
        xy      = planckLocus( temperature, param=iso, space=1931  )
        if( any( is.na(xy) ) )
            {
            printf( "xyfromTemperature() failed for param='%s'.  It returned some NAs", iso )
            return(FALSE)
            }
        
        CCTback = CCTfromxy( xy, isotherm=iso, strict=strict )
        if( any( is.na(CCTback) ) )
            {
            printf( "CCTfromxy() failed for isotherm='%s'.  It returned some NAs", iso )
            return(FALSE)
            }        
        
        delta   = CCTback - temperature   #;   print(delta)
        
        #   NaNs may come from Inf-Inf, so change them to 0s
        delta[ is.nan(delta) ] = 0

        
        #printf( "testRoundtrips.xy()  param='%s'  max(abs(delta))=%g", iso, max(abs(delta) ) )
                
        tol = ifelse( iso=='native', 5.e-5, 5.e-2 )
        
        if( tol < max(abs(delta)) )
            {
            printf( "testRoundtrips.xy().  Round-trip failed for param='%s' and isotherm='%s'.  max(abs(delta))=%g", 
                                   iso, iso, max(abs(delta)) )
            print(delta)
            return(FALSE)
            }  
        }

    printf( "testRoundtrips.xy() passed." )
               
    return( TRUE )
    }
    

testStrictness <- function( locus='robertson' )
    {
    printf( "\n---------------------  testStrictness('%s')  -----------------------", locus )    
    
    temperaturetest = c( 1800, seq(2000,33000,by=1000) )
        
    for( delta in c(-0.051,0.051) )  # above and below
        {
        #   make some uv points just outside the valid band above the locus.  Though some will be outside the chromaticity diagram !        
        uvoutside   = planckLocus( temperaturetest, locus, param='native', delta=delta )
       
        #printf( "delta=%g", delta )
        #print( uvoutside )   
        
        for( isotherm in c('mccamy','robertson','native') )
            {
            #   first test with strict=FALSE, all should succeed.
            CCT = CCTfromuv( uvoutside, isotherm=isotherm, locus=locus, strict=FALSE )
            
            count   = sum( is.na(CCT) )
            if( 0 < count )
                {
                printf( "strict=FALSE test failed for %d of %d points too far from the locus.  delta=%g", 
                                count, length(CCT), delta )

                return(FALSE)
                }  

            #   now test with strict=TRUE, all should fail. 
            CCT = CCTfromuv( uvoutside, isotherm=isotherm, locus=locus, strict=TRUE )
       
            count   = sum( ! is.na(CCT) )            
            if( 0 < count  )
                {
                printf( "strict=TRUE test failed for %d of %d points too far from the '%s' locus.  delta=%g", 
                                    count, length(CCT), locus, delta )
                return(FALSE)
                }    
            }
    
        }
        
    printf( "testStrictness('%s') passed.", locus )
               
    return(TRUE)
    }
    
if( ! testRoundtrips.uv('robertson') )  stop( "testRoundtrips.uv('robertson') failed !", call.=FALSE )
    
if( ! testRoundtrips.uv('precision') )  stop( "testRoundtrips.uv('precision') failed !", call.=FALSE )
        
if( ! testRoundtrips.xy() )             stop( "testRoundtrips.xy() failed !", call.=FALSE )
      
if( ! testStrictness('robertson') )     stop( "testStrictness('robertson') failed !", call.=FALSE )
    
if( ! testStrictness('precision') )     stop( "testStrictness('precision') failed !", call.=FALSE )
    

printf(  "\nPassed all CCT tests !" )
     