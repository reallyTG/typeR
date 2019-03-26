

library( spacesRGB )

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
    
    
testRGB <- function()
    {
    printf( "---------------------  testRGB()  -----------------------" )
        
    #   make an ACES space
    #theOETF     = general.RRT( redmod='1.1+pinv' )  *  general.PODT( REC709_PRI, Ymax=100, surround='dim' )  *  sRGB.EOTF^-1 
    #theEOTF     = sRGB.EOTF 
    #ok  = installRGB( 'test-ACES', scene=AP0_PRI, OETF=theOETF, EOTF=theEOTF )
    #if( ! ok )  return(FALSE)
        
        
    # make random signal RGBs   
    set.seed(0)    
    count   = 100000
    
    RGB         = matrix( runif(3*count,max=255), ncol=3 )
    rownames(RGB)   = sprintf( "%04d", 1:count )
    colnames(RGB)   = c('R','G','B')
            
    data.space    = summaryRGB( 1 )
    
    if( nrow(data.space) == 0 )
        {
        printf(  "No RGB spaces are installed !" )    
        return(FALSE)
        }
        
    
    for( k in 1:nrow(data.space) )
        {
        space   = rownames(data.space)[k]
        
        for( which in c('scene','display') )
            {
            time_start      = gettime()

            df              = XYZfromRGB( RGB, space=space, which=which, max=255 )
            if( any(df$OutOfGamut) )
                {
                printf(  "For space %s, in XYZfromRGB(), %d of %d RGBs were flagged as out-of-gamut.",
                                space, sum(df$OutOfGamut), length(df$OutOfGamut) )
                return(FALSE)
                }        

            XYZ             = df$XYZ    
            RGB.back        = RGBfromXYZ( XYZ, space=space, which=which, max=255 )$RGB      #; print( 'RGB OK' )
            
            time_elapsed    = gettime() - time_start
            
            delta   = rowSums( abs(RGB - RGB.back) )  
            
            printf( "%-11s  RGB ->  %7s XYZ -> RGB    max(delta)=%g   %d samples at %g sec/sample", 
                                space, which, max(delta), count, time_elapsed/count )
             
            if( which == 'scene' )
                {
                OETF   = data.space$OETF[k]
                tol = ifelse( grepl('~',OETF), 5.e-12, 5.e-7 )    # pure gamma gives problems near 0 !
                }
            else
                {
                EOTF   = data.space$EOTF[k]
                tol = ifelse( grepl('~',EOTF), 5.e-12, 5.e-7 )    # pure gamma gives problems near 0 !
                }
            
            failures = sum( tol < delta )   
            if( 0 < failures )
                {
                idx = which.max(delta)        
                printf(  "There were %d  %s -> XYZ -> %s failures.  Max error = %g > %g",
                            failures, space, space, delta[idx], tol )

                df  = data.frame( row.names=1 )
                df$RGB          = RGB[idx, ,drop=FALSE]
                df$XYZ          = XYZ[idx, ,drop=FALSE]
                df$RGB.back     = RGB.back[idx, ,drop=FALSE]        
                print( df )
                
                return(FALSE)
                }
            }
            
        #   test pure black
        black   = c(0,0,0)
        if( ! identical( black, as.numeric(RGBfromXYZ( XYZfromRGB(black,space=space)$XYZ, space=space )$RGB ) ) )
            {
            printf(  "%s -> XYZ -> %s.back .  pure black not preserved.", space, space )
            return(FALSE)
            }        
            
        #   test pure white
        white   = c(1,1,1)
        delta   = white - as.numeric( RGBfromXYZ( XYZfromRGB(white,space=space)$XYZ, space=space )$RGB )
        tol     = 5.e-16
        if( tol < max(abs(delta)) )
            {
            printf(  "%s -> XYZ -> %s.back .  pure white not preserved.  delta=%g > %g", 
                            space, space, delta, tol )
            return(FALSE)
            }
            
            
        #   test rownames
        if( ! identical( rownames(RGB), rownames(RGB.back) ) )
            {
            printf( "%s  -> XYZ -> %s .back .  rownames not preserved.", space, space )
            return(FALSE)
            }
        }

        
    return( TRUE )
    }
     
     
     
#   make points outside the gamut on purpose     
testGamut  <- function()
    {
    printf( "---------------------  testGamut()  -----------------------" )
        
    #   make an ACES space
    theOETF     = general.RRT( redmod='1.1+pinv' )  *  general.PODT( REC709_PRI, Ymax=100, surround='dim' )  *  sRGB.EOTF^-1 
    theEOTF     = sRGB.EOTF 
    ok  = installRGB( 'test-ACES', scene=AP0_PRI, OETF=theOETF, EOTF=theEOTF )
    if( ! ok )  return(FALSE)
    
    domain  = domain(theOETF) #; print(domain)
    if( ncol(domain) != 3 ) return(FALSE)   # something is wrong !
    
    edge    = domain[2, ] - domain[1, ]
    center  = colMeans(domain)  #; print(center)
    
    # make random scene RGBs that are just outside the domain box
    set.seed(0)    
    count   = 1000
    
    RGBlin  = matrix( runif(3*count,min=-1,max=1), ncol=3 )
    
    #   push to boundary
    rmax    = apply( abs(RGBlin), 1, max ) #; print(rmax)
    
    RGBlin  = RGBlin / rmax #; print(RGBlin)
    
    RGBlin  = matrix(center,count,3,byrow=T)  +  matrix( 1.01*edge/2 ,count,3,byrow=T) * RGBlin  #;  print(RGBlin)
    
    time_start      = gettime()    
    
    df  = SignalRGBfromLinearRGB( RGBlin, space='test-ACES', which='scene' )    #; print(df)
    
    time_elapsed    = gettime() - time_start
    
    RGB = df$RGB
    
    #   every row of RGB should between 0 and 1, or all NAs
    myfun   <- function( RGB )
        {
        if( all(is.na(RGB)) )   return(TRUE)
        
        if( all( 0<=RGB & RGB<=1 ) )    return(TRUE)
        
        #   print( "bad RGB=%g,%g,%g", RGB[1], RGB[2], RGB[3] )
        
        return(FALSE)
        }
    
    mask    = apply( RGB, 1, myfun ) #; print(mask)
    
    if( any( ! mask ) )
        {
        idx = which( ! mask )[1]
        print( "bad RGB=%g,%g,%g", RGB[idx,1], RGB[idx,2], RGB[idx,3] )
        return(FALSE)
        }
        
    #   all should be outside
    outside = df$OutOfGamut
    if( any( ! outside ) )
        {
        idx = which( ! outside )[1]
        print( "bad RGBlin=%g,%g,%g", RGBlin[idx,1], RGBlin[idx,2], RGBlin[idx,3] )
        return(FALSE)
        }
    
    printf( "Transformed %d ACES samples at %g sec/sample.", count, time_elapsed/count )
    
    return( TRUE )    
    }
     
        
x = gettime()   # load microbenchmark
 
if( ! testRGB() )       stop( "testRGB() failed !", call.=FALSE )

if( ! testGamut() )     stop( "testGamut() failed !", call.=FALSE )

printf(  "\nPassed all Conversion tests !" )
     