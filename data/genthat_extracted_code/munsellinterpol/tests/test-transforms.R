
#   This is only for   HVC  <--->  xyY   transforms

library( munsellinterpol )

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
    
    
testCentroids <- function()
    {
    #   path = "../inst/extdata/Centrals_ISCC_NBS.txt"    
    path = system.file( "extdata/Centroids_ISCC-NBS.txt", package='munsellinterpol' )
    
    df = read.table( path, header=T,  sep='\t', stringsAsFactors=F )    

    printf( "-----------  testCentroids()   %d samples -----------------------", nrow(df) )
        
    #   printf( "Testing centroids..." )   
    
    # go forwards HVC -> xyY

    HVC = HVCfromMunsellName( df$MunsellSpec )
    
    time_start  = gettime()
    
    res = MunsellToxyY( HVC, warn=FALSE )    

    time_elapsed = gettime() - time_start
    
    failures = sum( is.na(res$xyY[ ,1]) )
    
    printf(  "There were %d forward failures, out of %d samples.  time=%g sec.  %g/sample.",
                failures, nrow(df), time_elapsed, time_elapsed/nrow(HVC) )

    
    if( 0 < failures )  return(FALSE)
    
    #   now go backwards xyY -> HVC
    time_start  = gettime()
    
    res = xyYtoMunsell( res$xyY, perf=TRUE )
    
    time_elapsed = gettime() - time_start
    
    failures = sum( is.na(res$HVC[ ,1]) )
    
    printf(  "There were %d reverse failures, out of %d samples.  time=%g sec.  %g/sample.",
                            failures, nrow(HVC), time_elapsed, time_elapsed/nrow(HVC) )

    printf( "Performance:")
    cat( "Time Elapsed 5-number summary:  " )
    cat( fivenum(res$time.elapsed,na.rm=T), '\n' )        
    cat( "Iterations 5-number summary:  " )
    cat( fivenum(res$iterations,na.rm=T), '\n' )    
    cat( "Evaluations 5-number summary:  " )
    cat( fivenum(res$evaluations,na.rm=T), '\n' )   
    
    #   compare HVC and res$HVC
    tol = 0.01    
    HVC.delta   = abs(HVC - res$HVC)
    HVC.delta[ ,1]  = pmin( HVC.delta[ ,1], 100 - HVC.delta[ ,1] )
    err = rowSums( HVC.delta )    
    idx = which.max( err )
    df  = data.frame( row.names=1 )
    df$HVC      = HVC[ idx, , drop=F ]
    df$xyY      = res$xyY[ idx, , drop=F ]
    df$HVC.back = res$HVC[ idx, , drop=F ]
    printf(  "Maximum round-trip error = %g  (tol=%g).", err[idx], tol )
    print( df )
    
    #   how many exceeded the tolerance
    count   = sum( tol < err )
    if( 0 < count )
        printf( "%d round-trip errors exceeded %g.", count, tol )
    
    if( 0 < failures  ||  0 < count )  return(FALSE)

    return( TRUE )
    }
     
     
testOptimals <- function()
    {
    path = system.file( "extdata/OptimalColorsForIlluminantC.txt", package='munsellinterpol' )
    
    df = read.table( path, header=T )        
    
    printf( "---------  testOptimals()  %d samples -----------------------", nrow(df) )
       
    xyY = as.matrix( df )
    
    osname  = Sys.info()[ 'sysname' ]
    solaris = grepl( 'sun', osname, ignore.case=TRUE )    
    
    out = TRUE
    
    for( hcinterp in c('bilin','bicub') )
        {
        for( vinterp in c('lin','cub') )
            {
            #   go backwards xyY -> HVC
            printf( "-----  hcinterp='%s',  vinterp='%s'  -----", hcinterp, vinterp )
            
            time_start  = gettime()
            
            res = xyYtoMunsell( xyY, warn=FALSE, perf=TRUE, hcinterp=hcinterp, vinterp=vinterp )
            
            time_elapsed = gettime() - time_start
            
            #   print( res )
            #   return(FALSE)
            
            HVC = res$HVC            
            
            mask    = is.na( HVC[ ,1] )
            
            failures = sum( mask )

            printf( "testOptimals(). There were %d inversion failures, out of %d samples.  time=%g sec.  %g/sample.  OS=%s",
                                failures, nrow(xyY), time_elapsed, time_elapsed/nrow(xyY), osname )

            limit   = ifelse( solaris, 5, 0 )   # with solaris, 5 errors were detected in CRAN testing
                
            if( limit < failures )
                {
                colnames(xyY)   = c('x','y','Y')                
                colnames(HVC)   = c('H','V','C')
                df  = data.frame( row.names=1:failures )
                df$xyY  = xyY[mask, , drop=FALSE]                
                df$HVC  = HVC[mask, , drop=FALSE]
                print( df )
                
                #print( res )
                out = FALSE
                }
                
            printf( "Performance:")
            cat( "Time Elapsed 5-number summary:  " )
            cat( fivenum(res$time.elapsed,na.rm=T), '\n' )        
            cat( "Iterations 5-number summary:  " )
            cat( fivenum(res$iterations,na.rm=T), '\n' )    
            cat( "Evaluations 5-number summary:  " )
            cat( fivenum(res$evaluations,na.rm=T), '\n' )    
            
            if( max( res$iterations, na.rm=T ) == 100 )
                {
                idx =  which( res$iterations == 100 )   # ; print(idx)
                printf( "There were %d samples that failed to converge.", length(idx) )
                df  = res[ idx, , drop=FALSE ]
                print(df)
                }

            if( out )
                {
                #   do round-trip
                xyY.back    = MunsellToxyY( HVC, warn=FALSE,  hcinterp=hcinterp, vinterp=vinterp )$xyY
                
                delta   = rowSums( abs(xyY - xyY.back) )
                
                #   ignore pure black
                mask        = xyY[ ,3]==0  &  xyY.back[ ,3]==0
                delta[mask] = 0
                
                cat( "Round trip xyY -> HVC -> xyY  inversion error 5-number summary:  " )
                cat( fivenum(delta), '\n' )               

                idx = which.max( delta )
                df  = data.frame( row.names=1 )
                df$xyY      = xyY[ idx, , drop=F ]                
                df$HVC      = HVC[ idx, , drop=F ]
                df$xyY.back = xyY.back[ idx, , drop=F ]
                printf(  "Maximum inversion error occurs for this one:" )
                print( df )
                }
            }
        }
            
    return( out )
    }
     
     
     
testReals <- function()
    {
    df.real     = subset( Munsell2xy, real==TRUE )
    
    printf( "----------------  testReals()  %d samples -----------------------", nrow(df.real) )
    
    HVC         = cbind( df.real$H, df.real$V, df.real$C )
    xyY         = cbind( df.real$x, df.real$y, YfromV(df.real$V) )
    
    #   go backwards xyY -> HVC
    time_start  = gettime()
    
    res = xyYtoMunsell( xyY, warn=FALSE, perf=TRUE )
    
    time_elapsed = gettime() - time_start
    
    mask    = is.na( res$HVC[ ,1] )
    
    failures = sum( mask )
    
    printf( "testReals().  There were %d inversion failures, out of %d samples.  time=%g sec.  %g/sample.",
                        failures, nrow(xyY), time_elapsed, time_elapsed/nrow(xyY) )
                        

    if( 0 < failures )
        {
        colnames(HVC)   = c('H','V','C')
        colnames(xyY)   = c('x','y','Y')
        df  = data.frame( row.names=MunsellNameFromHVC( HVC[mask, ] ) )
        df$HVC  = HVC[mask, ]
        df$xyY  = xyY[mask, ]
        print( df )
        }
        
    printf( "Performance:")
    cat( "Time Elapsed 5-number summary:  " )
    cat( fivenum(res$time.elapsed,na.rm=T), '\n' )        
    cat( "Iterations 5-number summary:  " )
    cat( fivenum(res$iterations,na.rm=T), '\n' )    
    cat( "Evaluations 5-number summary:  " )
    cat( fivenum(res$evaluations,na.rm=T), '\n' )    
            
        
    
    #   compare HVC and res$HVC
    HVC.delta   = abs(HVC - res$HVC)
    HVC.delta[ ,1]  = pmin( HVC.delta[ ,1], 100 - HVC.delta[ ,1] )
    delta   = rowSums( HVC.delta )
    cat( "Round trip HVC -> xyY -> HVC  inversion error 5-number summary:  " )
    cat( fivenum(delta), '\n' )
    idx = which.max( delta )
    df  = data.frame( row.names=1 )
    df$HVC      = HVC[ idx, , drop=F ]
    df$xyY      = xyY[ idx, , drop=F ]
    df$HVC.back = res$HVC[ idx, , drop=F ]
    printf(  "Maximum inversion error occurs for this one:" )
    print( df )
         

    return( failures == 0 )
    }
     
     
testNeutrals <- function()
    {
    #   check that Chroma is small, and finite
    RGB = matrix( 0:255, 256, 3 )
    colnames(RGB)   = c('R','G','B')
    
    printf( "-----------  testNeutrals()   %d samples  -----------------------", nrow(RGB) )
          
    HVC = sRGBtoMunsell( RGB )
    
    chroma      = HVC[ ,3]
    mask        = is.na(chroma) 
    failures    = sum(mask)
    if( 0 < failures )
        {
        printf( "testNeutrals().  There were %d failures to convert.", failures )
        df  = data.frame( row.names=which(mask) )
        df$RGB  = RGB[mask, ]
        print( df )
        }    
        
    tol = 1.e-13
    mask    = (is.finite(chroma) & tol < chroma)
    count   = sum( mask  )
    if( 0 < count )
        {
        printf( "testNeutrals().  There were %d chromas > %g.", count, tol )
        df  = data.frame( row.names=which(mask) )
        df$RGB  = RGB[mask, ]
        df$Chroma   = chroma[mask]        
        print( df )
        }        
        
    #   now go back
    res = MunsellTosRGB( HVC )
    
    RGB.delta   = abs(RGB - res$RGB)
    delta   = rowSums( RGB.delta )
    cat( "Round-trip error  (RGB -> HVC -> RGB)  5-number summary:  " )
    cat( fivenum(delta), '\n' )    
    
    return( failures==0  &&  count==0 )
    }
    
    
testNearNeutrals <- function()
    {
    #   check that Chroma is small, and finite
    RGB = matrix( 0, 0, 3 )
    colnames(RGB)   = c('R','G','B')
        
    for( k in 10:255 )
        {
        RGB = rbind( RGB, matrix(k,3,3) - diag(3) )
        }
        
    printf( "-------  testNearNeutrals()  %d samples   -----------------------", nrow(RGB) )
              
        
    HVC = sRGBtoMunsell( RGB )
    
    chroma      = HVC[ ,3]
    mask        = is.na(chroma) 
    failures    = sum(mask)
    if( 0 < failures )
        {
        printf( "testNearNeutrals().  There were %d failures to convert.", failures )
        df  = data.frame( row.names=which(mask) )
        df$RGB  = RGB[mask, ]
        print( df )
        return(FALSE)
        }    
        
    tol = 0.30
    mask    = (is.finite(chroma) & tol < chroma)
    count   = sum( mask  )
    if( 0 < count )
        {
        printf( "testNearNeutrals().  There were %d chromas > %g.", count, tol )
        df  = data.frame( row.names=which(mask) )
        df$RGB      = RGB[mask, ]
        df$Chroma   = chroma[mask]
        print( df )
        return(FALSE)
        }        
        
        
    #   now go back
    res         = MunsellTosRGB( HVC )
    RGB.delta   = abs(RGB - res$RGB)
    delta   = rowSums( RGB.delta )
    cat( "Round-trip error  (RGB->HVC->RGB)  5-number summary:  " )
    cat( fivenum(delta), '\n' )         

    tol = 0.005
    if( tol < max(delta) )
        {
        printf( "Maximum round-trip error = %g > %g.", max(delta), tol )
        return(FALSE)
        }
    
    return( TRUE )
    }
    
testDarks <- function()
    {
    rgbmax  = 8  # 10    # 5
    
    RGB = as.matrix( expand.grid( R=0:rgbmax, G=0:rgbmax, B=0:rgbmax ) )    

    printf( "---------------------  testDarks() %d samples   -----------------------", nrow(RGB) )    

    HVC = sRGBtoMunsell( RGB )
    
    chroma      = HVC[ ,3]
    mask        = is.na(chroma) 
    failures    = sum(mask)
    if( 0 < failures )
        {
        printf( "testDarks().  There were %d failures to convert.", failures )
        df  = data.frame( row.names=which(mask) )
        df$RGB  = RGB[mask, , drop=FALSE ]
        print( df )
        return(FALSE)
        }    
        
    #   now go back
    res         = MunsellTosRGB( HVC )
    RGB.delta   = abs(RGB - res$RGB)
    delta   = rowSums( RGB.delta )
    cat( "Round-trip error  (RGB->HVC->RGB)  5-number summary:  " )
    cat( fivenum(delta), '\n' )        
        
    return( failures==0 )
    }
     
     
{  
x = gettime()   # load microbenchmark


if( testCentroids() )
    printf( "testCentroids() passed." )
else
    stop( "testCentroids() failed !", call.=FALSE )


if( testNeutrals() )
    printf( "testNeutrals() passed." )
else
    stop( "testNeutrals() failed !", call.=FALSE )

if( testNearNeutrals() )
    printf( "testNearNeutrals() passed." )
else
    stop( "testNearNeutrals() failed !", call.=FALSE )

if( testDarks() )
    printf( "testDarks() passed." )
else
    stop( "testDarks() failed !", call.=FALSE )

if( testReals() ) 
    printf( "testReals() passed." )
else
    stop( "testReals() failed !", call.=FALSE )    
    
if( testOptimals() )
    printf( "testOptimals() passed." )
else
    stop( "testOptimals() failed !", call.=FALSE )

        

printf(  "Passed all Munsell Transforms tests !" )
}     