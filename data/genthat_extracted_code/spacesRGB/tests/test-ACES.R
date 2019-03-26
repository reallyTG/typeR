

if( 1 )
{
library( spacesRGB )
}


path = system.file( "CGATS.R", package='spacesRGB' )
source( path )


options( width=256 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }

testACES <- function( path="test_values.txt", tol.RGB=1e-5, tol.XYZ=5e-3, tol.RGBsce=5e-5, subset=NULL, redmod='1.1' )
    {
    data    = readCGATS( path )
    if( is.null(data) ) return(NULL)
    
    n           = length(data)
    out         = list()    #vector(n,mode='list')
    #   names(out)  = names(data)
    
    invalid = integer(0)
    
    for( i in 1:n )
        {
        theTable    = data[[i]]
        
        m   = nrow(theTable)
        
        theName = names(data)[i]
        
        theOETF = NULL             
        theEOTF = NULL
        theOOTF = NULL   
        
        if( ! is.null(subset)  &&  ! theName %in% subset )  next    # ignore this table
        
        if( theName == '5.1' )
            {
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3D60_PRI, Ymax=48 )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )         
            #aces2signal = theOETF
            #signal2XYZ  = theEOTF      *  XYZfromRGB.TF( P3D60_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '5.2' )
            {
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3D65_PRI, Ymax=48 )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF( P3D65_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
        else if( theName == '5.3' )
            {
            #   set observerWP to D60 so there is no CAT
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3D65_PRI, Ymax=48, observer=P3D60_PRI[4,] )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF( P3D65_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
        else if( theName == '5.4' )
            {
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3D65_PRI, Ymax=48, limiting_pri=REC709_PRI )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF( P3D65_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '5.5' )
            {
            #   set observerWP to D60 so there is no CAT            
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3DCI_PRI, Ymax=48, observer=P3D60_PRI['W',] )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF( P3DCI_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '5.6' )
            {
            #   set observerWP to D65 so there IS a CAT            
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( P3DCI_PRI, Ymax=48, observer=P3D65_PRI['W',] )  *  power.OETF( 2.6 )
            theEOTF     = power.EOTF( 2.6 )
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF( P3DCI_PRI, 48 )
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '5.7' )
            {
            theOETF     = general.RRT( redmod=redmod )  * general.PODT( NULL, Ymax=48 )  *  DCDM.EOTF^-1
            theEOTF     = DCDM.EOTF
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  affine.TF(0,48)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
        else if( theName == '5.8' )
            {
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( NULL, Ymax=48, limiting_pri=P3D60_PRI )  *  DCDM.EOTF^-1
            theEOTF     = DCDM.EOTF
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  affine.TF(0,48)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
        else if( theName == '5.9' )
            {
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( NULL, Ymax=48, limiting_pri=P3D65_PRI )  *  DCDM.EOTF^-1
            theEOTF     = DCDM.EOTF
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  affine.TF(0,48)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
            
        else if( theName == '6.1' )
            {
            #   Rec709 -  100 nit
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC709_PRI, Ymax=100, surround='dim' )  *  BT.1886.EOTF()^-1
            theEOTF     = BT.1886.EOTF()
            #aces2signal = theOETF
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC709_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }            
        else if( theName == '6.2' )
            {
            #   Rec709 D60sim -  100 nit
            #   set observerWP to D60 so there is NO CAT            
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC709_PRI, Ymax=100, observer=P3D60_PRI['W',], surround='dim' )  *  BT.1886.EOTF()^-1
            theEOTF     = BT.1886.EOTF()
            #aces2signal = theOETF
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC709_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '6.3' )
            {
            #   Rec2020 -  100 nit
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC2020_PRI, Ymax=100, surround='dim' )  *  BT.1886.EOTF()^-1
            theEOTF     = BT.1886.EOTF()
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC2020_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }    
        else if( theName == '6.4' )
            {
            #   Rec2020 -  (P3-D65 Limited)  100 nit
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC2020_PRI, Ymax=100, limit=P3D65_PRI, surround='dim' )  *  BT.1886.EOTF()^-1
            theEOTF     = BT.1886.EOTF()
            #aces2signal = theOETF            
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC2020_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }    
        else if( theName == '6.5' )
            {
            #   Rec2020 -  (Rec709 Limited)  100 nit
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC2020_PRI, Ymax=100, limit=REC709_PRI, surround='dim' )  *  BT.1886.EOTF()^-1
            theEOTF     = BT.1886.EOTF()
            #aces2signal = theOETF
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC2020_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }    
            
        else if( theName == '7.1' )
            {
            #   sRGB -  100 nit
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC709_PRI, Ymax=100, surround='dim' )  *  sRGB.EOTF^-1  #; print( str(theOETF) )
            theEOTF     = sRGB.EOTF
            #aces2signal = theOETF 
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC709_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }
        else if( theName == '7.2' )
            {
            #   sRGB D60sim -  100 nit
            #   set observerWP to D60 so there is NO CAT            
            theOETF     = general.RRT( redmod=redmod )  *  general.PODT( REC709_PRI, Ymax=100, observer=P3D60_PRI['W',], surround='dim' )  *  sRGB.EOTF^-1
            theEOTF     = sRGB.EOTF
            #aces2signal = theOETF             
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(REC709_PRI,100)
            #aces2XYZ    = aces2signal  *  signal2XYZ
            }

            
        else if( theName == '8.1' )
            {
            theOOTF     = general.OOTF( disp=P3D65_PRI, Ymid=7.2, Ymax=108, redmod=redmod ) #* affine.TF(0,108)
            theEOTF     = PQ.EOTF(10000/108)
            #aces2signal = theOOTF  *  theEOTF^-1
            #aces2XYZ    = theOOTF  *  XYZfromRGB.TF(P3D65_PRI,108)
            #signal2XYZ  = theEOTF  *  XYZfromRGB.TF(P3D65_PRI,108)      # * affine.TF(0,108)^-1 * XYZfromRGB.TF(P3D65_PRI,108)
            }
        else if( theName == '9.1' )
            {
            theOOTF     = general.OOTF( disp=REC2020_PRI, Ymid=15, Ymax=1000, redmod=redmod )   #* affine.TF( 0, 1000 )   
            theEOTF     = PQ.EOTF(10000/1000)
            #aces2signal = theOOTF  *  theEOTF^-1
            #aces2XYZ    = theOOTF * XYZfromRGB.TF(REC2020_PRI,1000)
            #signal2XYZ  = theEOTF * XYZfromRGB.TF(REC2020_PRI,1000)
            }
        else if( theName == '9.2' )
            {
            theOOTF     = general.OOTF( disp=REC2020_PRI, Ymid=15, Ymax=2000, redmod=redmod )   #* affine.TF( 0, 2000 )
            theEOTF     = PQ.EOTF(10000/2000)            
            #aces2signal = theOOTF  *  theEOTF^-1            
            #aces2XYZ    = theOOTF * XYZfromRGB.TF(REC2020_PRI,2000)
            #signal2XYZ  = theEOTF * XYZfromRGB.TF(REC2020_PRI,2000)
            }            
        else if( theName == '9.3' )
            {
            theOOTF     = general.OOTF( disp=REC2020_PRI, Ymid=15, Ymax=4000, redmod=redmod )   #* affine.TF( 0, 4000 )
            theEOTF     = PQ.EOTF(10000/4000)            
            #aces2signal = theOOTF * theEOTF^-1            
            #aces2XYZ    = theOOTF * XYZfromRGB.TF(REC2020_PRI,4000)
            #signal2XYZ  = theEOTF * XYZfromRGB.TF(REC2020_PRI,4000)
            }            
        else if( theName == '9.4' )
            {
            theOOTF     = general.OOTF( disp=REC2020_PRI, Ymid=15, Ymax=1000, redmod=redmod )
            hlg.OETF    = HLG.OETF()
            theEOTF     = hlg.OETF^-1 * HLG.OOTF(Lw=1000/1000)            
            #aces2signal = theOOTF * theEOTF^-1
            #aces2XYZ    = theOOTF * XYZfromRGB.TF(REC2020_PRI,1000) 
            #signal2XYZ  = theEOTF * XYZfromRGB.TF(REC2020_PRI,1000)
            }
        else
            {
            printf( "WARN.  Table '%s' unknown.", theName )
            next
            }
            
        #   make a space called 'testACES'
        #   display primaries and whitepoint not necessary because they are in the metadata
        spacename = 'testACES'
        if( ! is.null(theOETF)  &&  ! is.null(theEOTF) )
            ok  = installRGB( spacename, scene=AP0_PRI, OETF=theOETF, EOTF=theEOTF, overwrite=TRUE )
        else if( ! is.null(theOOTF)  &&  ! is.null(theEOTF) )
            ok  = installRGB( spacename, scene=AP0_PRI, OOTF=theOOTF, EOTF=theEOTF, overwrite=TRUE )
        else
            {
            printf( "ERROR.  Bad transfer functions."  )
            return(NULL)
            }
            
        if( ! ok )
            {
            printf( "ERROR.  Cannot install RGB space '%s'.", spacename  )
            return(NULL)
            }
            
        if( is.null(theOOTF) )  theOOTF = getRGB( spacename )$OOTF
        
        if( is.null(theOETF) )  theOETF = getRGB( spacename )$OETF
        
        
        df = data.frame( row.names=theTable[ ,1] )
        
        aces.ref    = as.matrix( theTable[ ,2:4] )
        signal.ref  = as.matrix( theTable[ ,5:7] )
        xyY.ref     = as.matrix( theTable[ ,8:10] ) 
        XYZ.ref     = as.matrix( spacesXYZ::XYZfromxyY( xyY.ref ) )
        
        #   for aces.ref, override
        #aces.ref[4,1]   = 0.4048    # R of patch 'R'
        #aces.ref[7,1]   = 0.5530    # R of patch 'C'
        
        
        #   compare computed signal to reference signal, the OETF
        #  signal          = transfer( aces2signal, aces.ref )
        signal          = SignalRGBfromLinearRGB( aces.ref, space=spacename )$RGB
        df$delta.OETF   = apply( abs(signal - signal.ref), 1, max )
        ok.OETF         = df$delta.OETF < tol.RGB          # all absolute here
        df$status.OETF  = ifelse( ok.OETF, 'pass', 'FAILED' )
        
        #   compare computed EOTF to reference EOTF
        # XYZ             = transfer( signal2XYZ, signal.ref, domaincheck=TRUE )  #; print( spacesXYZ::xyYfromXYZ(XYZ) )
        XYZ             = XYZfromRGB( signal.ref, space=spacename, which='display' )$XYZ
        delta.EOTF      = abs(XYZ - XYZ.ref)            #   / XYZ.ref[ ,2]      #   'relativize' delta.EOTF, the denominator is replicated
        df$delta.EOTF   = apply( delta.EOTF, 1, max )
        ok.EOTF         = df$delta.EOTF < tol.XYZ  
        df$status.EOTF  = ifelse( ok.EOTF, 'pass', 'FAILED' )        
        
        #   compare computed OOTF to reference OOTF
        #   XYZ             = transfer( aces2XYZ, aces.ref, domaincheck=TRUE ) 
        XYZ             = XYZfromRGB( signal, space=spacename, which='display' )$XYZ
        delta.OOTF      = abs(XYZ - XYZ.ref)            #   / XYZ.ref[ ,2]      #   'relativize' delta.OOTF, the denominator is replicated
        df$delta.OOTF   = apply( delta.OOTF, 1, max )
        ok.OOTF         = df$delta.OOTF < tol.XYZ  
        df$status.OOTF  = ifelse( ok.OOTF, 'pass', 'FAILED' )
        
        
        if( is.invertible(theOETF) )
            {
            #   compare computed aces to reference aces,  the OETFinv
            #   aces                = transfer( aces2signal^-1, signal.ref )    #; print( aces )
            aces                = LinearRGBfromSignalRGB( signal.ref, space=spacename, which='scene' )$RGB
            df$delta.OETFinv    = apply( abs(aces - aces.ref), 1, max )
            ok.OETFinv          = df$delta.OETFinv < tol.RGBsce             # all absolute here
            df$status.OETFinv   = ifelse( ok.OETFinv, 'pass', 'FAILED' )
            }
        else
            ok.OETFinv  = rep(TRUE,nrow(df))
        
        
        if( is.invertible(theEOTF) )
            {
            #   compare computed signal to reference signal,  the EOTFinv
            # signal              = transfer( signal2XYZ^-1, XYZ.ref ) 
            signal              = RGBfromXYZ( XYZ.ref, space=spacename, which='display' )$RGB
            df$delta.EOTFinv    = apply( abs(signal - signal.ref), 1, max )
            ok.EOTFinv          = df$delta.EOTFinv < tol.RGB          # all absolute here
            df$status.EOTFinv   = ifelse( ok.EOTFinv, 'pass', 'FAILED' )
            }
        else
            ok.EOTFinv  = rep(TRUE,nrow(df))
        
        
        if( is.invertible(theOOTF) )
            {
            #   compare computed aces to reference aces,  the OOTFinv
            # aces                = transfer( aces2XYZ^-1, XYZ.ref )    #; print( aces )
            #   this takes 2 steps
            signal              = RGBfromXYZ( XYZ.ref, space=spacename, which='display' )$RGB
            aces                = LinearRGBfromSignalRGB( signal, space=spacename, which='scene' )$RGB
            df$delta.OOTFinv    = apply( abs(aces - aces.ref), 1, max )
            ok.OOTFinv          = df$delta.OOTFinv < tol.RGBsce          # all absolute here
            df$status.OOTFinv   = ifelse( ok.OOTFinv, 'pass', 'FAILED' )
            }
        else
            ok.OOTFinv  = rep(TRUE,nrow(df))
        

        
                        
        #   combine into final status
        status.final    = ok.OETF & ok.EOTF & ok.OOTF & ok.OETFinv & ok.EOTFinv & ok.OOTFinv
        df$status.final = ifelse( status.final, 'pass', 'FAILED' )
        
        invalid[theName]  = sum( ! status.final )
        
        out[[ theName ]]    = df
        }
    
    #   print( as.data.frame(invalid) )    
    
    return( out )
    }

    
if( 1 )
{
#   bump 2 tolerances from 5 to 6    
res =  testACES( tol.XYZ=6e-3, tol.RGBsce=6e-5, redmod="1.1+pinv" )  
 
if( is.null(res)  )       stop( "testACES() failed !  returned NULL.", call.=FALSE )

#   res is a list of data.frame's
listbad   = list()

for( theName in names(res) )
    {
    df  = res[[ theName ]]
    ok  = all( df$status.final == 'pass' )
    if( ! ok )
        listbad[[ theName ]]    = df
    }

if( 0 < length(listbad) )
    {
    print( listbad )
    
    stop( "testACES() failed !", call.=FALSE )
    }

printf(  "\nPassed all ACES tests !" )
}