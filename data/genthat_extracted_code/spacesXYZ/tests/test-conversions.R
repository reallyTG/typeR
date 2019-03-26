

library( spacesXYZ )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    
#   returns time in seconds, from an arbitrary origin
gettime <- function()
    {
    if( requireNamespace('microbenchmark') )
        return( microbenchmark::get_nanotime() * 1.e-9 )
    else
        return( as.double( base::Sys.time() ) )
    }
    
    
testXYZ <- function()
    {
    printf( "---------------------  testXYZ()  -----------------------" )

        
    # make random XYZs    
    set.seed(0)    
    count   = 10000
    
    XYZ = matrix( abs(rnorm(3*count)), ncol=3 )
    rownames(XYZ)   = sprintf( "%04d", 1:count )
    
    #------------------  xyY ---------------------##
    time_start      = gettime()    
    xyY             = xyYfromXYZ( XYZ )
    XYZ.back        = XYZfromxyY( xyY )
    time_elapsed    = gettime() - time_start
    
    delta   = rowSums( abs(XYZ - XYZ.back) ) 
    printf( "\nXYZ -> xyY -> XYZ    max(delta)=%g   %d round-trip samples at %g sec/sample",
                            max(delta), count, time_elapsed/count )
    
    failures = sum( 5.e-15 < delta )
    
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf( "There were %d  XYZ -> xyY -> XYZ failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$XYZ      = XYZ[idx, ,drop=FALSE]
        df$xyY      = xyY[idx, ,drop=FALSE]
        df$XYZ.back = XYZ.back[idx, ,drop=FALSE]        
        print( df )
        
        return(FALSE)
        }
        
    #   test pure black
    black   = c(0,0,0)
    if( ! identical( black, as.numeric( XYZfromxyY( xyYfromXYZ(black) ) ) ) )
        {
        printf(  "XYZ -> xyY -> XYZ.back .  pure black not preserved." )
        return(FALSE)
        }
        
    #   test rownames
    if( ! identical( rownames(XYZ), rownames(XYZ.back) ) )
        {
        printf(  "XYZ -> xyY -> XYZ.back .  rownames not preserved." )
        return(FALSE)
        }

        

    #------------------  Lab ---------------------##
    white           = 'D50'
    
    time_start      = gettime()    
    Lab             = LabfromXYZ( XYZ, white )
    XYZ.back        = XYZfromLab( Lab, white )
    time_elapsed    = gettime() - time_start
    
    delta   = rowSums( abs(XYZ - XYZ.back) ) 
    printf( "\nXYZ -> Lab -> XYZ    max(delta)=%g   %d round-trip samples at %g sec/sample",
                            max(delta), count, time_elapsed/count )
    
    failures = sum( 5.e-14 < delta )
    
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf( "There were %d  XYZ -> Lab -> XYZ failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$XYZ      = XYZ[idx, ,drop=FALSE]
        df$Lab      = Lab[idx, ,drop=FALSE]
        df$XYZ.back = XYZ.back[idx, ,drop=FALSE]        
        print( df )
        
        return(FALSE)
        }
        
    #   test pure black
    white   = 1:3
    black   = c(0,0,0)
    if( ! identical( black, as.numeric( XYZfromLab( LabfromXYZ(black,white), white ) ) ) )
        {
        printf(  "XYZ -> Lab -> XYZ.back .  pure black not preserved." )
        return(FALSE)
        }
        
    #   test rownames
    if( ! identical( rownames(XYZ), rownames(XYZ.back) ) )
        {
        printf(  "XYZ -> Lab -> XYZ.back .  rownames not preserved." )
        return(FALSE)
        }
        
        
        
    #------------------  Luv ---------------------##
    white           = 'D50'
    
    time_start      = gettime()    
    Luv             = LuvfromXYZ( XYZ, white )
    XYZ.back        = XYZfromLuv( Luv, white )
    time_elapsed    = gettime() - time_start
    
    delta   = rowSums( abs(XYZ - XYZ.back) ) 
    printf( "\nXYZ -> Luv -> XYZ    max(delta)=%g   %d round-trip samples at %g sec/sample",
                            max(delta), count, time_elapsed/count )
    
    failures = sum( 5.e-12 < delta )
    
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf( "There were %d  XYZ -> Luv -> XYZ failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$XYZ      = XYZ[idx, ,drop=FALSE]
        df$Luv      = Luv[idx, ,drop=FALSE]
        df$XYZ.back = XYZ.back[idx, ,drop=FALSE]        
        print( df )
        
        return(FALSE)
        }
        
    #   test pure black
    white   = 1:3
    black   = c(0,0,0)
    if( ! identical( black, as.numeric( XYZfromLuv( LuvfromXYZ(black,white), white ) ) ) )
        {
        printf(  "XYZ -> Luv -> XYZ.back .  pure black not preserved." )
        return(FALSE)
        }
        
    #   test rownames
    if( ! identical( rownames(XYZ), rownames(XYZ.back) ) )
        {
        printf(  "XYZ -> Luv -> XYZ.back .  rownames not preserved." )
        return(FALSE)
        }

    return( TRUE )
    }
     
     
testPolars <- function()
    {
    printf( "\n---------------------  testPolars()  -----------------------" )

        
    # make random XYZs    
    set.seed(0)    
    count   = 10000
    
    XYZ = matrix( abs(rnorm(3*count)), ncol=3 )
    rownames(XYZ)   = sprintf( "%04d", 1:count )
    
    #------------------  Lab ---------------------##
    white           = c(95,100,105)
    Lab             = LabfromXYZ( XYZ, white )    
    
    time_start      = gettime()    
    LCHab           = LCHabfromLab( Lab )
    Lab.back        = LabfromLCHab( LCHab )
    time_elapsed    = gettime() - time_start
    
    delta   = rowSums( abs(Lab - Lab.back) ) 
    printf( "\nLab -> LCHab -> Lab    max(delta)=%g   %d round-trip samples at %g sec/sample",
                            max(delta), count, time_elapsed/count )
    
    failures = sum( 5.e-12 < delta )
    
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf( "There were %d  Lab -> LCHab -> Lab failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$Lab      = Lab[idx, ,drop=FALSE]
        df$LCHab    = LCHab[idx, ,drop=FALSE]
        df$Lab.back = Lab.back[idx, ,drop=FALSE]        
        print( df )
        
        return(FALSE)
        }
        
    #   test rownames
    if( ! identical( rownames(Lab), rownames(Lab.back) ) )
        {
        printf(  "Lab -> LCHab -> Lab.back .  rownames not preserved." )
        #print( rownames(Lab)[1:10] )
        #print( rownames(Lab.back)[1:10] )        
        return(FALSE)
        }
        
    # test 2 neutrals
    for( L in c(0,50) )
        {
        Lab   = c(L,0,0)
        if( ! identical( Lab, as.numeric( LabfromLCHab( LCHabfromLab(Lab) ) ) ) )
            {
            printf(  "Lab -> LCHab -> Lab.back.  neutral L=%g not preserved.", L )
            return(FALSE)
            }      
        }                    
        
    #------------------  Luv ---------------------##
    white           = c(95,100,105)
    Luv             = LuvfromXYZ( XYZ, white )    
    
    time_start      = gettime()    
    LCHuv           = LCHuvfromLuv( Luv )
    Luv.back        = LuvfromLCHuv( LCHuv )
    time_elapsed    = gettime() - time_start
    
    delta   = rowSums( abs(Luv - Luv.back) ) 
    printf( "\nLuv -> LCHuv -> Luv    max(delta)=%g   %d round-trip samples at %g sec/sample",
                            max(delta), count, time_elapsed/count )
    
    failures = sum( 5.e-12 < delta )
    
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf( "There were %d  Luv -> LCHuv -> Luv failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$Luv      = Luv[idx, ,drop=FALSE]
        df$LCHuv    = LCHuv[idx, ,drop=FALSE]
        df$Luv.back = Luv.back[idx, ,drop=FALSE]        
        print( df )
        
        return(FALSE)
        }
        
    #   test rownames
    if( ! identical( rownames(Luv), rownames(Luv.back) ) )
        {
        printf(  "Luv -> LCHuv -> Luv.back .  rownames not preserved." )
        #print( rownames(Luv)[1:10] )
        #print( rownames(Luv.back)[1:10] )        
        return(FALSE)
        }
        
    # test 2 neutrals
    for( L in c(0,50) )
        {
        Luv   = c(L,0,0)
        if( ! identical( Luv, as.numeric( LuvfromLCHuv( LCHuvfromLuv(Luv) ) ) ) )
            {
            printf(  "Luv -> LCHuv -> Luv.back.  neutral L=%g not preserved.", L )
            return(FALSE)
            }      
        }                    
                
        
    return(TRUE)
    }
    
        
        
x = gettime()   # load microbenchmark
 
if( ! testXYZ() )       stop( "testXYZ() failed !", call.=FALSE )

if( ! testPolars() )    stop( "testPolars() failed !", call.=FALSE )


printf(  "\nPassed all Conversion tests !" )
     