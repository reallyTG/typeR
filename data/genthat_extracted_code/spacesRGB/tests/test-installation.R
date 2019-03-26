
library( spacesRGB )

options( width=144 )
    
printf <- function( msg, ... )
    {    
    mess = sprintf( msg[1], ... )    # should this really be msg[1] ?
    cat( mess, '\n' )   #, file=stderr() )
    }
    
XYZ2xyY <- function( XYZ ){

xyY <- cbind(NA_real_, NA_real_, XYZ[ ,2])
rownames(xyY) = rownames(XYZ)
colnames(xyY) = c('x','y','Y')

denom       = rowSums( XYZ )
w <- which(0<denom  &  0<=XYZ[ ,2])
if (length(w)>0){
xyY[w,1]    = XYZ[w,1] / denom[w]    # (XYZ[w,1]+XYZ[w,2]+XYZ[w,3])
xyY[w,2]    = XYZ[w,2] / denom[w]    # (XYZ[w,1]+XYZ[w,2]+XYZ[w,3])
}
xyY
}


xyY2XYZ <- function( xyY ){

xyY = matrix( xyY, ncol=3 )

XYZ <- cbind( NA_real_, xyY[,3], NA_real_)
rownames(XYZ) = rownames(xyY)
colnames(XYZ) = c('X','Y','Z')

w <- which( xyY[,2] != 0  &  0 <= xyY[,3] )    # was 0 < xyY[ ,2]

if (length(w)>0){
xyY_sub = xyY[w, ,drop=FALSE]
mult    =  xyY_sub[ ,3] / xyY_sub[ ,2]
XYZ[w,1] <- mult * xyY_sub[ ,1]
XYZ[w,3] <- mult * (1-xyY_sub[ ,1]-xyY_sub[ ,2])
}

#   treat Y=0 as a special case - pure black
w <- which( xyY[,3] == 0 )
if( length(w) > 0 )
    XYZ[w,1:3] = 0

XYZ
}



    
testInstallation <- function()
    {
    printf( "---------------------  testInstallation()  -----------------------" )
        
    peak    = 0.95             

    space   = 'dummy'
    prim    = matrix( c(0.60,0.30,  0.31,0.61,  0.11,0.11 ), 3, 2, byrow=T )
    white   = c( 95, 100, 205 )     # note Y=100 instead of the usual 1

    if( ! installRGB( space, scene=list(primaries=prim,white=white), OETF=2, over=TRUE ) )
        {
        printf( "Cannot install space='%s'.", space )
        return(FALSE)
        }
        
    RGB     = diag(3)
    RGB     = rbind( RGB, c(1,1,1) )
    dim(white)  = c(1,3)
    prim    = rbind( prim, XYZ2xyY( white )[1:2] )  

        
    XYZ = XYZfromRGB( RGB, space=space )$XYZ
    xy  = XYZ2xyY( XYZ )[ , 1:2 ]
    
    delta   = rowSums( abs(xy - prim) )  #; print(max(delta))
    
    tol = 5.e-14   
    failures = sum( tol < delta )   
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf(  "There were %d  chromaticity failures.  Max error = %g",
                    failures, delta[idx] )

        df  = data.frame( row.names=1 )
        df$prim         = prim[idx, ,drop=FALSE]
        df$xy           = xy[idx, ,drop=FALSE]
        df$delta        = delta[idx]
        print( df )
        
        return(FALSE)
        }    
        
    #   now go from white to RGB
    theSpace    = getRGB(space)
    XYZ.white   = getWhiteXYZ( space, which='scene' )   #theSpace$whiteXYZ   # xyY2XYZ( c(white,1) )
    RGB.peak    = c(1,1,1)
    
    RGB.white   = RGBfromXYZ( XYZ.white, space, TF=1 )$RGB  ; print( RGB.white )
    delta       =  abs(RGB.white - RGB.peak)  ; cat( 'delta=', delta, '\n' )
    failures    = sum( tol < delta )   
    if( 0 < failures )
        {
        idx = which.max(delta)        
        printf(  "There were %d RGB.white failures.  Max error = %g",
                    failures, delta[idx] )
        return(FALSE)
        }

        
    
    return(TRUE)
    }
    
    
if( ! testInstallation() )       stop( "testInstallation() failed !", call.=FALSE )


printf(  "\nPassed all Installation tests !" )    
